
import 'package:flutter/material.dart';

class TelaInicial extends StatelessWidget {
  const TelaInicial({super.key});

  static const Color vermelho = Color(0xFFF5322C);
  static const Color fundo = Color(0xFF5C5052);
  static const Color bloco = Color(0xFF4D4244);

  @override
  Widget build(BuildContext context) {
    final tamanho = MediaQuery.of(context).size;
    final largura = tamanho.width;

    return Scaffold(
      backgroundColor: fundo,
      body: SafeArea(
        child: Column(
          children: [
            // CABEÇALHO VERMELHO
            Container(
              width: double.infinity,
              height: 63,
              color: vermelho,
              child: Row(
                children: [
                  // MENU
                  IconButton(
                    onPressed: () {
                      // Tela de menu futuramente.
                    },
                    icon: const Icon(
                      Icons.menu,
                      color: Colors.white,
                      size: 25,
                    ),
                  ),

                  // NOTIFICAÇÕES
                  IconButton(
                    onPressed: () {
                      // Tela de notificações futuramente.
                    },
                    icon: const Icon(
                      Icons.notifications_none,
                      color: Colors.white,
                      size: 24,
                    ),
                  ),

                  const Spacer(),

                  // MENSAGEM DE BOAS-VINDAS
                  const Expanded(
                    flex: 3,
                    child: Text(
                      'Bem vindo à\ncomunidade ***!',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        height: 1.1,
                      ),
                    ),
                  ),

                  const SizedBox(width: 8),
                ],
              ),
            ),

            // CONTEÚDO DOS BLOCOS
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(
                  horizontal: 22,
                  vertical: 22,
                ),
                child: Column(
                  children: [
                    // PRIMEIRA LINHA
                    Row(
                      children: [
                        Expanded(
                          child: blocoInicial(
                            icone: Icons.chat_outlined,
                            titulo: 'CHAT',
                            largura: largura,
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: blocoInicial(
                            icone: Icons.shield,
                            titulo: 'SEGURANÇA',
                            largura: largura,
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 14),

                    // SEGUNDA LINHA
                    Row(
                      children: [
                        Expanded(
                          child: blocoInicial(
                            icone: Icons.edit_document,
                            titulo: 'PETIÇÕES',
                            largura: largura,
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: blocoInicial(
                            icone: Icons
                                .notification_important_outlined,
                            titulo: 'RECLAMAÇÕES',
                            largura: largura,
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 14),

                    // TERCEIRA LINHA
                    Row(
                      children: [
                        Expanded(
                          child: blocoInicial(
                            icone: Icons.camera_alt_outlined,
                            titulo: 'CÂMERAS',
                            largura: largura,
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: blocoInicial(
                            icone: Icons.groups,
                            titulo: 'SEU BAIRRO',
                            largura: largura,
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 14),

                    // QUARTA LINHA — PAGAMENTOS
                    Row(
                      children: [
                        Expanded(
                          child: blocoInicial(
                            icone: Icons
                                .account_balance_wallet_outlined,
                            titulo: 'PAGAMENTOS',
                            largura: largura,
                          ),
                        ),
                        const SizedBox(width: 12),
                        const Expanded(
                          child: SizedBox(height: 87),
                        ),
                      ],
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

  Widget blocoInicial({
    required IconData icone,
    required String titulo,
    required double largura,
  }) {
    return SizedBox(
      height: 87,
      child: Material(
        color: bloco,
        borderRadius: BorderRadius.circular(7),
        child: InkWell(
          borderRadius: BorderRadius.circular(7),
          onTap: () {
            // Navegação de cada funcionalidade será adicionada depois.
          },
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icone,
                color: Colors.white,
                size: 27,
              ),
              const SizedBox(height: 2),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 3,
                ),
                child: Text(
                  titulo,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 11,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
