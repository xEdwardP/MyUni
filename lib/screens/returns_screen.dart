import 'package:flutter/material.dart';
import 'package:myuni/widgets/custom_drawer.dart';
import 'package:myuni/utils/AppColors.dart';

class ReturnsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Gestión de Devoluciones'),
        backgroundColor: AppColors.primary,
      ),
      drawer: CustomDrawer(),
      body: Center(
        child: Text(
          'Aquí se gestionarán las devoluciones de libros.',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
