import 'package:flutter/material.dart';
import 'tela_login.dart';

class TelaCarregamento extends StatefulWidget {
  const TelaCarregamento({super.key});

  @override
  State<TelaCarregamento> createState() => _TelaCarregamentoState();
}

class _TelaCarregamentoState extends State<TelaCarregamento>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    )..repeat();

    Future.delayed(const Duration(seconds: 3), () {
      if (!mounted) return;

      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const TelaLogin()),
      );
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Widget _circulo({
    required double largura,
    required double altura,
    required Color cor,
  }) {
    return Container(
      width: largura,
      height: altura,
      decoration: BoxDecoration(color: cor, shape: BoxShape.circle),
    );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final largura = size.width;
    final altura = size.height;

    return Scaffold(
      backgroundColor: const Color(0xFF991D19),
      body: SizedBox.expand(
        child: Stack(
          children: [
            Container(color: const Color(0xFF991D19)),

            Positioned(
              top: -altura * 0.12,
              left: -largura * 0.30,
              child: _circulo(
                largura: largura * 0.90,
                altura: largura * 0.90,
                cor: const Color(0xFFD22720),
              ),
            ),

            Positioned(
              top: -altura * 0.03,
              right: -largura * 0.52,
              child: _circulo(
                largura: largura * 1.15,
                altura: altura * 0.60,
                cor: const Color(0xFFB1211D),
              ),
            ),

            Positioned(
              bottom: -altura * 0.18,
              left: -largura * 0.35,
              child: _circulo(
                largura: largura * 0.95,
                altura: largura * 0.95,
                cor: const Color(0xFFD22720),
              ),
            ),

            Positioned(
              bottom: -altura * 0.08,
              right: -largura * 0.35,
              child: _circulo(
                largura: largura * 0.90,
                altura: largura * 0.90,
                cor: const Color(0xFFEE2E27),
              ),
            ),

            SafeArea(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/images/icone.png',
                      width: largura * 0.25,
                      height: largura * 0.25,
                      fit: BoxFit.contain,
                      errorBuilder: (context, error, stackTrace) {
                        return Icon(
                          Icons.home_rounded,
                          size: largura * 0.20,
                          color: Colors.white,
                        );
                      },
                    ),

                    SizedBox(height: altura * 0.025),

                    AnimatedBuilder(
                      animation: _controller,
                      builder: (context, child) {
                        final valor = _controller.value * 3;

                        return Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: List.generate(3, (index) {
                            final distancia = (valor - index).abs();

                            final escala =
                                1.0 - (distancia.clamp(0.0, 1.0) * 0.35);

                            return Transform.scale(
                              scale: escala,
                              child: Container(
                                margin: EdgeInsets.symmetric(
                                  horizontal: largura * 0.018,
                                ),
                                width: largura * 0.023,
                                height: largura * 0.023,
                                decoration: const BoxDecoration(
                                  color: Colors.white,
                                  shape: BoxShape.circle,
                                ),
                              ),
                            );
                          }),
                        );
                      },
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
