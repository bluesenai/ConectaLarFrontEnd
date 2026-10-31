import 'package:flutter/material.dart';
import 'telas/tela_carregamento.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: TelaCarregamento(),
    );
  }
  
  // =========================
  // PETIÇÕES
  // =========================

  // LISTAR PETIÇÕES DA COMUNIDADE
  static Future<List<Map<String, dynamic>>> buscarPeticoes(
    int usuarioId,
  ) async {
    final url = Uri.parse('$baseUrl/peticao/listar').replace(
      queryParameters: {
        'usuarioId': usuarioId.toString(),
      },
    );

    final resposta = await http
        .get(url)
        .timeout(const Duration(seconds: 10));

    if (resposta.statusCode == 200) {
      final dados = jsonDecode(resposta.body) as List;

      return dados
          .map((item) => Map<String, dynamic>.from(item))
          .toList();
    }

    throw Exception(
      'Não foi possível carregar as petições: ${resposta.body}',
    );
  }

  // CRIAR PETIÇÃO
  static Future<Map<String, dynamic>> criarPeticao({
    required int usuarioId,
    required String titulo,
    required String descricao,
  }) async {
    final url = Uri.parse('$baseUrl/peticao/criar');

    final resposta = await http
        .post(
          url,
          headers: {
            'Content-Type': 'application/json',
          },
          body: jsonEncode({
            'usuarioId': usuarioId,
            'titulo': titulo,
            'descricao': descricao,
          }),
        )
        .timeout(const Duration(seconds: 10));

    if (resposta.statusCode == 201 ||
        resposta.statusCode == 200) {
      return jsonDecode(resposta.body)
          as Map<String, dynamic>;
    }

    String mensagem = resposta.body;

    try {
      final dados = jsonDecode(resposta.body);

      if (dados is Map && dados['erro'] != null) {
        mensagem = dados['erro'].toString();
      }
    } catch (_) {}

    throw Exception(
      mensagem.isNotEmpty
          ? mensagem
          : 'Não foi possível criar a petição.',
    );
  }

  // ASSINAR PETIÇÃO
  static Future<void> assinarPeticao({
    required int usuarioId,
    required int peticaoId,
  }) async {
    final url = Uri.parse(
      '$baseUrl/peticao/$peticaoId/assinar',
    );

    final resposta = await http
        .post(
          url,
          headers: {
            'Content-Type': 'application/json',
          },
          body: jsonEncode({
            'usuarioId': usuarioId,
          }),
        )
        .timeout(const Duration(seconds: 10));

    if (resposta.statusCode == 200) {
      return;
    }

    String mensagem = resposta.body;

    try {
      final dados = jsonDecode(resposta.body);

      if (dados is Map && dados['erro'] != null) {
        mensagem = dados['erro'].toString();
      }
    } catch (_) {}

    throw Exception(
      mensagem.isNotEmpty
          ? mensagem
          : 'Não foi possível assinar a petição.',
    );
  }

}
