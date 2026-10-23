import 'package:flutter/material.dart';
import '../services/api_service.dart';

class TelaCriarVizinhanca extends StatefulWidget {
  const TelaCriarVizinhanca({super.key});

  @override
  State<TelaCriarVizinhanca> createState() => _TelaCriarVizinhancaState();
}

class _TelaCriarVizinhancaState extends State<TelaCriarVizinhanca> {
  final TextEditingController cepController = TextEditingController();
  final TextEditingController estadoController = TextEditingController();
  final TextEditingController cidadeController = TextEditingController();
  final TextEditingController bairroController = TextEditingController();
  final TextEditingController ruaController = TextEditingController();
  bool criandoComunidade = false;

  @override
  void dispose() {
    cepController.dispose();
    estadoController.dispose();
    cidadeController.dispose();
    bairroController.dispose();
    ruaController.dispose();
    super.dispose();
  }

  Future<void> cadastrarVizinhanca() async {
    final cep = cepController.text.trim().replaceAll(RegExp(r'[^0-9]'), '');
    final estado = estadoController.text.trim();
    final cidade = cidadeController.text.trim();
    final bairro = bairroController.text.trim();
    final rua = ruaController.text.trim();

    if (cep.length != 8 ||
        estado.isEmpty ||
        cidade.isEmpty ||
        bairro.isEmpty ||
        rua.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Preencha todos os campos e informe um CEP válido.'),
        ),
      );
      return;
    }

    setState(() => criandoComunidade = true);

    try {
      final usuarioId = await ApiService.obterIdSalvo();

      if (usuarioId == null) {
        throw Exception(
          'Não foi possível identificar o usuário. Faça login novamente.',
        );
      }

      final comunidade = await ApiService.criarComunidade(
        cep: cep,
        estado: estado,
        cidade: cidade,
        bairro: bairro,
        rua: rua,
      );

      await ApiService.entrarComunidade(usuarioId: usuarioId, cep: cep);

      if (!mounted) return;

      final cepSalvo = comunidade['cep']?.toString() ?? cep;

      await showDialog<void>(
        context: context,
        barrierDismissible: false,
        builder: (dialogContext) => AlertDialog(
          title: const Text('Vizinhança criada!'),
          content: Text(
            'A comunidade foi cadastrada com sucesso.\n\n'
            'CEP de acesso: $cepSalvo',
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(dialogContext),
              child: const Text('Continuar'),
            ),
          ],
        ),
      );

      if (!mounted) return;

      Navigator.pop(context, true);
    } catch (e) {
      if (!mounted) return;

      final mensagem = e.toString().replaceFirst('Exception: ', '');

      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(mensagem)));
    } finally {
      if (mounted) {
        setState(() => criandoComunidade = false);
      }
    }
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
                padding: EdgeInsets.symmetric(horizontal: largura * 0.08),
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
                        onPressed: criandoComunidade
                            ? null
                            : cadastrarVizinhanca,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFFB7191E),
                          foregroundColor: Colors.white,
                          disabledBackgroundColor: const Color(0xFFB7191E),
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25),
                          ),
                        ),
                        child: criandoComunidade
                            ? const SizedBox(
                                width: 20,
                                height: 20,
                                child: CircularProgressIndicator(
                                  strokeWidth: 2,
                                  color: Colors.white,
                                ),
                              )
                            : const Text(
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
            padding: const EdgeInsets.only(left: 4, bottom: 3),
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
              style: const TextStyle(color: Colors.white, fontSize: 11),
              decoration: InputDecoration(
                hintText: dica,
                hintStyle: const TextStyle(color: Colors.white70, fontSize: 11),
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 9,
                  vertical: 7,
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(6),
                  borderSide: const BorderSide(color: Colors.white, width: 1),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(6),
                  borderSide: const BorderSide(color: Colors.white, width: 1.5),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
