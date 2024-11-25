import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:myuni/models/login_model.dart';
import 'package:myuni/utils/AppColors.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final loginModel = Provider.of<LoginModel>(context);
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(colors: <Color>[
            AppColors.loginPrimary,
            AppColors.loginSecundary,
            AppColors.loginThird,
            AppColors.loginFourth,
          ], begin: Alignment.topLeft, end: Alignment.bottomRight),
        ),
        child: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              child: Form(
                key: _formKey,
                child: LayoutBuilder(
                  builder: (context, constraints) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/logo.png',
                          height: size.height * 0.3, // Responsivo
                        ),
                        Text(
                          'INICIAR SESIÓN',
                          style: GoogleFonts.bebasNeue(
                              fontSize: 48, color: AppColors.primary),
                        ),
                        const Text('¡Bienvenido de vuelta!',
                            style: TextStyle(
                              fontSize: 18,
                              color: AppColors.primary,
                            )),
                        const SizedBox(height: 10),

                        // Email textfield
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20.0),
                          child: Container(
                            constraints: BoxConstraints(
                              maxWidth: constraints.maxWidth > 600
                                  ? 400
                                  : size.width * 0.8,
                            ),
                            decoration: BoxDecoration(
                              color: AppColors.secondary,
                              border: Border.all(color: AppColors.background),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(left: 20.0),
                              child: TextFormField(
                                controller: emailController,
                                onChanged: (value) =>
                                    loginModel.setEmail(value),
                                decoration: const InputDecoration(
                                  border: InputBorder.none,
                                  labelText: 'Correo electrónico',
                                ),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Por favor ingresa tu correo electrónico';
                                  }
                                  return null;
                                },
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 10),

                        // Password textfield
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20.0),
                          child: Container(
                            constraints: BoxConstraints(
                              maxWidth: constraints.maxWidth > 600
                                  ? 400
                                  : size.width * 0.8,
                            ),
                            decoration: BoxDecoration(
                              color: AppColors.secondary,
                              border: Border.all(color: AppColors.background),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(left: 20.0),
                              child: TextFormField(
                                controller: passwordController,
                                onChanged: (value) =>
                                    loginModel.setPassword(value),
                                obscureText: true,
                                decoration: const InputDecoration(
                                  labelText: 'Contraseña',
                                  border: InputBorder.none,
                                ),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Por favor ingresa tu contraseña';
                                  }
                                  return null;
                                },
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),

                        // Sign In Button
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20.0),
                          child: GestureDetector(
                            onTap: () {
                              if (_formKey.currentState!.validate()) {
                                loginModel.login(context, emailController,
                                    passwordController);
                              }
                            },
                            child: Container(
                              constraints: BoxConstraints(
                                maxWidth: constraints.maxWidth > 600
                                    ? 400
                                    : size.width * 0.8,
                              ),
                              padding: const EdgeInsets.all(20),
                              decoration: BoxDecoration(
                                color: AppColors.primary,
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: const Center(
                                child: Text(
                                  'Ingresar',
                                  style: TextStyle(
                                    color: AppColors.background,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 25),

                        // if (loginModel.isLoggedIn)
                        //   const Text(
                        //     'Inicio exitoso!',
                        //     style: TextStyle(color: AppColors.primary),
                        //   ),
                        // else if (loginModel.email.isNotEmpty ||
                        //     loginModel.password.isNotEmpty)
                        //   const Text(
                        //     'Credenciales inválidas!',
                        //     style: TextStyle(
                        //         fontWeight: FontWeight.bold,
                        //         color: AppColors.error),
                        //   ),
                        const SizedBox(height: 10),
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Sistema de Control Bibliotecario 2024',
                              style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.background),
                            )
                          ],
                        ),
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              '© Todos los Derechos Reservados',
                              style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.background),
                            )
                          ],
                        ),
                        const SizedBox(height: 10),
                      ],
                    );
                  },
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
