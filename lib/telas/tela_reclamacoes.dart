
import 'package:flutter/material.dart';

class TelaReclamacoes extends StatefulWidget {
  const TelaReclamacoes({super.key});

  @override
  State<TelaReclamacoes> createState() => _TelaReclamacoesState();
}

class _TelaReclamacoesState extends State<TelaReclamacoes> {
  static const Color fundo = Color(0xFF5C5052);
  static const Color vermelho = Color(0xFFF5322C);
  static const Color vermelhoEscuro = Color(0xFFB7191E);
  static const Color campo = Color(0xFF675B5D);

  String? reclamacaoSelecionada;

  final TextEditingController senhaController = TextEditingController();

  final List<String> opcoesReclamacao = [
    'Queda de energia/luz',
    'Falta de água',
    'Acidente',
    'Fio solto',
    'Assalto',
    'Animal perdido',
  ];

  @override
  void dispose() {
    senhaController.dispose();
    super.dispose();
  }

  void enviarReclamacao() {
    if (reclamacaoSelecionada == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Selecione uma opção de reclamação.'),
        ),
      );
      return;
    }

    if (senhaController.text.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Digite sua senha para confirmar.'),
        ),
      );
      return;
    }

    showDialog<void>(
      context: context,
      builder: (contextDialog) {
        return AlertDialog(
          title: const Text('Reclamação enviada'),
          content: Text(
            'Sua reclamação sobre "$reclamacaoSelecionada" foi registrada.',
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(contextDialog);
                Navigator.pop(context);
              },
              child: const Text(
                'OK',
                style: TextStyle(color: vermelhoEscuro),
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
            // CABEÇALHO
            Container(
              height: 69,
              width: double.infinity,
              color: vermelho,
              child: Column(
                children: [
                  const SizedBox(height: 20),
                  Expanded(
                    child: Row(
                      children: [
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.menu,
                            color: Colors.white,
                            size: 23,
                          ),
                        ),
                        const Spacer(),
                        const Text(
                          'Reclamações',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(width: 15),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            // SETA DE VOLTAR
            Align(
              alignment: Alignment.centerLeft,
              child: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                padding: const EdgeInsets.only(left: 12),
                alignment: Alignment.centerLeft,
                icon: const Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                  size: 29,
                ),
              ),
            ),

            // CONTEÚDO
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.fromLTRB(15, 26, 15, 25),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'O que está acontecendo?',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 2),

                    // SELEÇÃO DA RECLAMAÇÃO
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(horizontal: 13),
                      decoration: BoxDecoration(
                        color: campo,
                        borderRadius: BorderRadius.circular(14),
                      ),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton<String>(
                          value: reclamacaoSelecionada,
                          isExpanded: true,
                          dropdownColor: campo,
                          hint: const Text(
                            'Escolha uma opção',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 11,
                            ),
                          ),
                          icon: const Icon(
                            Icons.keyboard_arrow_down,
                            color: Colors.white,
                          ),
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 11,
                          ),
                          items: opcoesReclamacao.map((opcao) {
                            return DropdownMenuItem<String>(
                              value: opcao,
                              child: Text(opcao),
                            );
                          }).toList(),
                          onChanged: (valor) {
                            setState(() {
                              reclamacaoSelecionada = valor;
                            });
                          },
                        ),
                      ),
                    ),

                    const SizedBox(height: 25),

                    const Text(
                      'Confirme que é você. Digite sua\nsenha.',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 3),

                    // CAMPO DE SENHA
                    Container(
                      height: 38,
                      padding: const EdgeInsets.symmetric(horizontal: 14),
                      decoration: BoxDecoration(
                        color: campo,
                        borderRadius: BorderRadius.circular(14),
                      ),
                      child: TextField(
                        controller: senhaController,
                        obscureText: true,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 11,
                        ),
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintText: 'XXXXXXXX',
                          hintStyle: TextStyle(
                            color: Colors.white70,
                            fontSize: 11,
                          ),
                          contentPadding: EdgeInsets.only(bottom: 9),
                        ),
                      ),
                    ),

                    const SizedBox(height: 55),

                    // BOTÃO ENVIAR
                    Center(
                      child: SizedBox(
                        width: 177,
                        height: 27,
                        child: ElevatedButton(
                          onPressed: enviarReclamacao,
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
                            'ENVIAR',
                            style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.bold,
                            ),
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
