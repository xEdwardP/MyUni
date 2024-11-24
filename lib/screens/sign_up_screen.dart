import 'package:flutter/material.dart';
import 'package:myuni/services/authservice.dart';
import 'package:provider/provider.dart';


//Class of Sing Up
class SignUpScreen extends StatefulWidget {
const SignUpScreen({super.key});

  @override
State<SignUpScreen> createState()=> _SignScreenState();
}

class _SignScreenState extends State<SignUpScreen> {
  final TextEditingController name = TextEditingController();
  final TextEditingController email= TextEditingController();
  final TextEditingController password = TextEditingController();

    Widget build(BuildContext context) {
      final authservice = Provider.of<Authservice>(context);
    return SafeArea(

      child: Scaffold(
        backgroundColor: Color.fromRGBO(255, 240, 204, 0.982),
        body: Center(

          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                children: [
                  //logo UNICAH
                 Image.asset(
                  'assets/ logo.png',
                  height: 200,
                  ),
                  SizedBox(height: 10),
                  //Title
                  Text(
                    "Crea una Cuenta",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),

              //Method of TextBox
              SizedBox(height: 25.0),
              _textFleldName(context),
              SizedBox(height: 15.0),
              _textFleldEmail(context),
              SizedBox(height: 15.0),
              _textFleldPassword(context),
              SizedBox(height: 15.0),


              //Mover al inicio de sesion
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '¿Ya tienes una cuenta?',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                    ),
                  ),

                  //Button that move to Login
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      'Inicia Sesión',
                      style: TextStyle(color: Colors.blue),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),
              
              //Sign Correct
              if(authservice.band)
               Text(
                'Su cuenta se ah Registrado con exito!',
                style: TextStyle(
                  color: Colors.cyan[100],
                  fontWeight: FontWeight.bold,
                ),
                
              )
              else if (authservice.email.isNotEmpty || authservice.password.isNotEmpty)
              Text(
                'Error! Su Correo o Contraseña no cumplen con los requisitos necesarios ',
                style: TextStyle(
                  color: Colors.red[400],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


  //Widgets of TextBox

  Widget _textFleldName(BuildContext context) {
        final authservice = Provider.of<Authservice>(context, listen: false);
    return _TextFieldGeneral(
      labelText: 'Nombre',
      hintText: 'Jose Alvarado',
      onChanged: (value) => authservice.setuser(value),
      icon: Icons.person_2_outlined,
    );
  }

  Widget _textFleldEmail(BuildContext context) {
    final authservice = Provider.of<Authservice>(context, listen: false);
    return _TextFieldGeneral(
      labelText: 'Email',
      hintText: 'Example@gmail.com',
      keyboardType: TextInputType.emailAddress,
      onChanged: (value) => authservice.setEmail(value),
      icon: Icons.email_outlined,
    );
  }

  Widget _textFleldPassword(BuildContext context) {
    final authservice = Provider.of<Authservice>(context, listen: false);
    return _TextFieldGeneral(
      labelText: 'Contraseña',
      onChanged: (value) =>authservice.setPassword(value),
      icon: Icons.lock_outline_rounded,
      obscuretext: true,
    );
  }




//Class of Conditional TextBox

class _TextFieldGeneral extends StatelessWidget {
  final String labelText;
  final String hintText;
  final Function(String) onChanged;
  final TextInputType? keyboardType;
  final IconData? icon;
  final bool obscuretext;


  const  _TextFieldGeneral({
    required this.labelText,
    this.hintText = '',
    required this.onChanged,
    this.keyboardType,
    this.icon,
    this.obscuretext = false,
  });


//Widget of Conditional
  @override
  Widget build(BuildContext context) {
    return Padding(padding: const EdgeInsets.symmetric(horizontal: 20),
    child:
     Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.black),
        borderRadius: BorderRadius.circular(10),
      ) ,
      margin: EdgeInsets.symmetric(horizontal: 30.0),
      child: TextField(
        keyboardType: keyboardType,
        obscureText: obscuretext,
        decoration: InputDecoration(
          prefixIcon:  Icon(icon),
          labelText: labelText,
          hintText: hintText,
          border: OutlineInputBorder(),
        ),
        onChanged: onChanged,
      ),
    ), 
    );
   
  }
}
