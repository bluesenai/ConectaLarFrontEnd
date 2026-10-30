
import 'package:flutter/material.dart';
import 'tela_chat_bairro.dart';
import 'tela_inicial.dart';
import 'tela_peticoes_bairro.dart';
import 'tela_reclamacoes_bairro.dart';

class TelaBairro extends StatelessWidget {
  const TelaBairro({super.key});

  static const Color vermelho = Color(0xFFF5322C);
  static const Color fundo = Color(0xFF5C5052);
  static const Color bloco = Color(0xFF4D4244);

  @override
  Widget build(BuildContext context) {
    final largura = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: fundo,
      body: SafeArea(
        child: Column(
          children: [
            // CABEÇALHO
            Container(
              width: double.infinity,
              height: 63,
              color: vermelho,
              child: Row(
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.menu,
                      color: Colors.white,
                      size: 25,
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.notifications_none,
                      color: Colors.white,
                      size: 24,
                    ),
                  ),
                  const Spacer(),
                  const Expanded(
                    flex: 3,
                    child: Text(
                      'Bem-vindo ao\nseu bairro!',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        height: 1.1,
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                ],
              ),
            ),

            // BOTÕES
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(
                  horizontal: 22,
                  vertical: 24,
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: blocoBairro(
                            icone: Icons.chat_outlined,
                            titulo: 'CHAT',
                            aoClicar: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      const TelaChatBairro(),
                                ),
                              );
                            },
                          ),
                        ),
                        const SizedBox(width: 14),
                        Expanded(
                          child: blocoBairro(
                            icone: Icons.description_outlined,
                            titulo: 'PETIÇÕES',
                            aoClicar: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      const TelaPeticoesBairro(),
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 15),

                    Row(
                      children: [
                        Expanded(
                          child: blocoBairro(
                            icone: Icons.notification_important_outlined,
                            titulo: 'RECLAMAÇÕES',
                            aoClicar: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      const TelaReclamacoesBairro(),
                                ),
                              );
                            },
                          ),
                        ),
                        const SizedBox(width: 14),
                        Expanded(
                          child: blocoBairro(
                            icone: Icons.home_work_outlined,
                            titulo: 'SUA RUA',
                            aoClicar: () {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => const TelaInicial(),
                                ),
                              );
                            },
                          ),
                        ),
                      ],
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

  Widget blocoBairro({
    required IconData icone,
    required String titulo,
    required VoidCallback aoClicar,
  }) {
    return SizedBox(
      height: 96,
      child: Material(
        color: bloco,
        borderRadius: BorderRadius.circular(7),
        child: InkWell(
          borderRadius: BorderRadius.circular(7),
          onTap: aoClicar,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icone,
                color: Colors.white,
                size: 29,
              ),
              const SizedBox(height: 3),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 3),
                child: Text(
                  titulo,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 11,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
