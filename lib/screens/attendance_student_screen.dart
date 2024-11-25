import 'package:flutter/material.dart';
import 'package:myuni/utils/AppColors.dart';
import 'package:myuni/widgets/custom_drawer.dart';

class AttendanceStudent extends StatefulWidget {
  const AttendanceStudent({super.key});

  @override
  State<AttendanceStudent> createState() => _AttendanceStudentState();
}

//Assittence of Students
class _AttendanceStudentState extends State<AttendanceStudent> {
  final TextEditingController _name = TextEditingController();
  final TextEditingController _id = TextEditingController();

  List <Map<String,String>> _registro =[];

  String? _entrada;
  String? _salida;

//Mark to Time of Entry & Leave
  void _marcaEntrada() {
  
  if(_name.text.isNotEmpty && _id.text.isNotEmpty){
 setState(() {
      _entrada = TimeOfDay.now().format(context);
      _registro.add({
        'nombre': _name.text,
        'identidad': _id.text,
    });


    });
     ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Hora de entrada: $_entrada')),
    );

  }else{
    ScaffoldMessenger.of(context).showSnackBar(
     SnackBar(content: Text('Error! Necesita llenar todos los campos')), 
    );
   
   
    _name.clear();
    _id.clear();
  }
  }

  void _marcaSalida() {
     if(_name.text.isNotEmpty && _id.text.isNotEmpty){
 setState(() {
      _salida = TimeOfDay.now().format(context);
      _registro.add({
        'nombre': _name.text,
        'identidad': _id.text,
    });

    });
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Hora de salida: $_salida')),
    );
  }else{
    ScaffoldMessenger.of(context).showSnackBar(
     SnackBar(content: Text('Error! Necesita llenar todos los campos')), 
    );
  }
       _name.clear();
       _id.clear();
  }
  void _historial(){
    showDialog(
      context: context,
      builder: (context){
        return AlertDialog(
          title: Text('Historial de entrads y salidas'),
          content: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: _registro.map((entrada) {
                  return ListTile(
                      title: Text('${entrada['nombre']} - ${entrada['identidad']}'),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Entrada: ${entrada['entrada'] ?? 'No registrado'}'),
                      Text('Salida: ${entrada['salida'] ?? 'No registrado'}'),
                    ],
                  ),
                  );
              }).toList(),

            ),
          ),
          actions: [
            TextButton(
                onPressed: (){
                  Navigator.pop(context);
                },
                child: Text('Cerrar'),
            ),
          ],
        );
      }
    );
  }

//Screen
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Row(
          children: [
            Icon(
              Icons.home,
              size: 28,
            ),
            SizedBox(
              width: 5,
            ),
            Text(
              'Visitas',
              style: TextStyle(fontSize: 25),
            ),
            
          ],
        ),
        centerTitle: true,
        elevation: 4.0,
        backgroundColor: AppColors.secondary,
        actions: [
          IconButton(
            onPressed: _historial,
            icon: const Icon(Icons.notifications_active),
          ),
          
        ],
      ),
      drawer: CustomDrawer(),
      
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.green[50]!,
              Colors.green[200]!,
              Colors.green[400]!,

            ]
            ),
        ),

        child:   Center(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                children: [
                  Text(
                    'REGISTRO DE ASISTENCIA',
                    style: TextStyle(
                      fontSize: 30,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextField(
                    controller: _name,
                    decoration: InputDecoration(
                      labelText: 'Nombre',
                      hintText: 'Jose Alvarado',
                      border: OutlineInputBorder(),
                      icon: Icon(Icons.person_2_outlined),
                      filled: true,
                      fillColor: Colors.white,
                    ),
                  ),
                  SizedBox(height: 15),
                  TextField(
                    controller: _id,
                    decoration: InputDecoration(
                        labelText: 'Cuenta',
                        hintText: '0000200500000',
                        border: OutlineInputBorder(),
                        icon: Icon(Icons.account_circle_outlined),
                        filled: true,
                      fillColor: Colors.white,
                        ),
                        

                    //Button for Mark
                    keyboardType: TextInputType.number,
                  ),
                  SizedBox(height: 15),
                  ElevatedButton(
                    onPressed: _marcaEntrada,
                    child: Text('Marcar Entrada'),
                  ),
                  SizedBox(height: 15),
                  ElevatedButton(
                      onPressed: _marcaSalida, 
                      child: Text('Marcar Salida')
                      ),
                  SizedBox(height: 10),
                  if (_entrada != null)
                    Text(
                      'Hora de entrada $_entrada',
                      style: TextStyle(fontSize: 15),
                    ),
                  if (_salida != null)
                    Text(
                      'Hora de salida $_salida',
                      style: TextStyle(fontSize: 15),
                    ),
                ],
              )
            ],
          ),
        ),
      ),
      ),
      
     
    );
  }
}
