import 'package:flutter/material.dart';
import 'tela_codigo_acesso.dart';
import 'tela_login.dart';

class TelaVizinhanca extends StatelessWidget {
  const TelaVizinhanca({super.key});

  @override
  Widget build(BuildContext context) {
    final tamanho = MediaQuery.of(context).size;

    final largura = tamanho.width;
    final altura = tamanho.height;

    return Scaffold(
      backgroundColor: const Color(0xFF991D19),

      body: SafeArea(
        child: Stack(
          children: [
            // =====================================================
            // FUNDO
            // =====================================================

            Container(
              width: double.infinity,
              height: double.infinity,
              color: const Color(0xFF991D19),
            ),

            // =====================================================
            // FORMA SUPERIOR ESQUERDA
            // =====================================================

            Positioned(
              top: -altura * 0.18,
              left: -largura * 0.35,
              child: Container(
                width: largura * 0.95,
                height: largura * 0.95,
                decoration: const BoxDecoration(
                  color: Color(0xFFD92C26),
                  shape: BoxShape.circle,
                ),
              ),
            ),

            // =====================================================
            // FORMA CENTRAL / DIREITA
            // =====================================================

            Positioned(
              top: -altura * 0.02,
              right: -largura * 0.60,
              child: Container(
                width: largura * 1.40,
                height: largura * 1.40,
                decoration: const BoxDecoration(
                  color: Color(0xFFB1211D),
                  shape: BoxShape.circle,
                ),
              ),
            ),

            // =====================================================
            // FORMA INFERIOR ESQUERDA
            // =====================================================

            Positioned(
              bottom: -altura * 0.08,
              left: -largura * 0.50,
              child: Container(
                width: largura * 1.10,
                height: largura * 1.10,
                decoration: const BoxDecoration(
                  color: Color(0xFFD92C26),
                  shape: BoxShape.circle,
                ),
              ),
            ),

            // =====================================================
            // FORMA INFERIOR DIREITA
            // =====================================================

            Positioned(
              bottom: -altura * 0.10,
              right: -largura * 0.40,
              child: Container(
                width: largura * 0.95,
                height: largura * 0.95,
                decoration: const BoxDecoration(
                  color: Color(0xFFEF302A),
                  shape: BoxShape.circle,
                ),
              ),
            ),

            // =====================================================
            // BOTÃO SUPERIOR
            // =====================================================

            IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },

                      padding: EdgeInsets.zero,

                      alignment: Alignment.centerLeft,

                      icon: const Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                        size: 30,
                      ),
                    ),

            // =====================================================
            // CONTEÚDO
            // =====================================================

            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // =================================================
                  // ÍCONE
                  // =================================================

                  Container(
                    width: largura * 0.38,
                    height: largura * 0.38,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),
                    padding: const EdgeInsets.all(13),
                    child: Image.asset(
                      'assets/images/iconeroda.png',
                      fit: BoxFit.contain,
                    ),
                  ),

                  SizedBox(height: altura * 0.10),

                  // =================================================
                  // ENTRAR EM UMA VIZINHANÇA
                  // =================================================

                  SizedBox(
                    width: largura * 0.68,
                    height: 42,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                const TelaCodigoAcesso(),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFFB7191E),
                        foregroundColor: Colors.white,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25),
                        ),
                      ),
                      child: const Text(
                        'Entrar em uma vizinhança',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 42),

                  // =================================================
                  // CRIAR UMA VIZINHANÇA
                  // =================================================

                  SizedBox(
                    width: largura * 0.68,
                    height: 42,
                    child: ElevatedButton(
                      onPressed: () {
                        // A tela de criação da vizinhança
                        // será feita posteriormente.
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFFB7191E),
                        foregroundColor: Colors.white,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25),
                        ),
                      ),
                      child: const Text(
                        'Criar uma vizinhança',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}