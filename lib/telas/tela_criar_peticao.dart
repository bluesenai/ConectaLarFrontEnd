
import 'package:flutter/material.dart';

class TelaCriarPeticao extends StatefulWidget {
  const TelaCriarPeticao({super.key});

  @override
  State<TelaCriarPeticao> createState() => _TelaCriarPeticaoState();
}

class _TelaCriarPeticaoState extends State<TelaCriarPeticao> {
  static const Color fundo = Color(0xFF5C5052);
  static const Color vermelho = Color(0xFFCC302E);
  static const Color vermelhoEscuro = Color(0xFFB7191E);

  final TextEditingController tituloController = TextEditingController();
  final TextEditingController motivoController = TextEditingController();

  @override
  void dispose() {
    tituloController.dispose();
    motivoController.dispose();
    super.dispose();
  }

  void enviarPeticao() {
    if (tituloController.text.trim().isEmpty ||
        motivoController.text.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Preencha o título e o motivo da petição.'),
        ),
      );
      return;
    }

    showDialog<void>(
      context: context,
      builder: (contextDialog) {
        return AlertDialog(
          backgroundColor: const Color(0xFFF0F0F0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          title: const Text(
            'ENVIADO',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Color(0xFFCC302E),
              fontSize: 23,
              fontWeight: FontWeight.bold,
            ),
          ),
          content: const Text(
            'Sua petição agora está disponível para os outros moradores.',
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
  }

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
              decoration: const BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
              ),
              padding: const EdgeInsets.all(10),
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

            const SizedBox(height: 9),

            // CAMPO TÍTULO
            campoPeticao(
              titulo: 'Título da petição:',
              controller: tituloController,
            ),

            const SizedBox(height: 11),

            // CAMPO MOTIVO
            campoPeticao(
              titulo: 'Motivo da petição:',
              controller: motivoController,
            ),

            const SizedBox(height: 25),

            // BOTÃO ENVIAR
            SizedBox(
              width: 84,
              height: 27,
              child: ElevatedButton(
                onPressed: enviarPeticao,
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
                  'Enviar',
                  style: TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 17),

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

  Widget campoPeticao({
    required String titulo,
    required TextEditingController controller,
  }) {
    return Container(
      height: 78,
      margin: const EdgeInsets.symmetric(horizontal: 34),
      padding: const EdgeInsets.fromLTRB(10, 8, 10, 5),
      decoration: BoxDecoration(
        color: vermelho,
        borderRadius: BorderRadius.circular(9),
      ),
      child: Column(
        children: [
          Text(
            titulo,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 11,
              fontWeight: FontWeight.bold,
            ),
          ),

          Expanded(
            child: TextField(
              controller: controller,
              textAlign: TextAlign.center,
              maxLines: 1,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 12,
              ),
              decoration: const InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.zero,
                isDense: true,
              ),
            ),
          ),

          const Align(
            alignment: Alignment.bottomRight,
            child: Icon(
              Icons.edit_note,
              color: Colors.white,
              size: 19,
            ),
          ),
        ],
      ),
    );
  }
}
