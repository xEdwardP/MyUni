import 'package:flutter/material.dart';
import 'package:myuni/utils/AppColors.dart';
import 'package:myuni/widgets/custom_drawer.dart';

class SignUpScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pantalla de registro'),
        backgroundColor: AppColors.primary,
      ),
      drawer: CustomDrawer(),
      body: Center(
        child: Text(
          '¡Registra tu nueva cuenta!',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
