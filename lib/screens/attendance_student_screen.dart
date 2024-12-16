import 'package:flutter/material.dart';
import 'package:myuni/models/attendance_model.dart';
import 'package:myuni/utils/AppColors.dart';
import 'package:myuni/widgets/custom_drawer.dart';

class AttendanceApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Registro de Asistencias',
      home: AttendanceScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class AttendanceScreen extends StatefulWidget {
  @override
  _AttendanceScreenState createState() => _AttendanceScreenState();
}

class _AttendanceScreenState extends State<AttendanceScreen> {
  final Backend backend = Backend();

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
      drawer: CustomDrawer(),
      body: Container(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Espacio para el banner ajustado
              Container(
                height: 200, // Ajusta la altura para evitar recortes
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  image: DecorationImage(
                    image: AssetImage('assets/logo.png'),
                    fit: BoxFit.contain, // Se ajusta al espacio disponible
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
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    // TextBox del nombre
                    TextField(
                      controller: backend.nameController,
                      decoration: InputDecoration(
                        labelText: 'Nombre',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    // TextBox de la identidad
                    TextField(
                      controller: backend.idController,
                      decoration: InputDecoration(
                        labelText: 'Número de Identidad',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                      keyboardType: TextInputType.number,
                    ),
                    SizedBox(height: 20),
                    // Botones para marcar entrada y salida en una fila
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ElevatedButton.icon(
                          onPressed: () => backend.registrarEntrada(context),
                          icon: Icon(Icons.login),
                          label: Text('Entrada'),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.lightBlue[50],
                            minimumSize: Size(150, 40),
                          ),
                        ),
                        ElevatedButton.icon(
                          onPressed: () => backend.registrarSalida(context),
                          icon: Icon(Icons.logout),
                          label: Text('Salida'),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.lightBlue[50],
                            minimumSize: Size(150, 40),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Spacer(),
              // Botones para mostrar el historial
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton.icon(
                    onPressed: () => backend.mostrarHistorialEntradas(context),
                    icon: Icon(Icons.add_circle_outlined),
                    label: Text('Entrada'),
                  ),
                  ElevatedButton.icon(
                    onPressed: () => backend.mostrarHistorialSalidas(context),
                    icon: Icon(Icons.remove_circle),
                    label: Text('Salida'),
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
