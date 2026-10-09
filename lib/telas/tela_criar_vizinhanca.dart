
import 'package:flutter/material.dart';

class TelaCriarVizinhanca extends StatefulWidget {
  const TelaCriarVizinhanca({super.key});

  @override
  State<TelaCriarVizinhanca> createState() =>
      _TelaCriarVizinhancaState();
}

class _TelaCriarVizinhancaState
    extends State<TelaCriarVizinhanca> {
  final TextEditingController cepController =
      TextEditingController();
  final TextEditingController estadoController =
      TextEditingController();
  final TextEditingController cidadeController =
      TextEditingController();
  final TextEditingController bairroController =
      TextEditingController();
  final TextEditingController ruaController =
      TextEditingController();

  @override
  void dispose() {
    cepController.dispose();
    estadoController.dispose();
    cidadeController.dispose();
    bairroController.dispose();
    ruaController.dispose();
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
            // FUNDO
            Container(
              width: double.infinity,
              height: double.infinity,
              color: const Color(0xFF991D19),
            ),

            // FORMA SUPERIOR ESQUERDA
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

            // FORMA CENTRAL / DIREITA
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

            // FORMA INFERIOR ESQUERDA
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

            // FORMA INFERIOR DIREITA
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

            // CONTEÚDO DA TELA
            SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: largura * 0.08,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: altura * 0.06),

                    const Center(
                      child: Text(
                        'Cadastre sua rua',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),

                    SizedBox(height: altura * 0.045),

                    // CEP
                    campoTexto(
                      titulo: 'CEP',
                      dica: 'XXXXX-XXX',
                      controller: cepController,
                      tipo: TextInputType.number,
                    ),

                    // ESTADO
                    campoTexto(
                      titulo: 'Estado',
                      dica: 'Seu Estado',
                      controller: estadoController,
                    ),

                    // CIDADE
                    campoTexto(
                      titulo: 'Cidade',
                      dica: 'Sua Cidade',
                      controller: cidadeController,
                    ),

                    // BAIRRO
                    campoTexto(
                      titulo: 'Bairro',
                      dica: 'Seu Bairro',
                      controller: bairroController,
                    ),

                    // RUA
                    campoTexto(
                      titulo: 'Rua',
                      dica: 'Sua rua',
                      controller: ruaController,
                    ),

                    SizedBox(height: altura * 0.045),

                    // BOTÃO PRÓXIMO
                    SizedBox(
                      width: double.infinity,
                      height: 42,
                      child: ElevatedButton(
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                backgroundColor:
                                    const Color(0xFFEFEFEF),
                                title: const Text(
                                  'ATENÇÃO',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Color(0xFFE52F29),
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                content: const Text(
                                  'Verifique se suas informações '
                                  'estão corretas antes de '
                                  'ingressar na comunidade desta '
                                  'rua. O código de acesso futuro '
                                  'será o CEP da RUA.',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                actions: [
                                  SizedBox(
                                    width: double.infinity,
                                    child: ElevatedButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor:
                                            const Color(0xFFB7191E),
                                        foregroundColor: Colors.white,
                                        elevation: 0,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(25),
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
                          backgroundColor:
                              const Color(0xFFB7191E),
                          foregroundColor: Colors.white,
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.circular(25),
                          ),
                        ),
                        child: const Text(
                          'Próximo',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),

                    SizedBox(height: altura * 0.03),
                  ],
                ),
              ),
            ),

            // SETA PARA VOLTAR
            // Fica por cima do conteúdo para receber o clique.
            Positioned(
              top: 0,
              left: 8,
              child: IconButton(
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
            ),
          ],
        ),
      ),
    );
  }

  Widget campoTexto({
    required String titulo,
    required String dica,
    required TextEditingController controller,
    TextInputType tipo = TextInputType.text,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(
              left: 4,
              bottom: 3,
            ),
            child: Text(
              titulo,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 13,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(
            height: 32,
            child: TextField(
              controller: controller,
              keyboardType: tipo,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 11,
              ),
              decoration: InputDecoration(
                hintText: dica,
                hintStyle: const TextStyle(
                  color: Colors.white70,
                  fontSize: 11,
                ),
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 9,
                  vertical: 7,
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(6),
                  borderSide: const BorderSide(
                    color: Colors.white,
                    width: 1,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(6),
                  borderSide: const BorderSide(
                    color: Colors.white,
                    width: 1.5,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
