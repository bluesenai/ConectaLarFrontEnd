import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class ApiService {
  static const String baseUrl = 'http://10.0.2.2:8080/raiz_do_endpoint';

  static const String _chaveLogado = 'usuario_logado';
  static const String _chaveEmail = 'email_usuario';
  static const String _chaveId = 'usuario_id';
  static const String _chaveNome = 'usuario_nome';

  // LOGIN
  static Future<bool> fazerLogin(String email, String senha) async {
    final url = Uri.parse('$baseUrl/usuario/login');

    final resposta = await http
        .post(
          url,
          headers: {'Content-Type': 'application/json'},
          body: jsonEncode({'email': email, 'senha': senha}),
        )
        .timeout(const Duration(seconds: 10));

    if (resposta.statusCode == 200) {
      final dados = jsonDecode(resposta.body) as Map<String, dynamic>;

      final prefs = await SharedPreferences.getInstance();

      await prefs.setBool(_chaveLogado, true);
      await prefs.setString(_chaveEmail, dados['email'].toString());
      await prefs.setInt(_chaveId, (dados['id'] as num).toInt());
      await prefs.setString(_chaveNome, dados['nome'].toString());

      print('DEBUG - Login realizado com sucesso');
      print('DEBUG - ID salvo: ${dados['id']}');

      return true;
    }

    print('DEBUG - Login recusado: ${resposta.statusCode}');
    return false;
  }

  // VERIFICA SE EXISTE UMA SESSÃO LOCAL
  static Future<bool> existeSessao() async {
    final prefs = await SharedPreferences.getInstance();
    final logado = prefs.getBool(_chaveLogado) ?? false;

    print('DEBUG - Sessão salva: $logado');
    print('DEBUG - Email salvo: ${prefs.getString(_chaveEmail)}');

    return logado;
  }

  // RECUPERA O EMAIL SALVO
  static Future<String?> obterEmailSalvo() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_chaveEmail);
  }

  // ENCERRA A SESSÃO LOCAL
  static Future<void> encerrarSessao() async {
    final prefs = await SharedPreferences.getInstance();

    await prefs.remove(_chaveLogado);
    await prefs.remove(_chaveEmail);
    await prefs.remove(_chaveId);
    await prefs.remove(_chaveNome);
  }

  // CRIAR COMUNIDADE / VIZINHANÇA
  static Future<Map<String, dynamic>> criarComunidade({
    required String cep,
    required String estado,
    required String cidade,
    required String bairro,
    required String rua,
  }) async {
    final url = Uri.parse('$baseUrl/comunidade/cadastrar');

    final resposta = await http
        .post(
          url,
          headers: {'Content-Type': 'application/json'},
          body: jsonEncode({
            'cep': cep,
            'estado': estado,
            'cidade': cidade,
            'bairro': bairro,
            'rua': rua,
          }),
        )
        .timeout(const Duration(seconds: 10));

    if (resposta.statusCode == 200) {
      return jsonDecode(resposta.body) as Map<String, dynamic>;
    }

    String mensagem = resposta.body;

    try {
      final dados = jsonDecode(resposta.body);

      if (dados is Map && dados['message'] != null) {
        mensagem = dados['message'].toString();
      }
    } catch (_) {
      // Mantém a mensagem original.
    }

    throw Exception(
      mensagem.isNotEmpty ? mensagem : 'Não foi possível criar a vizinhança.',
    );
  }

  static Future<int?> obterIdSalvo() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getInt(_chaveId);
  }

  static Future<String?> obterNomeSalvo() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_chaveNome);
  }

  static Future<Map<String, dynamic>> entrarComunidade({
    required int usuarioId,
    required String cep,
  }) async {
    final url = Uri.parse('$baseUrl/comunidade/entrar');

    final resposta = await http
        .post(
          url,
          headers: {'Content-Type': 'application/json'},
          body: jsonEncode({'usuarioId': usuarioId, 'cep': cep}),
        )
        .timeout(const Duration(seconds: 10));

    if (resposta.statusCode == 200) {
      final dados = jsonDecode(resposta.body);

      if (dados is Map<String, dynamic>) {
        return dados;
      }

      return {'mensagem': 'Entrada realizada com sucesso'};
    }

    String mensagem = resposta.body;

    try {
      final dados = jsonDecode(resposta.body);

      if (dados is Map && dados['message'] != null) {
        mensagem = dados['message'].toString();
      }
    } catch (_) {}

    throw Exception(
      mensagem.isNotEmpty ? mensagem : 'Não foi possível entrar na vizinhança.',
    );
  }

  static Future<Map<String, dynamic>> buscarMinhaComunidade(
    int usuarioId,
  ) async {
    final url = Uri.parse('$baseUrl/usuario/$usuarioId/comunidade');

    final resposta = await http.get(url).timeout(const Duration(seconds: 10));

    if (resposta.statusCode == 200) {
      return jsonDecode(resposta.body) as Map<String, dynamic>;
    }

    throw Exception(
      'Não foi possível carregar sua vizinhança: '
      '${resposta.body}',
    );
  }

  static Future<List<Map<String, dynamic>>> buscarMoradores(
    int comunidadeId,
  ) async {
    final url = Uri.parse('$baseUrl/comunidade/$comunidadeId/moradores');

    final resposta = await http.get(url).timeout(const Duration(seconds: 10));

    if (resposta.statusCode == 200) {
      final dados = jsonDecode(resposta.body) as List;

      return dados.map((item) => Map<String, dynamic>.from(item)).toList();
    }

    throw Exception(
      'Não foi possível carregar os moradores: '
      '${resposta.body}',
    );
  }

  static Future<List<dynamic>> buscarMensagens(int usuarioId) async {
    final resposta = await http.get(
      Uri.parse('$baseUrl/mensagem/listar?usuarioId=$usuarioId'),
    );

    if (resposta.statusCode == 200) {
      return jsonDecode(resposta.body) as List<dynamic>;
    }

    throw Exception('Erro ao carregar mensagens: ${resposta.statusCode}');
  }

  static Future<Map<String, dynamic>> enviarMensagem({
    required int usuarioId,
    required String texto,
  }) async {
    final resposta = await http.post(
      Uri.parse('$baseUrl/mensagem/enviar').replace(
        queryParameters: {'usuarioId': usuarioId.toString(), 'texto': texto},
      ),
    );

    if (resposta.statusCode == 200) {
      return jsonDecode(resposta.body) as Map<String, dynamic>;
    }

    throw Exception('Erro ao enviar mensagem: ${resposta.body}');
  }
}
