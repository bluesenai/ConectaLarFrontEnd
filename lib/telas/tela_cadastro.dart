import 'package:flutter/material.dart';

class TelaCadastro extends StatefulWidget {
  const TelaCadastro({super.key});

  @override
  State<TelaCadastro> createState() => _TelaCadastroState();
}

class _TelaCadastroState extends State<TelaCadastro> {
  // =====================================================
  // CONTROLES DOS CAMPOS
  // =====================================================

  final TextEditingController nomeController = TextEditingController();
  final TextEditingController dataNascimentoController =
      TextEditingController();
  final TextEditingController telefoneController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController senhaController = TextEditingController();
  final TextEditingController confirmarSenhaController =
      TextEditingController();

  final TextEditingController cepController = TextEditingController();
  final TextEditingController estadoController = TextEditingController();
  final TextEditingController cidadeController = TextEditingController();
  final TextEditingController bairroController = TextEditingController();
  final TextEditingController ruaController = TextEditingController();

  bool mostrarSenha = false;
  bool mostrarConfirmarSenha = false;

  @override
  void dispose() {
    nomeController.dispose();
    dataNascimentoController.dispose();
    telefoneController.dispose();
    emailController.dispose();
    senhaController.dispose();
    confirmarSenhaController.dispose();

    cepController.dispose();
    estadoController.dispose();
    cidadeController.dispose();
    bairroController.dispose();
    ruaController.dispose();

    super.dispose();
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
            // =====================================================
            // FUNDO
            // =====================================================

            Container(
              width: double.infinity,
              height: double.infinity,
              color: const Color(0xFF991D19),
            ),

            // =====================================================
            // FORMA SUPERIOR ESQUERDA
            // =====================================================

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

            // =====================================================
            // FORMA CENTRAL / DIREITA
            // =====================================================

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

            // =====================================================
            // FORMA INFERIOR ESQUERDA
            // =====================================================

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

            // =====================================================
            // FORMA INFERIOR DIREITA
            // =====================================================

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

            // =====================================================
            // CONTEÚDO DA TELA
            // =====================================================

            SingleChildScrollView(
              keyboardDismissBehavior:
                  ScrollViewKeyboardDismissBehavior.onDrag,

              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: largura * 0.14,
                  vertical: 18,
                ),

                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    // =================================================
                    // SETA VOLTAR
                    // =================================================

                    IconButton(
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

                    SizedBox(height: altura * 0.005),

                    // =================================================
                    // TÍTULO
                    // =================================================

                    const Center(
                      child: Text(
                        'Cadastre-se',

                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),

                    SizedBox(height: altura * 0.025),

                    // =================================================
                    // NOME
                    // =================================================

                    _tituloCampo('Nome'),

                    _campoTexto(
                      controller: nomeController,
                      hint: 'Seu Nome',
                    ),

                    const SizedBox(height: 18),

                    // =================================================
                    // DATA DE NASCIMENTO
                    // =================================================

                    _tituloCampo('Data de nascimento'),

                    _campoTexto(
                      controller: dataNascimentoController,
                      hint: '00/00/0000',
                      keyboardType: TextInputType.datetime,
                    ),

                    const SizedBox(height: 18),

                    // =================================================
                    // TELEFONE
                    // =================================================

                    _tituloCampo('Telefone'),

                    _campoTexto(
                      controller: telefoneController,
                      hint: '(00) 0000-00000',
                      keyboardType: TextInputType.phone,
                    ),

                    const SizedBox(height: 18),

                    // =================================================
                    // EMAIL
                    // =================================================

                    _tituloCampo('Email'),

                    _campoTexto(
                      controller: emailController,
                      hint: 'username@gmail.com',
                      keyboardType: TextInputType.emailAddress,
                    ),

                    const SizedBox(height: 18),

                    // =================================================
                    // SENHA
                    // =================================================

                    _tituloCampo('Senha'),

                    _campoSenha(
                      controller: senhaController,
                      hint: 'xxxxxxxx',
                      mostrarSenha: mostrarSenha,
                      aoClicar: () {
                        setState(() {
                          mostrarSenha = !mostrarSenha;
                        });
                      },
                    ),

                    const SizedBox(height: 18),

                    // =================================================
                    // CONFIRMAR SENHA
                    // =================================================

                    _tituloCampo('Confirmar Senha'),

                    _campoSenha(
                      controller: confirmarSenhaController,
                      hint: 'xxxxxxxx',
                      mostrarSenha: mostrarConfirmarSenha,
                      aoClicar: () {
                        setState(() {
                          mostrarConfirmarSenha =
                              !mostrarConfirmarSenha;
                        });
                      },
                    ),

                    // =================================================
                    // ESPAÇO ANTES DO ENDEREÇO
                    // =================================================

                    const SizedBox(height: 18),

                    // =================================================
                    // ENDEREÇO
                    // =================================================

                    _tituloCampo('CEP'),

                    _campoTexto(
                      controller: cepController,
                      hint: 'XXXXXX-XXX',
                      keyboardType: TextInputType.number,
                    ),

                    const SizedBox(height: 18),

                    // =================================================
                    // ESTADO
                    // =================================================

                    _tituloCampo('Estado'),

                    _campoTexto(
                      controller: estadoController,
                      hint: 'Seu Estado',
                    ),

                    const SizedBox(height: 18),

                    // =================================================
                    // CIDADE
                    // =================================================

                    _tituloCampo('Cidade'),

                    _campoTexto(
                      controller: cidadeController,
                      hint: 'Sua Cidade',
                    ),

                    const SizedBox(height: 18),

                    // =================================================
                    // BAIRRO
                    // =================================================

                    _tituloCampo('Bairro'),

                    _campoTexto(
                      controller: bairroController,
                      hint: 'Seu Bairro',
                    ),

                    const SizedBox(height: 18),

                    // =================================================
                    // RUA
                    // =================================================

                    _tituloCampo('Rua'),

                    _campoTexto(
                      controller: ruaController,
                      hint: 'Sua rua',
                    ),

                    const SizedBox(height: 35),

                    // =================================================
                    // BOTÃO PRÓXIMO
                    // =================================================

                    SizedBox(
                      width: double.infinity,
                      height: 42,

                      child: ElevatedButton(
                        onPressed: () {
                          // =================================================
                          // FUTURAMENTE:
                          //
                          // 1. Validar os dados.
                          // 2. Verificar senha e confirmação.
                          // 3. Salvar usuário no banco.
                          // 4. Continuar para a próxima etapa.
                          // =================================================
                        },

                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFFB7191E),
                          foregroundColor: Colors.white,
                          elevation: 0,

                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25),
                          ),
                        ),

                        child: const Text(
                          'Próximo',

                          style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),

                    // Espaço depois do botão
                    const SizedBox(height: 35),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // =====================================================
  // TÍTULO DOS CAMPOS
  // =====================================================

  Widget _tituloCampo(String texto) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 4),

