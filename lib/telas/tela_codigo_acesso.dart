import 'package:flutter/material.dart';

class TelaCodigoAcesso extends StatefulWidget {
  const TelaCodigoAcesso({super.key});

  @override
  State<TelaCodigoAcesso> createState() => _TelaCodigoAcessoState();
}

class _TelaCodigoAcessoState extends State<TelaCodigoAcesso> {
  final TextEditingController cepController = TextEditingController();

  @override
  void dispose() {
    cepController.dispose();
    super.dispose();
  }

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
            // SETA VOLTAR
            // =====================================================

            Positioned(
              top: 20,
              left: 20,
              child: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                  size: 30,
                ),
              ),
            ),

            // =====================================================
            // CONTEÚDO
            // =====================================================

            Center(
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: largura * 0.11,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // =================================================
                    // ÍCONE
                    // =================================================

                    Center(
                      child: Container(
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
                    ),

                    SizedBox(height: altura * 0.10),

                    // =================================================
                    // CÓDIGO DE ACESSO
                    // =================================================

                    const Text(
                      'Código de acesso',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 5),

                    // =================================================
                    // CAMPO CEP
                    // =================================================

                    TextField(
                      controller: cepController,
                      keyboardType: TextInputType.number,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                      ),
                      decoration: InputDecoration(
                        hintText: 'O cep da sua rua',
                        hintStyle: const TextStyle(
                          color: Colors.white70,
                          fontSize: 14,
                        ),
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 10,
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(7),
                          borderSide: const BorderSide(
                            color: Colors.white,
                            width: 1,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(7),
                          borderSide: const BorderSide(
                            color: Colors.white,
                            width: 1.5,
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 34),

                    // =================================================
                    // BOTÃO
                    // =================================================

                    SizedBox(
                      width: double.infinity,
                      height: 42,
                      child: ElevatedButton(
                        onPressed: () {
                          // Futuramente:
                          // verificar o CEP no banco
                          // e entrar na comunidade.
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
                          'Entrar em comunidade',
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
            ),
          ],
        ),
      ),
    );
  }
}