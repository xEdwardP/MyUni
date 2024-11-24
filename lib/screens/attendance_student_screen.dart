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

  String? _entrada;
  String? _salida;

//Mark to Time of Entry & Leave
  void _marcaEntrada() {
    setState(() {
      _entrada = TimeOfDay.now().format(context);
    });
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Hora de entrada: $_entrada')),
    );
  }

  void _marcaSalida() {
    setState(() {
      _salida = TimeOfDay.now().format(context);
    });
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Hora de salida: $_salida')),
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
            onPressed: () {},
            icon: const Icon(Icons.notifications),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.settings),
          ),
        ],
      ),
      drawer: CustomDrawer(),
      backgroundColor: const Color.fromARGB(255, 220, 255, 208),
      body: Center(
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
                      color: Colors.indigo,
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
                    ),
                  ),
                  SizedBox(height: 15),
                  TextField(
                    controller: _id,
                    decoration: InputDecoration(
                        labelText: 'Cuenta',
                        hintText: '0000200500000',
                        border: OutlineInputBorder(),
                        icon: Icon(Icons.account_circle_outlined)),

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
                      onPressed: _marcaSalida, child: Text('Marcar Salida')),
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
    );
  }
}
