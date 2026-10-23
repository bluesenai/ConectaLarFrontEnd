import 'package:flutter/material.dart';
import 'tela_chat.dart';
import 'tela_seguranca.dart';
import 'tela_peticoes.dart';
import '../services/api_service.dart';

class TelaInicial extends StatefulWidget {
  const TelaInicial({super.key});

  @override
  State<TelaInicial> createState() => _TelaInicialState();
}

class _TelaInicialState extends State<TelaInicial> {
  static const Color vermelho = Color(0xFFF5322C);
  static const Color fundo = Color(0xFF5C5052);
  static const Color bloco = Color(0xFF4D4244);

  String nomeRua = 'Carregando...';

  @override
  void initState() {
    super.initState();
    carregarComunidade();
  }

  Future<void> carregarComunidade() async {
    try {
      final usuarioId = await ApiService.obterIdSalvo();

      if (usuarioId == null) {
        if (!mounted) return;
        setState(() {
          nomeRua = 'Comunidade não identificada';
        });
        return;
      }

      final dados = await ApiService.buscarMinhaComunidade(usuarioId);

      if (!mounted) return;

      setState(() {
        nomeRua = dados['rua']?.toString() ?? 'Rua não informada';
      });
    } catch (e) {
      if (!mounted) return;

      setState(() {
        nomeRua = 'Não foi possível carregar a rua';
      });

      debugPrint('Erro ao carregar comunidade: $e');
    }
  }

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
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.menu, color: Colors.white, size: 25),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.notifications_none,
                      color: Colors.white,
                      size: 24,
                    ),
                  ),
                  const Spacer(),
                  Expanded(
                    flex: 3,
                    child: Text(
                      'Bem-vindo à\n$nomeRua',
                      textAlign: TextAlign.center,
                      style: const TextStyle(
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
                            aoClicar: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (_) => TelaChat()),
                              );
                            },
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: blocoInicial(
                            icone: Icons.shield,
                            titulo: 'SEGURANÇA',
                            largura: largura,
                            aoClicar: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => TelaSeguranca(),
                                ),
                              );
                            },
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
                            aoClicar: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => TelaPeticoes(),
                                ),
                              );
                            },
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: blocoInicial(
                            icone: Icons.notification_important_outlined,
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

                    // QUARTA LINHA
                    Row(
                      children: [
                        Expanded(
                          child: blocoInicial(
                            icone: Icons.account_balance_wallet_outlined,
                            titulo: 'PAGAMENTOS',
                            largura: largura,
                          ),
                        ),
                        const SizedBox(width: 12),
                        const Expanded(child: SizedBox(height: 87)),
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
    VoidCallback? aoClicar,
  }) {
    return SizedBox(
      height: 87,
      child: Material(
        color: bloco,
        borderRadius: BorderRadius.circular(7),
        child: InkWell(
          borderRadius: BorderRadius.circular(7),
          onTap: aoClicar,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icone, color: Colors.white, size: 27),
              const SizedBox(height: 2),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 3),
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
