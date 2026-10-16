
import 'package:flutter/material.dart';

class TelaAssinarPeticao extends StatelessWidget {
  const TelaAssinarPeticao({super.key});

  static const Color fundo = Color(0xFF5C5052);
  static const Color vermelho = Color(0xFFCC302E);
  static const Color vermelhoEscuro = Color(0xFFB7191E);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: fundo,
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 28),

            // LOGO DA COMUNIDADE
            Container(
              width: 92,
              height: 92,
              padding: const EdgeInsets.all(10),
              decoration: const BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
              ),
              child: Image.asset(
                'assets/images/icone.png',
                fit: BoxFit.contain,
                errorBuilder: (context, error, stackTrace) {
                  return const Icon(
                    Icons.home_work_outlined,
                    color: vermelho,
                    size: 50,
                  );
                },
              ),
            ),

            const SizedBox(height: 25),

            const Text(
              'Assinar petição',
              style: TextStyle(
                color: Colors.white,
                fontSize: 11,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 38),

            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 34),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Petição selecionada',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 11,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 8),

            // PETIÇÃO SELECIONADA
            Container(
              height: 78,
              margin: const EdgeInsets.symmetric(horizontal: 34),
              padding: const EdgeInsets.fromLTRB(13, 10, 8, 8),
              decoration: BoxDecoration(
                color: vermelho,
                borderRadius: BorderRadius.circular(9),
              ),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'PETIÇÃO 1',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 11,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 7),
                  Text(
                    '****************',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 10,
                      letterSpacing: 0.5,
                    ),
                  ),
                  Spacer(),
                  Text(
                    '00 pessoas assinaram',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 11,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 29),

            // BOTÃO ASSINAR
            SizedBox(
              width: 84,
              height: 27,
              child: ElevatedButton(
                onPressed: () {
                  showDialog<void>(
                    context: context,
                    builder: (contextDialog) {
                      return AlertDialog(
                        backgroundColor: const Color(0xFFF0F0F0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        title: const Text(
                          'Assinado!',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Color(0xFFCC302E),
                            fontSize: 23,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        content: const Text(
                          'Sua assinatura ocorreu com sucesso!',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        actions: [
                          SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                              onPressed: () {
                                Navigator.of(contextDialog).pop();
                                Navigator.pop(context);
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: vermelhoEscuro,
                                foregroundColor: Colors.white,
                                elevation: 0,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(25),
                                ),
                              ),
                              child: const Text('Próximo'),
                            ),
                          ),
                        ],
                      );
                    },
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: vermelhoEscuro,
                  foregroundColor: Colors.white,
                  elevation: 0,
                  padding: EdgeInsets.zero,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                ),
                child: const Text(
                  'Assinar',
                  style: TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 10),

            // BOTÃO VOLTAR
            SizedBox(
              width: 84,
              height: 27,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: vermelhoEscuro,
                  foregroundColor: Colors.white,
                  elevation: 0,
                  padding: EdgeInsets.zero,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                ),
                child: const Text(
                  'Voltar',
                  style: TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
