import 'package:flutter/material.dart';
import 'package:myuni/utils/AppColors.dart';

class Attendance extends StatefulWidget {
  @override
  _AttendanceState createState() => _AttendanceState();
}

class _AttendanceState extends State<Attendance> {
  //variable que administra el nombre y la identidad
  final _name = TextEditingController();
  final _id = TextEditingController();

  //bandera de condicion
  bool _registro = false;

  //listas donde se almacena la informacion ingresada
  final List<String> _hisentradas = [];
  final List<String> _hissalidas = [];

  //metodo de entrada
  void _entradas() {
    final nombre = _name.text;
    final identidad = _id.text;

    if (nombre.isEmpty || identidad.isEmpty) {
      _messange('Por favor, complete todos los campos.');
    } else {
      setState(() {
        _registro = true;
        _hisentradas.add('Entrada: $nombre - $identidad (${DateTime.now()})');
      });
      _messange('Entrada registrada correctamente.');
    }
    _name.clear();
    _id.clear();
  }

  //metodo de salida
  void _salidas() {
    if (_registro == false) {
      _messange('Error: No ha registrado su entrada.');
    } else {
      setState(() {
        _registro = false;
        _hissalidas.add('Salida: (${DateTime.now()})');
      });
      _messange('Salida registrada correctamente.');
    }
    _name.clear();
    _id.clear();
  }

  void _messange(String mensaje) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(mensaje)),
    );
  }

  //metodo que muestra la informacion de entrada
  void _infoentrada() {
    if (_hisentradas.isEmpty) {
      _messange('No hay entradas registradas.');
    } else {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Historial de Entradas'),
            content: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: _hisentradas.map((e) => Text(e)).toList(),
              ),
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: Text('Cerrar'),
              ),
            ],
          );
        },
      );
    }
  }

  //metodo que muestra la informacion de salida
  void _infosalida() {
    if (_hissalidas.isEmpty) {
      _messange('No hay salidas registradas.');
    } else {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Historial de Salidas'),
            content: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: _hissalidas.map((e) => Text(e)).toList(),
              ),
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: Text('Cerrar'),
              ),
            ],
          );
        },
      );
    }
  }

//Conotrol del screen
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Row(
          children: [
            Icon(Icons.list, size: 28),
            SizedBox(width: 5),
            Text('Asistencias', style: TextStyle(fontSize: 25)),
          ],
        ),
        centerTitle: true,
        elevation: 4.0,
        backgroundColor: AppColors.secondary,
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.notifications)),
          IconButton(onPressed: () {}, icon: const Icon(Icons.settings)),
        ],
      ),
      body: Container(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Espacio para el banner
              Container(
                height: 150,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  image: DecorationImage(
                    image: AssetImage('assets/logo.png'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(height: 20),
              // Formulario
              Container(
                padding: EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15.0),
                ),
                //text box del nombre
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    TextField(
                      controller: _name,
                      decoration: InputDecoration(
                        labelText: 'Nombre',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    //textbox de la identidad
                    TextField(
                      controller: _id,
                      decoration: InputDecoration(
                        labelText: 'Número de Identidad',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                      keyboardType: TextInputType.number,
                    ),
                    //boton para marcar entrada
                    SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: _entradas,
                      child: Text('Marcar Entrada'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.lightBlue[50],
                      ),
                    ),

                    //boton para marcar salida
                    SizedBox(height: 10),
                    ElevatedButton(
                      onPressed: _salidas,
                      child: Text('Marcar Salida'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.lightBlue[50],
                      ),
                    ),
                  ],
                ),
              ),
              Spacer(), //los botones se undan
              //boton que muestra el historial de entrada
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Botón de información de entrada
                  ElevatedButton.icon(
                    onPressed: _infoentrada,
                    icon: Icon(Icons.add_circle_outlined, size: 20),
                    label: Text('Entrada'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: Colors.black,
                      padding:
                          EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                    ),
                  ),
                  // Botón de que muestra el historial de salida
                  ElevatedButton.icon(
                    onPressed: _infosalida,
                    icon: Icon(Icons.remove_circle, size: 20),
                    label: Text('Salida'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: Colors.black,
                      padding:
                          EdgeInsets.symmetric(horizontal: 12, vertical: 8),
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
}
