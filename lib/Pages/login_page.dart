import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(colors: <Color>[
            Color(0xffF7EFE5),
            Color(0xffF7EFE5),
            Color(0xffC8A1E0),
            Color(0xff674188),
          ], begin: Alignment.topLeft, end: Alignment.bottomRight),
        ),
        child: SafeArea(
            child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                // Icon
                const Icon(
                  Icons.account_circle,
                  size: 200,
                  color: Color(0xff674188),
                ),

                const SizedBox(
                  height: 20,
                ),

                // Hello Text
                Text(
                  'INICIAR SESION',
                  style: GoogleFonts.bebasNeue(
                      fontSize: 48, color: const Color(0xff674188)),
                ),

                // Text
                const SizedBox(
                  height: 5,
                ),

                const Text('Bienvenido de vuelta!',
                    style: TextStyle(
                      fontSize: 18,
                      color: Color(0xff674188),
                      // fontWeight: FontWeight.bold),
                    )),

                const SizedBox(
                  height: 20,
                ),

                // Email textfield
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Container(
                    decoration: BoxDecoration(
                        color: const Color(0xffC8A1E0),
                        border: Border.all(color: const Color(0xffF7EFE5)),
                        borderRadius: BorderRadius.circular(15)),
                    child: const Padding(
                      padding: EdgeInsets.only(left: 20.0),
                      child: TextField(
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Correo electronico',
                        ),
                      ),
                    ),
                  ),
                ),

                const SizedBox(
                  height: 10,
                ),

                // Password textfield
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Container(
                    decoration: BoxDecoration(
                        color: const Color(0xffC8A1E0),
                        border: Border.all(color: const Color(0xffF7EFE5)),
                        borderRadius: BorderRadius.circular(15)),
                    child: const Padding(
                      padding: EdgeInsets.only(left: 20.0),
                      child: TextField(
                        obscureText: true,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Contraseña',
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),

                // Sign Buttom
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: GestureDetector(
                    onTap: () {},
                    child: Container(
                      padding: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: Color(0xff77037B),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Center(
                        child: Text(
                          'Ingresar',
                          style: TextStyle(
                            color: Color(0xffF7EFE5),
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),

                const SizedBox(
                  height: 25,
                ),

                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text(
                      'Aun no tiene una cuenta?',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Color(0xffF7EFE5)),
                    ),
                    Text(
                      ' Registrate aqui!',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Color(0xff77037B)),
                    ),
                  ],
                ),

                const SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
        )),
      ),
    );
  }
}
