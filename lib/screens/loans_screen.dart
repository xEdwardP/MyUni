import 'package:flutter/material.dart';
import 'package:myuni/widgets/custom_drawer.dart';
import 'package:myuni/utils/AppColors.dart';

class LoansScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Row(
          children: [
            Icon(
              Icons.bookmark,
              size: 28,
            ),
            SizedBox(
              width: 5,
            ),
            Text(
              'Prestamos',
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
      body: const Center(
        child: Text(
          'Aquí se gestionarán los préstamos de libros.',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
