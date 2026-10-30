
import 'package:flutter/material.dart';

class TelaSeguranca extends StatelessWidget {
  const TelaSeguranca({super.key});

  static const Color vermelho = Color(0xFFF5322C);
  static const Color fundo = Color(0xFF5C5052);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: fundo,
      body: SafeArea(
        child: Column(
          children: [
            // CABEÇALHO VERMELHO
            Container(
              width: double.infinity,
              height: 100,
              color: vermelho,
              child: Row(
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.menu,
                      color: Colors.white,
                      size: 40,
                    ),
                  ),
                  const Spacer(),
                  const Expanded(
                    flex: 3,
                    child: Text(
                      'A segurança do\nseu bairro',
                      textAlign: TextAlign.right,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                        height: 1.1,
                      ),
                    ),
                  ),
                  const SizedBox(width: 20),
                ],
              ),
            ),

            // CONTEÚDO RESPONSIVO
            Expanded(
              child: LayoutBuilder(
                builder: (context, constraints) {
                  final altura = constraints.maxHeight;

                  return SingleChildScrollView(
                    child: ConstrainedBox(
                      constraints: BoxConstraints(
                        minHeight: altura,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // SETA PARA VOLTAR
                            Padding(
                              padding: const EdgeInsets.only(
                                left: 10,
                                top: 8,
                              ),
                              child: IconButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                icon: const Icon(
                                  Icons.arrow_back,
                                  color: Colors.white,
                                  size: 40,
                                ),
                              ),
                            ),

                            // PERFIL DO RESPONSÁVEL
                            SizedBox(height: altura * 0.015),

                            const Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.account_circle_outlined,
                                  color: Colors.white,
                                  size: 40,
                                ),
                                SizedBox(width: 8),
                                Text(
                                  'Fulaninho',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 17,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),

                            SizedBox(height: altura * 0.065),

                            // TÍTULOS DA TABELA
                            const Padding(
                              padding: EdgeInsets.symmetric(horizontal: 11),
                              child: Row(
                                children: [
                                  Expanded(
                                    flex: 5,
                                    child: Text(
                                      'DIAS DA ROTA',
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 17,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 6,
                                    child: Text(
                                      'HORARIOS DA ROTA',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 17,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),

                            SizedBox(height: altura * 0.025),

                            // DIAS E HORÁRIOS
                            const LinhaRota(
                              dia: 'SEGUNDA',
                              horario: '00H00',
                            ),
                            const LinhaRota(
                              dia: 'TERÇA',
                              horario: '00H00',
                            ),
                            const LinhaRota(
                              dia: 'QUARTA',
                              horario: '00H00',
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class LinhaRota extends StatelessWidget {
  final String dia;
  final String horario;

  const LinhaRota({
    super.key,
    required this.dia,
    required this.horario,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 11,
        right: 11,
        bottom: 17,
      ),
      child: Row(
        children: [
          Expanded(
            flex: 5,
            child: Text(
              dia,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 17,
              ),
            ),
          ),
          Expanded(
            flex: 6,
            child: Text(
              horario,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 17,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
