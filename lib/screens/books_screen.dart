import 'package:flutter/material.dart';
import 'package:myuni/widgets/custom_drawer.dart';
import 'package:myuni/utils/AppColors.dart';

class BooksScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Catálogo de Libros'),
        backgroundColor: AppColors.primary,
      ),
      drawer: CustomDrawer(),
      body: Center(
        child: Text(
          'Aquí se mostrará el catálogo de libros.',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
