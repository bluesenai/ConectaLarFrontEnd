
import 'package:flutter/material.dart';

class TelaEditarConta extends StatefulWidget {
  const TelaEditarConta({super.key});

  @override
  State<TelaEditarConta> createState() => _TelaEditarContaState();
}

class _TelaEditarContaState extends State<TelaEditarConta> {
  static const Color vermelho = Color(0xFFF5322C);
  static const Color fundo = Color(0xFF5C5052);
  static const Color bloco = Color(0xFF4D4244);

  final TextEditingController nomeController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController senhaController = TextEditingController();
  final TextEditingController telefoneController = TextEditingController();

  bool mostrarSenha = false;

  @override
  void dispose() {
    nomeController.dispose();
    emailController.dispose();
    senhaController.dispose();
    telefoneController.dispose();
    super.dispose();
  }

  void salvarAlteracoes() {
    if (nomeController.text.trim().isEmpty ||
        emailController.text.trim().isEmpty ||
        senhaController.text.isEmpty ||
        telefoneController.text.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Preencha todos os campos.'),
        ),
      );
      return;
    }

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('A atualização da conta será conectada ao sistema.'),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: fundo,
      body: SafeArea(
        child: Column(
          children: [
            // CABEÇALHO
            Container(
              width: double.infinity,
              height: 100,
              color: vermelho,
              child: Row(
                children: [
                  IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: const Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                      size: 40,
                    ),
                  ),
                  const Expanded(
                    child: Text(
                      'INFORMAÇÕES DA CONTA',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(width: 48),
                ],
              ),
            ),

            // CONTEÚDO
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(
                  horizontal: 25,
                  vertical: 25,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const Icon(
                      Icons.account_circle_outlined,
                      color: Colors.white,
                      size: 85,
                    ),

                    const SizedBox(height: 10),

                    const Text(
                      'Edite suas informações',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 19,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 8),

                    const Text(
                      'Mantenha seus dados atualizados.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white70,
                        fontSize: 14,
                      ),
                    ),

                    const SizedBox(height: 28),

                    campoTexto(
                      titulo: 'Nome completo',
                      dica: 'Digite seu nome',
                      icone: Icons.person_outline,
                      controller: nomeController,
                    ),

                    const SizedBox(height: 18),

                    campoTexto(
                      titulo: 'E-mail',
                      dica: 'Digite seu e-mail',
                      icone: Icons.email_outlined,
                      controller: emailController,
                      teclado: TextInputType.emailAddress,
                    ),

                    const SizedBox(height: 18),

                    campoTexto(
                      titulo: 'Senha',
                      dica: 'Digite sua nova senha',
                      icone: Icons.lock_outline,
                      controller: senhaController,
                      senha: true,
                    ),

                    const SizedBox(height: 18),

                    campoTexto(
                      titulo: 'Telefone',
                      dica: 'Digite seu telefone',
                      icone: Icons.phone_outlined,
                      controller: telefoneController,
                      teclado: TextInputType.phone,
                    ),

                    const SizedBox(height: 30),

                    // BOTÃO SALVAR
                    SizedBox(
                      height: 55,
                      child: ElevatedButton(
                        onPressed: salvarAlteracoes,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: vermelho,
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(9),
                          ),
                        ),
                        child: const Text(
                          'SALVAR ALTERAÇÕES',
                          style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget campoTexto({
    required String titulo,
    required String dica,
    required IconData icone,
    required TextEditingController controller,
    TextInputType teclado = TextInputType.text,
    bool senha = false,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 8, left: 3),
          child: Text(
            titulo,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        TextField(
          controller: controller,
          keyboardType: teclado,
          obscureText: senha && !mostrarSenha,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 15,
          ),
          decoration: InputDecoration(
            hintText: dica,
            hintStyle: const TextStyle(
              color: Colors.white54,
              fontSize: 14,
            ),
            prefixIcon: Icon(
              icone,
              color: Colors.white70,
            ),
            suffixIcon: senha
                ? IconButton(
                    onPressed: () {
                      setState(() {
                        mostrarSenha = !mostrarSenha;
                      });
                    },
                    icon: Icon(
                      mostrarSenha
                          ? Icons.visibility_off
                          : Icons.visibility,
                      color: Colors.white70,
                    ),
                  )
                : null,
            filled: true,
            fillColor: bloco,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(9),
              borderSide: BorderSide.none,
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(9),
              borderSide: BorderSide.none,
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(9),
              borderSide: const BorderSide(
                color: vermelho,
                width: 1.5,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
