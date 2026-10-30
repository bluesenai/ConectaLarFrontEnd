
import 'package:flutter/material.dart';

class TelaContatoDesenvolvedor extends StatefulWidget {
  const TelaContatoDesenvolvedor({super.key});

  @override
  State<TelaContatoDesenvolvedor> createState() =>
      _TelaContatoDesenvolvedorState();
}

class _TelaContatoDesenvolvedorState
    extends State<TelaContatoDesenvolvedor> {
  static const Color vermelho = Color(0xFFF5322C);
  static const Color fundo = Color(0xFF5C5052);
  static const Color bloco = Color(0xFF4D4244);

  final TextEditingController nomeController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController mensagemController = TextEditingController();

  @override
  void dispose() {
    nomeController.dispose();
    emailController.dispose();
    mensagemController.dispose();
    super.dispose();
  }

  void enviarMensagem() {
    if (nomeController.text.trim().isEmpty ||
        emailController.text.trim().isEmpty ||
        mensagemController.text.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Preencha todos os campos.'),
        ),
      );
      return;
    }

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text(
          'Mensagem preenchida! O envio será conectado ao sistema.',
        ),
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
                      'CONTATO COM DESENVOLVEDOR',
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
                      Icons.mail_outline,
                      color: Colors.white,
                      size: 85,
                    ),

                    const SizedBox(height: 12),

                    const Text(
                      'Fale com a gente!',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 8),

                    const Text(
                      'Envie sua dúvida, sugestão ou relate algum problema.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white70,
                        fontSize: 14,
                      ),
                    ),

                    const SizedBox(height: 30),

                    campoTexto(
                      titulo: 'Nome',
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

                    const Text(
                      'Mensagem',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 8),

                    TextField(
                      controller: mensagemController,
                      maxLines: 6,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                      ),
                      decoration: InputDecoration(
                        hintText: 'Escreva sua mensagem...',
                        hintStyle: const TextStyle(
                          color: Colors.white54,
                          fontSize: 14,
                        ),
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

                    const SizedBox(height: 30),

                    SizedBox(
                      height: 55,
                      child: ElevatedButton(
                        onPressed: enviarMensagem,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: vermelho,
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(9),
                          ),
                        ),
                        child: const Text(
                          'ENVIAR MENSAGEM',
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
