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

  @override
  Widget build(BuildContext context) {
    final loginModel = Provider.of<LoginModel>(context);

    void _clear() {
      emailController.clear();
      passwordController.clear();
    }

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
              child: Column(
                children: [
                  // Icon
                  // const Icon(
                  //   Icons.account_circle,
                  //   size: 200,
                  //   color: AppColors.primary,
                  // ),
                  Image.asset(
                    'assets/logo.png',
                    height: 300,
                  ),

                  const SizedBox(height: 5),

                  // Hello Text
                  Text(
                    'INICIAR SESIÓN',
                    style: GoogleFonts.bebasNeue(
                        fontSize: 48, color: AppColors.primary),
                  ),
                  const SizedBox(height: 5),
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
                      decoration: BoxDecoration(
                          color: AppColors.secondary,
                          border: Border.all(color: AppColors.background),
                          borderRadius: BorderRadius.circular(15)),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20.0),
                        child: TextField(
                          onChanged: (value) => loginModel.setEmail(value),
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Correo electrónico',
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),

                  // Password textfield
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Container(
                      decoration: BoxDecoration(
                          color: AppColors.secondary,
                          border: Border.all(color: AppColors.background),
                          borderRadius: BorderRadius.circular(15)),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20.0),
                        child: TextField(
                          onChanged: (value) => loginModel.setPassword(value),
                          obscureText: true,
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Contraseña',
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),

                  // Sign In Button
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: GestureDetector(
                      onTap: () => loginModel.login(context),
                      child: Container(
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

                  // Login Status Message
                  if (loginModel.isLoggedIn)
                    const Text(
                      'Inicio exitoso!',
                      style: TextStyle(color: Colors.green),
                    )
                  else if (loginModel.email.isNotEmpty ||
                      loginModel.password.isNotEmpty)
                    const Text(
                      'Credenciales invalidas!',
                      style: TextStyle(color: Colors.red),
                    ),

                  const SizedBox(height: 10),

                  // Register Text
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '¿Aún no tienes una cuenta?',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: AppColors.background),
                      ),
                      Text(
                        ' ¡Regístrate aquí!',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: AppColors.accent),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
