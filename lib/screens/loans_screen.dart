import 'package:flutter/material.dart';
import 'package:myuni/widgets/custom_drawer.dart';
import 'package:myuni/utils/AppColors.dart';

class LoansScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Gestión de Préstamos'),
        backgroundColor: AppColors.primary,
      ),
      drawer: CustomDrawer(),
      body: Center(
        child: Text(
          'Aquí se gestionarán los préstamos de libros.',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
