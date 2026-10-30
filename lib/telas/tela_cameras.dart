import 'package:flutter/material.dart';

class TelaCameras extends StatefulWidget {
  const TelaCameras({super.key});

  @override
  State<TelaCameras> createState() => _TelaCamerasState();
}

class _TelaCamerasState extends State<TelaCameras> {
  static const Color fundo = Color(0xFF5C5052);
  static const Color vermelho = Color(0xFFB7191E);

  // Lista temporária. Depois será preenchida pelo backend.
  final List<String> cameras = [
    'CÂMERA 1',
    'CÂMERA 2',
    'CÂMERA 3',
  ];

  int cameraAtual = 0;

  void proximaCamera() {
    setState(() {
      cameraAtual = (cameraAtual + 1) % cameras.length;
    });
  }

  void cameraAnterior() {
    setState(() {
      cameraAtual =
          (cameraAtual - 1 + cameras.length) % cameras.length;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: fundo,
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 72),

            // LOGO
            Container(
              width: 110,
              height: 110,
              padding: const EdgeInsets.all(12),
              decoration: const BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
              ),
              child: Image.asset(
                'assets/images/iconeroda.png',
                fit: BoxFit.contain,
                errorBuilder: (context, error, stackTrace) {
                  return const Icon(
                    Icons.home_work_outlined,
                    color: vermelho,
                    size: 55,
                  );
                },
              ),
            ),

            const SizedBox(height: 0),

            // NOME DA CÂMERA
            SizedBox(
              width: double.infinity,
              height: 22,
              child: Padding(
                padding: const EdgeInsets.only(left: 15),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    cameras[cameraAtual],
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),

            // ÁREA DA IMAGEM DA CÂMERA
            Expanded(
              child: Container(
                width: double.infinity,
                color: const Color(0xFFD9D9D9),

                // Futuramente, a imagem ou transmissão do backend
                // será exibida aqui.
                child: const SizedBox.expand(),
              ),
            ),

            // SETAS PARA TROCAR DE CÂMERA
            Padding(
              padding: const EdgeInsets.only(top: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    onPressed: cameraAnterior,
                    icon: const Icon(
                      Icons.chevron_left,
                      color: Colors.white,
                      size: 48,
                    ),
                  ),
                  const SizedBox(width: 30),
                  IconButton(
                    onPressed: proximaCamera,
                    icon: const Icon(
                      Icons.chevron_right,
                      color: Colors.white,
                      size: 48,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 22),

            // BOTÃO VOLTAR
            SizedBox(
              width: 100,
              height: 30,
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
                    fontSize: 13,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 80),
          ],
        ),
      ),
    );
  }
}
