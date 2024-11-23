import 'package:flutter/material.dart';

class SignUpScreen extends StatelessWidget {
 
 static String id = "SingUpPage";

 @override

//formato principal
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color.fromRGBO(255, 240, 204, 0.982),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //titulo de la pagina
              Text("Crea una Cuenta",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color.fromARGB(255, 0, 0, 0),
                fontSize: 40,
                fontWeight: FontWeight.bold,
              ),
              ),
              //espacio entre widgets

              SizedBox(height: 25.0,),
              //metodo para el nombre
              _textFleldName(),
               SizedBox(height: 15.0,),
               //metodo para el email
              _textFleldEmail(),
              SizedBox(height: 15.0,),
              //metodo para la contrasena
              _textFleldPassword(),
            


              
              //Retornar a login
                 Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                       Text(
                        '¿Ya tienes una cuenta?',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                        ),
                       ),
                   
                      Text('¡Inicia Sesión!',
                       style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.amber[50],
                       ),
                      ),
                      
                    ],
              
                  ),
    
            ],
          ),
        ),
      ),
    );
  }
  
  //metodos retornados con widget
 Widget _textFleldPassword() {

  return _textFieldGeneral();
 }


  
 Widget _textFleldEmail() {
  return TextField();
 }
  
 Widget _textFleldName() {
  return TextField();
 }
}

//clase de textbox
class _textFieldGeneral extends StatelessWidget {
  final String labelText;
  final String hintText;
  final Fuction onChanged;

  const _textFieldGeneral(({
    this.labelTex,t
    this.hintText,
    this.onChanged,
    }),
  });

  @override
  Widget build(BuildContext context) {
    return Container(
       margin: EdgeInsets.symmetric(
        horizontal: 30,
      ),
      decoration: BoxDecoration(
          color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: TextField(
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.person_outline),
        labelText: "Nombre",
        hintText: "José Alvarado",
        ),
        onChanged: (value){},
      ),
    );
  }
}

