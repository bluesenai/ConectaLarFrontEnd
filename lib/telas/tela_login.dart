import 'package:flutter/material.dart';
import 'tela_cadastro.dart';
import 'tela_vizinhanca.dart';

class TelaLogin extends StatefulWidget {
  const TelaLogin({super.key});

  @override
  State<TelaLogin> createState() => _TelaLoginState();
}

class _TelaLoginState extends State<TelaLogin> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController senhaController = TextEditingController();

  bool mostrarSenha = false;
  bool aceitouTermos = false;

  @override
  void dispose() {
    emailController.dispose();
    senhaController.dispose();
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
        child: SizedBox(
          width: largura,
          height: altura,
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
                top: -altura * 0.20,
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
              // FORMA CENTRAL/DIREITA
              // =====================================================

              Positioned(
                top: altura * 0.05,
                right: -largura * 0.65,
                child: Container(
                  width: largura * 1.45,
                  height: largura * 1.45,
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
                bottom: -altura * 0.12,
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
                bottom: -altura * 0.15,
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
              // CONTEÚDO DO LOGIN
              // =====================================================

              SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: largura * 0.10,
                    vertical: 25,
                  ),
                  child: Column(
                    children: [
                      SizedBox(height: altura * 0.08),

                      // =================================================
                      // ÍCONE
                      // =================================================

                      Container(
                        width: largura * 0.42,
                        height: largura * 0.42,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                        ),
                        padding: const EdgeInsets.all(14),
                        child: Image.asset(
                          'assets/images/iconeroda.png',
                          fit: BoxFit.contain,
                        ),
                      ),

                      SizedBox(height: altura * 0.09),

                      // =================================================
                      // TÍTULO LOGIN
                      // =================================================

                      const Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: EdgeInsets.only(left: 8),
                          child: Text(
                            'Login',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 24,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),

                      const SizedBox(height: 12),

                      // =================================================
                      // E-MAIL
                      // =================================================

                      const Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'E-mail',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),

                      const SizedBox(height: 4),

                      TextField(
                        controller: emailController,
                        keyboardType: TextInputType.emailAddress,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                        ),
                        decoration: InputDecoration(
                          hintText: 'Username@email.com',
                          hintStyle: const TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                          ),
                          contentPadding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 12,
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
                      ),

                      const SizedBox(height: 20),

                      // =================================================
                      // SENHA
                      // =================================================

                      const Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Senha',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),

                      const SizedBox(height: 4),

                      TextField(
                        controller: senhaController,
                        obscureText: !mostrarSenha,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                        ),
                        decoration: InputDecoration(
                          hintText: 'xxxxxxxx',
                          hintStyle: const TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                          ),
                          contentPadding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 12,
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
                            onPressed: () {
                              setState(() {
                                mostrarSenha = !mostrarSenha;
                              });
                            },
                            icon: Icon(
                              mostrarSenha
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                              color: Colors.white70,
                              size: 20,
                            ),
                          ),
                        ),
                      ),

                      // =================================================
                      // ESQUECI MINHA SENHA
                      // =================================================

                      Align(
                        alignment: Alignment.centerRight,
                        child: TextButton(
                          onPressed: () {
                            // Navegação será adicionada posteriormente.
                          },
                          style: TextButton.styleFrom(
                            padding: EdgeInsets.zero,
                            minimumSize: Size.zero,
                            tapTargetSize:
                                MaterialTapTargetSize.shrinkWrap,
                          ),
                          child: const Text(
                            'Esqueci minha senha',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 8,
                            ),
                          ),
                        ),
                      ),

                      const SizedBox(height: 10),

                      // =================================================
                      // BOTÃO PRÓXIMO
                      // =================================================

                      SizedBox(
                        width: double.infinity,
                        height: 42,
                        child: ElevatedButton(
                         onPressed: () {
 Navigator.push(
  context,
  MaterialPageRoute(
    builder: (context) => const TelaVizinhanca(),
  ),
);
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

                      const SizedBox(height: 8),

                      // =================================================
                      // TERMOS
                      // =================================================

                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: 20,
                            height: 20,
                            child: Checkbox(
                              value: aceitouTermos,
                              onChanged: (valor) {
                                setState(() {
                                  aceitouTermos = valor ?? false;
                                });
                              },
                              side: const BorderSide(
                                color: Colors.white,
                                width: 1,
                              ),
                              checkColor: const Color(0xFFE52F29),
                              activeColor: Colors.white,
                            ),
                          ),
                          const SizedBox(width: 5),
                          const Expanded(
                            child: Text(
                              'Li e aceito os Termos de Uso e a Política de Privacidade',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 8,
                              ),
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 8),

                      // =================================================
                      // OPÇÕES INFERIORES
                      // =================================================

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TextButton(
                            onPressed: () {
                              // Página do prestador futuramente.
                            },
                            style: TextButton.styleFrom(
                              padding: EdgeInsets.zero,
                              minimumSize: Size.zero,
                              tapTargetSize:
                                  MaterialTapTargetSize.shrinkWrap,
                            ),
                            child: const Text(
                              'Prestador de serviço',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 8,
                              ),
                            ),
                          ),
                         TextButton(
  onPressed: () {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const TelaCadastro(),
      ),
    );
  },
                            style: TextButton.styleFrom(
                              padding: EdgeInsets.zero,
                              minimumSize: Size.zero,
                              tapTargetSize:
                                  MaterialTapTargetSize.shrinkWrap,
                            ),
                            child: const Text(
                              'Não tem conta? Cadastre-se',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 8,
                              ),
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 25),
                    ],
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