import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  static const String baseUrl = 'http://10.0.2.2:8080/raiz_do_endpoint';

  static Future<bool> fazerLogin(String email, String senha) async {
    final url = Uri.parse('$baseUrl/usuario/login');

    print('URL do login: $url');

    try {
      final resposta = await http
          .post(
            url,
            headers: {'Content-Type': 'application/json'},
            body: jsonEncode({'email': email, 'senha': senha}),
          )
          .timeout(const Duration(seconds: 10));

      print('Status HTTP: ${resposta.statusCode}');
      print('Resposta do servidor: ${resposta.body}');

      return resposta.statusCode == 200;
    } catch (e) {
      print('ERRO NA CONEXÃO COM O BACKEND: $e');
      rethrow;
    }
  }
}
