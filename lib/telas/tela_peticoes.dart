
import 'package:flutter/material.dart';
import 'tela_criar_peticao.dart';
import 'tela_assinar_peticao.dart';

class TelaPeticoes extends StatelessWidget {
  const TelaPeticoes({super.key});

  static const Color fundo = Color(0xFF5C5052);
  static const Color vermelho = Color(0xFFCC302E);
  static const Color vermelhoEscuro = Color(0xFFB7191E);
  static const Color bloco = Color(0xFF4D4244);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: fundo,
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 28),

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

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 34),
              child: SizedBox(
                width: double.infinity,
                height: 78,
                child: Material(
                  color: bloco,
                  borderRadius: BorderRadius.circular(9),
                  child: InkWell(
                    borderRadius: BorderRadius.circular(9),
                    onTap: () {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => const TelaCriarPeticao(),
    ),
  );
},
                    child: const Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.add_circle_outline,
                          color: Color(0xFFBDB0B0),
                          size: 37,
                        ),
                        SizedBox(height: 2),
                        Text(
                          'Criar uma nova petição',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 11,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 11),

         
            Expanded(
              child: ListView(
                padding: const EdgeInsets.symmetric(horizontal: 34),
                children: const [
                  CartaoPeticao(
                    titulo: 'PETIÇÃO 1',
                    assinaturas: '00',
                  ),
                  SizedBox(height: 11),
                  CartaoPeticao(
                    titulo: 'PETIÇÃO 2',
                    assinaturas: '00',
                  ),
                ],
              ),
            ),

            
            Padding(
              padding: const EdgeInsets.only(bottom: 24, top: 8),
              child: SizedBox(
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
            ),
          ],
        ),
      ),
    );
  }
}

class CartaoPeticao extends StatelessWidget {
  final String titulo;
  final String assinaturas;

  const CartaoPeticao({
    super.key,
    required this.titulo,
    required this.assinaturas,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 78,
      child: Material(
        color: const Color(0xFFCC302E),
        borderRadius: BorderRadius.circular(9),
        child: InkWell(
          borderRadius: BorderRadius.circular(9),
          onTap: () {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => const TelaAssinarPeticao(),
    ),
  );
},
          child: Padding(
            padding: const EdgeInsets.fromLTRB(13, 10, 8, 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  titulo,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 11,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 7),
                const Text(
                  '****************',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 10,
                    letterSpacing: 0.5,
                  ),
                ),
                const Spacer(),
                Text(
                  '$assinaturas pessoas assinaram',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 11,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
