import 'dart:async';
import 'package:flutter/material.dart';
import '../services/api_service.dart';
import 'tela_perfis_rua.dart';

class TelaChat extends StatefulWidget {
  const TelaChat({super.key});

  @override
  State<TelaChat> createState() => _TelaChatState();
}

class _TelaChatState extends State<TelaChat> {
  static const Color fundo = Color(0xFF5C5052);
  static const Color bloco = Color(0xFF4D4244);
  static const Color campo = Color(0xFF675B5D);

  final TextEditingController mensagemController = TextEditingController();
  final ScrollController scrollController = ScrollController();

  List<Map<String, dynamic>> mensagens = [];
  int? usuarioId;
  bool carregando = true;
  bool enviando = false;
  String? erro;

  Timer? temporizador;

  @override
  void initState() {
    super.initState();
    iniciarChat();
  }

  Future<void> iniciarChat() async {
    try {
      final id = await ApiService.obterIdSalvo();

      if (!mounted) return;

      if (id == null) {
        setState(() {
          erro = 'Não foi possível identificar o usuário conectado.';
          carregando = false;
        });
        return;
      }

      usuarioId = id;

      await carregarMensagens();

      if (!mounted) return;

      // Atualiza a conversa a cada 3 segundos.
      temporizador = Timer.periodic(
        const Duration(seconds: 3),
        (_) => carregarMensagens(),
      );
    } catch (e) {
      if (!mounted) return;

      setState(() {
        erro = 'Não foi possível iniciar o chat: $e';
        carregando = false;
      });
    }
  }

  Future<void> carregarMensagens() async {
    final id = usuarioId;
    if (id == null) return;

    try {
      final resultado = await ApiService.buscarMensagens(id);

      final lista = resultado
          .map((item) => Map<String, dynamic>.from(item as Map))
          .toList();

      if (!mounted) return;

      setState(() {
        mensagens = lista;
        erro = null;
        carregando = false;
      });

      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (mounted && scrollController.hasClients) {
          scrollController.jumpTo(scrollController.position.maxScrollExtent);
        }
      });
    } catch (e) {
      if (!mounted) return;

      setState(() {
        carregando = false;
        erro = 'Não foi possível carregar as mensagens.';
      });
    }
  }

  Future<void> enviarMensagem() async {
    final texto = mensagemController.text.trim();
    final id = usuarioId;

    if (texto.isEmpty || id == null || enviando) return;

    setState(() {
      enviando = true;
      erro = null;
    });

    try {
      await ApiService.enviarMensagem(usuarioId: id, texto: texto);

      if (!mounted) return;

      mensagemController.clear();
      await carregarMensagens();
    } catch (e) {
      if (!mounted) return;

      setState(() {
        erro = 'Não foi possível enviar a mensagem. Tente novamente.';
      });

      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(erro!)));
    } finally {
      if (mounted) {
        setState(() {
          enviando = false;
        });
      }
    }
  }

  @override
  void dispose() {
    temporizador?.cancel();
    mensagemController.dispose();
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: fundo,
      body: SafeArea(
        child: Column(
          children: [
            // Cabeçalho do chat
            SizedBox(
              height: 65,
              child: Row(
                children: [
                  const SizedBox(width: 20),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const TelaPerfisRua(),
                        ),
                      );
                    },
                    child: const SizedBox(
                      width: 68,
                      height: 40,
                      child: Stack(
                        alignment: Alignment.centerLeft,
                        children: [
                          Positioned(
                            left: 0,
                            child: CircleAvatar(
                              radius: 10,
                              backgroundColor: Color(0xFFD7D2D2),
                            ),
                          ),
                          Positioned(
                            left: 15,
                            child: CircleAvatar(
                              radius: 10,
                              backgroundColor: Color(0xFFBDB7B8),
                            ),
                          ),
                          Positioned(
                            left: 30,
                            child: CircleAvatar(
                              radius: 10,
                              backgroundColor: Color(0xFFD7D2D2),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const Spacer(),
                  IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: const Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                      size: 22,
                    ),
                  ),
                  const SizedBox(width: 10),
                ],
              ),
            ),

            // Área das mensagens
            Expanded(
              child: carregando
                  ? const Center(
                      child: CircularProgressIndicator(
                        color: Color(0xFFB99D9D),
                      ),
                    )
                  : mensagens.isEmpty
                  ? const Center(
                      child: Text(
                        'Nenhuma mensagem ainda. Seja o primeiro a conversar!',
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.white70, fontSize: 13),
                      ),
                    )
                  : ListView.builder(
                      controller: scrollController,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 8,
                      ),
                      itemCount: mensagens.length,
                      itemBuilder: (context, index) {
                        final mensagem = mensagens[index];

                        final autorId = (mensagem['usuarioId'] as num?)
                            ?.toInt();
                        final minhaMensagem = autorId == usuarioId;

                        final texto = mensagem['texto']?.toString() ?? '';
                        final nome =
                            mensagem['nomeUsuario']?.toString() ?? 'Morador';

                        return Align(
                          alignment: minhaMensagem
                              ? Alignment.centerRight
                              : Alignment.centerLeft,
                          child: Container(
                            margin: const EdgeInsets.only(bottom: 10),
                            padding: const EdgeInsets.symmetric(
                              horizontal: 12,
                              vertical: 9,
                            ),
                            constraints: BoxConstraints(
                              maxWidth:
                                  MediaQuery.of(context).size.width * 0.75,
                            ),
                            decoration: BoxDecoration(
                              color: bloco,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                if (!minhaMensagem)
                                  Padding(
                                    padding: const EdgeInsets.only(bottom: 4),
                                    child: Text(
                                      nome,
                                      style: const TextStyle(
                                        color: Color(0xFFE6BDBD),
                                        fontSize: 11,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                Text(
                                  texto,
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 13,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
            ),

            // Mensagem de erro, quando houver
            if (erro != null && !carregando)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  erro!,
                  style: const TextStyle(color: Colors.white, fontSize: 12),
                ),
              ),

            // Campo para escrever e enviar
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 40,
                      padding: const EdgeInsets.symmetric(horizontal: 14),
                      decoration: BoxDecoration(
                        color: campo,
                        borderRadius: BorderRadius.circular(25),
                      ),
                      child: TextField(
                        controller: mensagemController,
                        onSubmitted: (_) => enviarMensagem(),
                        enabled: !enviando,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 13,
                        ),
                        decoration: const InputDecoration(
                          hintText: '',
                          border: InputBorder.none,
                          isCollapsed: true,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 4),
                  IconButton(
                    onPressed: enviando ? null : enviarMensagem,
                    padding: EdgeInsets.zero,
                    constraints: const BoxConstraints(
                      minWidth: 24,
                      minHeight: 40,
                    ),
                    icon: enviando
                        ? const SizedBox(
                            width: 18,
                            height: 18,
                            child: CircularProgressIndicator(
                              strokeWidth: 2,
                              color: Color(0xFFB99D9D),
                            ),
                          )
                        : const Icon(
                            Icons.send,
                            color: Color(0xFFB99D9D),
                            size: 21,
                          ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 4),
          ],
        ),
      ),
    );
  }
}
