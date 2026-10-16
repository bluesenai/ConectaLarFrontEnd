
import 'package:flutter/material.dart';
import 'tela_perfis_rua.dart';

class TelaChat extends StatefulWidget {
  const TelaChat({super.key});

  @override
  State<TelaChat> createState() => _TelaChatState();
}

class _TelaChatState extends State<TelaChat> {
  static const Color fundo = Color(0xFF5C5052);
  static const Color bloco = Color(0xFF4D4244);
  static const Color campo = Color(0xFF675B5D);

  final TextEditingController mensagemController =
      TextEditingController();

  final List<String> mensagens = [];

  @override
  void dispose() {
    mensagemController.dispose();
    super.dispose();
  }

  void enviarMensagem() {
    final mensagem = mensagemController.text.trim();

    if (mensagem.isEmpty) return;

    setState(() {
      mensagens.add(mensagem);
      mensagemController.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: fundo,
      body: SafeArea(
        child: Column(
          children: [
            // Cabeçalho do chat
            SizedBox(
              height: 65,
              child: Row(
                children: [
                  const SizedBox(width: 20),

                  // Bolinhas dos perfis: abrem a tela de participantes
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              const TelaPerfisRua(),
                        ),
                      );
                    },
                    child: const SizedBox(
                      width: 68,
                      height: 40,
                      child: Stack(
                        alignment: Alignment.centerLeft,
                        children: [
                          Positioned(
                            left: 0,
                            child: CircleAvatar(
                              radius: 10,
                              backgroundColor: Color(0xFFD7D2D2),
                            ),
                          ),
                          Positioned(
                            left: 15,
                            child: CircleAvatar(
                              radius: 10,
                              backgroundColor: Color(0xFFBDB7B8),
                            ),
                          ),
                          Positioned(
                            left: 30,
                            child: CircleAvatar(
                              radius: 10,
                              backgroundColor: Color(0xFFD7D2D2),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  const Spacer(),

                  IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                      size: 22,
                    ),
                  ),

                  const SizedBox(width: 10),
                ],
              ),
            ),

            // Área das mensagens
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 8,
                ),
                itemCount: mensagens.length,
                itemBuilder: (context, index) {
                  return Align(
                    alignment: Alignment.centerRight,
                    child: Container(
                      margin: const EdgeInsets.only(bottom: 10),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 9,
                      ),
                      constraints: BoxConstraints(
                        maxWidth:
                            MediaQuery.of(context).size.width * 0.75,
                      ),
                      decoration: BoxDecoration(
                        color: bloco,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Text(
                        mensagens[index],
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 13,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),

            // Campo para escrever e enviar
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 40,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 14,
                      ),
                      decoration: BoxDecoration(
                        color: campo,
                        borderRadius: BorderRadius.circular(25),
                      ),
                      child: TextField(
                        controller: mensagemController,
                        onSubmitted: (_) => enviarMensagem(),
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 13,
                        ),
                        decoration: const InputDecoration(
                          hintText: '',
                          border: InputBorder.none,
                          isCollapsed: true,
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(width: 4),

                  IconButton(
                    onPressed: enviarMensagem,
                    padding: EdgeInsets.zero,
                    constraints: const BoxConstraints(
                      minWidth: 24,
                      minHeight: 40,
                    ),
                    icon: const Icon(
                      Icons.send,
                      color: Color(0xFFB99D9D),
                      size: 21,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 4),
          ],
        ),
      ),
    );
  }
}