      child: Text(
        texto,

        style: const TextStyle(
          color: Colors.white,
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  // =====================================================
  // CAMPO DE TEXTO
  // =====================================================

  Widget _campoTexto({
    required TextEditingController controller,
    required String hint,
    TextInputType? keyboardType,
  }) {
    return TextField(
      controller: controller,

      keyboardType: keyboardType,

      style: const TextStyle(
        color: Colors.white,
        fontSize: 15,
      ),

      decoration: InputDecoration(
        hintText: hint,

        hintStyle: const TextStyle(
          color: Colors.white,
          fontSize: 14,
        ),

        contentPadding: const EdgeInsets.symmetric(
          horizontal: 14,
          vertical: 11,
        ),

        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(7),

          borderSide: const BorderSide(
            color: Colors.white,
            width: 1,
          ),
        ),

        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(7),

          borderSide: const BorderSide(
            color: Colors.white,
            width: 1.5,
          ),
        ),
      ),
    );
  }

  // =====================================================
  // CAMPO DE SENHA
  // =====================================================

  Widget _campoSenha({
    required TextEditingController controller,
    required String hint,
    required bool mostrarSenha,
    required VoidCallback aoClicar,
  }) {
    return TextField(
      controller: controller,

      obscureText: !mostrarSenha,

      style: const TextStyle(
        color: Colors.white,
        fontSize: 15,
      ),

      decoration: InputDecoration(
        hintText: hint,

        hintStyle: const TextStyle(
          color: Colors.white,
          fontSize: 14,
        ),

        contentPadding: const EdgeInsets.symmetric(
          horizontal: 14,
          vertical: 11,
        ),

        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(7),

          borderSide: const BorderSide(
            color: Colors.white,
            width: 1,
          ),
        ),

        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(7),

          borderSide: const BorderSide(
            color: Colors.white,
            width: 1.5,
          ),
        ),

        suffixIcon: IconButton(
          onPressed: aoClicar,

          icon: Icon(
            mostrarSenha
                ? Icons.visibility
                : Icons.visibility_off,

            color: Colors.white70,

            size: 20,
          ),
        ),
      ),
    );
  }
}