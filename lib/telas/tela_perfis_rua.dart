
import 'package:flutter/material.dart';

class TelaPerfisRua extends StatelessWidget {
  const TelaPerfisRua({super.key});

  static const Color fundo = Color(0xFF5C5052);
  static const Color bloco = Color(0xFF4D4244);
  static const Color vermelho = Color(0xFFB7191E);

  // Moradores de exemplo para montar a interface.
  // Depois podemos carregar os nomes reais do banco de dados.
  final List<String> moradores = const [
    'Morador 1',
    'Morador 2',
    'Morador 3',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: fundo,
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 38),

            // Logo da comunidade
            Container(
              width: 88,
              height: 88,
              decoration: const BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
              ),
              child: Padding(
                padding: const EdgeInsets.all(9),
                child: Image.asset(
                  'assets/images/icone.png',
                  fit: BoxFit.contain,
                  errorBuilder: (context, error, stackTrace) {
                    return const Icon(
                      Icons.home_work_outlined,
                      color: vermelho,
                      size: 48,
                    );
                  },
                ),
              ),
            ),

            const SizedBox(height: 10),

            const Text(
              'Perfis da rua',
              style: TextStyle(
                color: Colors.white,
                fontSize: 13,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 2),

            const Text(
              '••••••••••••',
              style: TextStyle(
                color: Colors.white70,
                fontSize: 8,
                letterSpacing: 1,
              ),
            ),

            const SizedBox(height: 12),

            // Lista de perfis
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                itemCount: moradores.length,
                itemBuilder: (context, index) {
                  return Container(
                    height: 40,
                    margin: const EdgeInsets.only(bottom: 12),
                    padding: const EdgeInsets.symmetric(horizontal: 6),
                    decoration: BoxDecoration(
                      color: bloco,
                      borderRadius: BorderRadius.circular(9),
                    ),
                    child: Row(
                      children: [
                        const Icon(
                          Icons.account_circle_outlined,
                          color: Colors.white,
                          size: 23,
                        ),

                        const SizedBox(width: 7),

                        Expanded(
                          child: Text(
                            moradores[index],
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 11,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),

            // Botão Voltar
            Padding(
              padding: const EdgeInsets.only(
                left: 32,
                right: 32,
                bottom: 24,
              ),
              child: SizedBox(
                width: 77,
                height: 27,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: vermelho,
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
            ),
          ],
        ),
      ),
    );
  }
}
