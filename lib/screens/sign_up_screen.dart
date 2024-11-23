import 'package:flutter/material.dart';

//clase de registro
class SignUpScreen extends StatelessWidget {
 
 static String id = "SingUpPage";

 @override

  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color.fromRGBO(255, 240, 204, 0.982),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              
              Row(
        children: [
            Text("BIBLIOTECA UNICAH",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color.fromARGB(255, 0, 0, 0),
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
             Text("Crea una Cuenta",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color.fromARGB(255, 0, 0, 0),
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
        ]  
              ),
              
           //metodos de los textbox
              SizedBox(height: 25.0,),
              _textFleldName(),
               SizedBox(height: 15.0,),
              _textFleldEmail(),
              SizedBox(height: 15.0,),
              _textFleldPassword(),
             SizedBox(height: 15.0,),
             Row(
              children: [
                  Text('¿Ya tienes una cuenta?',
                    style: TextStyle(
                      color: Colors.amber[50],
                      fontSize: 20,
                    ),
                  ),
                  _buttonsLogin(),
              ],
             )
             
    
            ],
          ),
        ),
      ),
    );
  }
  //metodo del nombre
  Widget _textFleldName() {

    return _TextFieldGeneral(
      labelText: 'Nombre',
      hintText: 'Jose Alvarado',
      onChanged: (value){},
    );
    
  }
  //metodo del email
  
 Widget _textFleldEmail() {
  return _TextFieldGeneral(
    labelText: 'Email',
    hintText: 'Example@gmail.com',
    keyboardType: TextInputType.emailAddress,
    onChanged: (value){},
    icon: Icons.email_outlined,
     );
 }
 //metodo de la contraseña
  
 Widget _textFleldPassword() {
  return _TextFieldGeneral(
    labelText: 'Contraseña',
    onChanged: (value){},
    icon: Icons.lock_outline_rounded,
    obscuretext: true,
  );
 }
 
 //metodo del boton de inicio de sesion
  Widget _buttonsLogin() {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color.fromARGB(0, 255, 255, 255), 
        foregroundColor: Colors.white,
        padding: const EdgeInsets.symmetric(horizontal: 110.0,vertical: 10),
        shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
        ),
      ),
      
      onPressed: (){
    
      }, 

    child: Text('Inicia Sesión',
    style: TextStyle(
    color: Colors.amber[50],
    fontSize: 20,
      ),
    ),

    ); 
  }
  
}

class _TextFieldGeneral extends StatelessWidget {
  final String labelText;
  final String hintText;
  final Function(String) onChanged;
  final TextInputType? keyboardType;
  final IconData? icon;
  final bool obscuretext;

  const _TextFieldGeneral({
   required this.labelText,
    this.hintText='',
    required this.onChanged,
    this.keyboardType,
    this.icon,
    this.obscuretext=false,

  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: 30.0,
      ),
       color: Colors.white,
       decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
       ),
      child: TextField(
        keyboardType: keyboardType,
        obscureText: obscuretext,
        decoration: InputDecoration(
          prefixIcon: Icon(icon),
          labelText: "labelText",
          hintText: "hintText",
        ),
        onChanged: onChanged,
      ),
    );
  }
}