import 'package:flutter/material.dart';

// Backend para manejar la lógica de la aplicación
class Backend {
  // Variables para manejar el estado
  final TextEditingController nameController = TextEditingController();
  final TextEditingController idController = TextEditingController();
  final List<String> hisEntradas = [];
  final List<String> hisSalidas = [];
  bool registro = false;

  // Método de entrada
  void registrarEntrada(BuildContext context) {
    final nombre = nameController.text;
    final identidad = idController.text;

    if (nombre.isEmpty || identidad.isEmpty) {
      _mostrarMensaje(context, 'Por favor, complete todos los campos.');
    } else {
      registro = true;
      hisEntradas.add('Entrada: $nombre - $identidad (${DateTime.now()})');
      _mostrarMensaje(context, 'Entrada registrada correctamente.');
    }
    nameController.clear();
    idController.clear();
  }

  // Método de salida
  void registrarSalida(BuildContext context) {
    final nombre = nameController.text;
    final identidad = idController.text;

    if (!registro) {
      _mostrarMensaje(context, 'Error: No ha registrado su entrada.');
    } else if (nombre.isEmpty || identidad.isEmpty) {
      _mostrarMensaje(context,
          'Por favor, complete todos los campos para registrar la salida.');
    } else if (hisEntradas.isNotEmpty &&
        !hisEntradas.last.contains('$nombre - $identidad')) {
      _mostrarMensaje(context,
          'Error: Los datos no coinciden con el último registro de entrada.');
    } else {
      registro = false;
      hisSalidas.add('Salida: $nombre - $identidad (${DateTime.now()})');
      _mostrarMensaje(context, 'Salida registrada correctamente.');
    }
    nameController.clear();
    idController.clear();
  }

  // Método para mostrar mensajes en un SnackBar
  void _mostrarMensaje(BuildContext context, String mensaje) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(mensaje)),
    );
  }

  // Método que muestra la información de entrada
  void mostrarHistorialEntradas(BuildContext context) {
    if (hisEntradas.isEmpty) {
      _mostrarMensaje(context, 'No hay entradas registradas.');
    } else {
      _mostrarHistorial(context, 'Historial de Entradas', hisEntradas);
    }
  }

  // Método que muestra la información de salida
  void mostrarHistorialSalidas(BuildContext context) {
    if (hisSalidas.isEmpty) {
      _mostrarMensaje(context, 'No hay salidas registradas.');
    } else {
      _mostrarHistorial(context, 'Historial de Salidas', hisSalidas);
    }
  }

  // Método genérico para mostrar un historial en un cuadro de diálogo
  void _mostrarHistorial(
      BuildContext context, String titulo, List<String> historial) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(titulo),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: historial.map((e) => Text(e)).toList(),
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
