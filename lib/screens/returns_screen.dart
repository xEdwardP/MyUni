import 'package:flutter/material.dart';
import 'package:myuni/widgets/custom_drawer.dart';
import 'package:myuni/utils/AppColors.dart';

class ReturnsScreen extends StatefulWidget {
  @override
  _ReturnsScreenState createState() => _ReturnsScreenState();
}

class _ReturnsScreenState extends State<ReturnsScreen> {
  // Controladores para capturar los datos del formulario
  final _bookIdController = TextEditingController();
  final _studentIdController = TextEditingController();

  // Lista inicial simulada de devoluciones realizadas
  final List<Map<String, String>> _returnsList = [
    {'bookId': '12345', 'studentId': '001', 'returnDate': '2024-11-20'},
    {'bookId': '67890', 'studentId': '002', 'returnDate': '2024-11-21'},
  ];

  // Método para añadir una nueva devolución a la lista
  void _addReturn() {
    setState(() {
      // Agrega un nuevo elemento con los datos ingresados y la fecha actual
      _returnsList.add({
        'bookId': _bookIdController.text,
        'studentId': _studentIdController.text,
        'returnDate': DateTime.now().toString().split(' ')[0],
      });
      // Limpia los campos de texto
      _bookIdController.clear();
      _studentIdController.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Título de la pantalla
        title: Text('Gestión de Devoluciones'),
        backgroundColor: AppColors.secondary, // Color personalizado para la app
      ),
      drawer: CustomDrawer(), // Menú lateral (drawer) personalizado
      body: SingleChildScrollView(
        // Permite que la pantalla sea desplazable en caso de contenido largo
        child: Padding(
          padding: const EdgeInsets.all(16.0), // Margen alrededor del contenido
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start, // Alineación de texto
            children: [
              // Título para la sección del formulario
              Text(
                'Registrar Devolución',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: AppColors.primary, // Color principal
                ),
              ),
              SizedBox(height: 10), // Espaciado entre elementos

              // Tarjeta que contiene el formulario
              Card(
                elevation: 4, // Sombra para dar profundidad
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10), // Bordes redondeados
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      // Campo de texto para el ID del libro
                      TextField(
                        controller: _bookIdController,
                        decoration: InputDecoration(
                          labelText: 'ID del Libro',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                      ),
                      SizedBox(height: 10), // Espaciado entre campos
                      // Campo de texto para el Numero de Cuenta del estudiante
                      TextField(
                        controller: _studentIdController,
                        decoration: InputDecoration(
                          labelText: 'Numero de Cuenta del Estudiante',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                      ),
                      SizedBox(height: 20), // Espaciado entre campos y botón

                      // Botón para registrar una devolución
                      ElevatedButton.icon(
                        onPressed: _addReturn, // Ejecuta la función _addReturn
                        icon: Icon(Icons.check_circle_outline), // Ícono del botón
                        label: Text('Registrar'),
                        style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.symmetric(
                              vertical: 14, horizontal: 24), // Tamaño del botón
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          backgroundColor: AppColors.primary, // Color principal
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20), // Espaciado antes del historial

              // Línea divisoria entre secciones
              Divider(height: 20, thickness: 2),

              // Título para la sección del historial
              Text(
                'Historial de Devoluciones',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: AppColors.primary,
                ),
              ),
              SizedBox(height: 10), // Espaciado entre el título y la lista

              // Lista de devoluciones mostrada en tarjetas
              ListView.builder(
                shrinkWrap: true, // Permite que la lista se adapte al contenido
                physics: NeverScrollableScrollPhysics(), // Desactiva el scroll
                itemCount: _returnsList.length, // Número de elementos en la lista
                itemBuilder: (context, index) {
                  final returnItem = _returnsList[index]; // Elemento actual
                  return Card(
                    elevation: 3, // Sombra para resaltar la tarjeta
                    margin: EdgeInsets.symmetric(vertical: 8), // Margen vertical
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10), // Bordes redondeados
                    ),
                    child: ListTile(
                      leading: Icon(Icons.book, color: AppColors.primary), // Ícono
                      title: Text('Libro: ${returnItem['bookId']}'), // ID del libro
                      subtitle: Text(
                        'Estudiante: ${returnItem['studentId']}\nFecha: ${returnItem['returnDate']}',
                      ), // Detalles adicionales
                       // Flecha al final
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    // Limpia los controladores al salir de la pantalla
    _bookIdController.dispose();
    _studentIdController.dispose();
    super.dispose();
  }
}
