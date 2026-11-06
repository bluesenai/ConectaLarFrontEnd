
import 'package:flutter/material.dart';
import '../services/api_service.dart';

class TelaAssinarPeticao extends StatefulWidget {
  final Map<String, dynamic> peticao;

  const TelaAssinarPeticao({
    super.key,
    required this.peticao,
  });

  @override
  State<TelaAssinarPeticao> createState() => _TelaAssinarPeticaoState();
}

class _TelaAssinarPeticaoState extends State<TelaAssinarPeticao> {
  static const Color fundo = Color(0xFF5C5052);
  static const Color vermelho = Color(0xFFCC302E);
  static const Color vermelhoEscuro = Color(0xFFB7191E);

  bool assinando = false;

  Future<void> assinar() async {
    setState(() {
      assinando = true;
    });

    try {
      final usuarioId = await ApiService.obterIdSalvo();

      if (usuarioId == null) {
        throw Exception('Usuário não identificado. Faça login novamente.');
      }

      final peticaoId = int.tryParse(
        widget.peticao['id'].toString(),
      );

      if (peticaoId == null) {
        throw Exception('ID da petição inválido.');
      }

      await ApiService.assinarPeticao(
        usuarioId: usuarioId,
        peticaoId: peticaoId,
      );

      if (!mounted) return;

      await showDialog<void>(
        context: context,
        barrierDismissible: false,
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

      if (!mounted) return;

      Navigator.pop(context, true);
    } catch (e) {
      if (!mounted) return;

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            e.toString().replaceFirst('Exception: ', ''),
          ),
        ),
      );
    } finally {
      if (mounted) {
        setState(() {
          assinando = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final titulo = widget.peticao['titulo']?.toString() ?? 'Petição';
    final descricao =
        widget.peticao['descricao']?.toString() ?? 'Sem descrição';
    final autor =
        widget.peticao['nomeAutor']?.toString() ?? 'Morador';
    final assinaturas =
        widget.peticao['quantidadeAssinaturas']?.toString() ?? '0';

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
              constraints: const BoxConstraints(minHeight: 78),
              margin: const EdgeInsets.symmetric(horizontal: 34),
              padding: const EdgeInsets.fromLTRB(13, 10, 8, 10),
              decoration: BoxDecoration(
                color: vermelho,
                borderRadius: BorderRadius.circular(9),
              ),
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
                  Text(
                    descricao,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 10,
                    ),
                  ),
                  const SizedBox(height: 7),
                  Text(
                    'Autor: $autor',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 10,
                    ),
                  ),
                  const SizedBox(height: 7),
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

            const SizedBox(height: 29),

            // BOTÃO ASSINAR
            SizedBox(
              width: 84,
              height: 27,
              child: ElevatedButton(
                onPressed: assinando ? null : assinar,
                style: ElevatedButton.styleFrom(
                  backgroundColor: vermelhoEscuro,
                  foregroundColor: Colors.white,
                  elevation: 0,
                  padding: EdgeInsets.zero,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                ),
                child: assinando
                    ? const SizedBox(
                        width: 15,
                        height: 15,
                        child: CircularProgressIndicator(
                          color: Colors.white,
                          strokeWidth: 2,
                        ),
                      )
                    : const Text(
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
                onPressed: assinando
                    ? null
                    : () {
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
