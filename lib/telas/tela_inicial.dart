
import 'package:flutter/material.dart';
import 'tela_chat.dart';
import 'tela_seguranca.dart';
import 'tela_peticoes.dart';
import '../services/api_service.dart';
import 'tela_cameras.dart';
import 'tela_reclamacoes.dart';
import 'tela_bairro.dart';
import 'tela_vizinhanca.dart';
import 'tela_editar_conta.dart';
import 'tela_contato_desenvolvedor.dart';

class TelaInicial extends StatefulWidget {
  const TelaInicial({super.key});

  @override
  State<TelaInicial> createState() => _TelaInicialState();
}

class _TelaInicialState extends State<TelaInicial> {
  static const Color vermelho = Color(0xFFF5322C);
  static const Color vermelhoEscuro = Color(0xFFB7191E);
  static const Color fundo = Color(0xFF5C5052);
  static const Color bloco = Color(0xFF4D4244);

  String nomeRua = 'Carregando...';

  bool menuAberto = false;

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

  void abrirMenu() {
    setState(() {
      menuAberto = true;
    });
  }

  void fecharMenu() {
    setState(() {
      menuAberto = false;
    });
  }

  void mostrarMensagem(String mensagem) {
    fecharMenu();

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(mensagem)),
    );
  }

  void trocarComunidade() {
    fecharMenu();

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => const TelaVizinhanca(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final larguraTela = MediaQuery.of(context).size.width;
    final larguraMenu = larguraTela * 0.75;

    return Scaffold(
      backgroundColor: fundo,
      body: SafeArea(
        child: Stack(
          children: [
            // TELA INICIAL
            LayoutBuilder(
              builder: (context, constraints) {
                final alturaConteudo = constraints.maxHeight - 75;

                final alturaBloco =
                    ((alturaConteudo - 44 - 48) / 4).clamp(100.0, 150.0);

                return Column(
                  children: [
                    // CABEÇALHO VERMELHO
                    Container(
                      width: double.infinity,
                      height: 100,
                      color: vermelho,
                      child: Row(
                        children: [
                          IconButton(
                            onPressed: abrirMenu,
                            icon: const Icon(
                              Icons.menu,
                              color: Colors.white,
                              size: 40,
                            ),
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.notifications_none,
                              color: Colors.white,
                              size: 40,
                            ),
                          ),
                          const Spacer(),
                          Expanded(
                            flex: 3,
                            child: Text(
                              'Bem-vindo à\n$nomeRua',
                              textAlign: TextAlign.right,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 17,
                                fontWeight: FontWeight.bold,
                                height: 1.1,
                              ),
                            ),
                          ),
                          const SizedBox(width: 20),
                        ],
                      ),
                    ),

                    // CONTEÚDO DOS BLOCOS
                    Expanded(
                      child: SingleChildScrollView(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 25,
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
                                    altura: alturaBloco,
                                    aoClicar: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (_) => TelaChat(),
                                        ),
                                      );
                                    },
                                  ),
                                ),
                                const SizedBox(width: 12),
                                Expanded(
                                  child: blocoInicial(
                                    icone: Icons.shield,
                                    titulo: 'SEGURANÇA',
                                    altura: alturaBloco,
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

                            const SizedBox(height: 16),

                            // SEGUNDA LINHA
                            Row(
                              children: [
                                Expanded(
                                  child: blocoInicial(
                                    icone: Icons.edit_document,
                                    titulo: 'PETIÇÕES',
                                    altura: alturaBloco,
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
                                    altura: alturaBloco,
                                    aoClicar: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (_) =>
                                              const TelaReclamacoes(),
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              ],
                            ),

                            const SizedBox(height: 16),

                            // TERCEIRA LINHA
                            Row(
                              children: [
                                Expanded(
                                  child: blocoInicial(
                                    icone: Icons.camera_alt_outlined,
                                    titulo: 'CÂMERAS',
                                    altura: alturaBloco,
                                    aoClicar: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (_) =>
                                              const TelaCameras(),
                                        ),
                                      );
                                    },
                                  ),
                                ),
                                const SizedBox(width: 12),
                                Expanded(
                                  child: blocoInicial(
                                    icone: Icons.groups,
                                    titulo: 'SEU BAIRRO',
                                    altura: alturaBloco,
                                    aoClicar: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (_) => const TelaBairro(),
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              ],
                            ),

                            const SizedBox(height: 16),

                            // QUARTA LINHA
                            Row(
                              children: [
                                Expanded(
                                  child: blocoInicial(
                                    icone: Icons.account_balance_wallet_outlined,
                                    titulo: 'PAGAMENTOS',
                                    altura: alturaBloco,
                                  ),
                                ),
                                const SizedBox(width: 12),
                                Expanded(
                                  child: SizedBox(height: alturaBloco),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),

            // FUNDO ESCURECIDO
            if (menuAberto)
              Positioned.fill(
                child: GestureDetector(
                  onTap: fecharMenu,
                  child: Container(
                    color: Colors.black54,
                  ),
                ),
              ),

            // MENU LATERAL
            AnimatedPositioned(
              duration: const Duration(milliseconds: 280),
              curve: Curves.easeInOut,
              top: 0,
              bottom: 0,
              left: menuAberto ? 0 : -larguraMenu,
              width: larguraMenu,
              child: Material(
                color: bloco,
                elevation: 12,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    // CABEÇALHO DO MENU
                    Container(
                      height: 145,
                      color: vermelho,
                      padding: const EdgeInsets.all(18),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(
                            Icons.account_circle_outlined,
                            color: Colors.white,
                            size: 48,
                          ),
                          const SizedBox(height: 8),
                          const Text(
                            'Minha conta',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const Text(
                            'ConectaLar',
                            style: TextStyle(
                              color: Colors.white70,
                              fontSize: 13,
                            ),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 12),

                    // MUDAR INFORMAÇÕES DE CONTA
                  itemMenu(
  icone: Icons.manage_accounts_outlined,
  titulo: 'Mudar informações\nde conta',
  aoClicar: () {
    fecharMenu();

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => const TelaEditarConta(),
      ),
    );
  },
),

                    // TROCAR DE COMUNIDADE
                    itemMenu(
                      icone: Icons.groups_outlined,
                      titulo: 'Trocar de comunidade',
                      aoClicar: trocarComunidade,
                    ),

                    // CONTATO COM DESENVOLVEDOR
                    itemMenu(
  icone: Icons.mail_outline,
  titulo: 'Entrar em contato\ncom o desenvolvedor',
  aoClicar: () {
    fecharMenu();

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => const TelaContatoDesenvolvedor(),
      ),
    );
  },
),
                    const Spacer(),

                    // MODO CLARO - FUTURA IMPLEMENTAÇÃO
                    itemMenu(
                      icone: Icons.light_mode_outlined,
                      titulo: 'Modo claro',
                      aoClicar: () {
                        mostrarMensagem(
                          'A troca de tema será implementada depois.',
                        );
                      },
                    ),

                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ITEM DO MENU
  Widget itemMenu({
    required IconData icone,
    required String titulo,
    required VoidCallback aoClicar,
  }) {
    return InkWell(
      onTap: aoClicar,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 18,
          vertical: 17,
        ),
        child: Row(
          children: [
            Icon(
              icone,
              color: Colors.white,
              size: 27,
            ),
            const SizedBox(width: 14),
            Expanded(
              child: Text(
                titulo,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
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
    required double altura,
    VoidCallback? aoClicar,
  }) {
    return SizedBox(
      height: altura,
      child: Material(
        color: bloco,
        borderRadius: BorderRadius.circular(9),
        child: InkWell(
          borderRadius: BorderRadius.circular(9),
          onTap: aoClicar,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icone,
                color: Colors.white,
                size: 40,
              ),
              const SizedBox(height: 5),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4),
                child: Text(
                  titulo,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 17,
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
