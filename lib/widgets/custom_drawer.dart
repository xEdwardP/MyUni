import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:myuni/models/login_model.dart';
import 'package:myuni/utils/AppColors.dart';

class CustomDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final loginModel = Provider.of<LoginModel>(context);

    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(
              color: AppColors.secondary,
            ),
            child: Text(
              'Biblioteca UNICAH',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text('Inicio'),
            onTap: () {
              Navigator.pushReplacementNamed(context, '/home');
            },
          ),
          ListTile(
            leading: const Icon(Icons.book),
            title: const Text('Libros'),
            onTap: () {
              Navigator.pushReplacementNamed(context, '/books');
            },
          ),
          ListTile(
            leading: const Icon(Icons.bookmark),
            title: const Text('Gestión de Préstamos'),
            onTap: () {
              Navigator.pushReplacementNamed(context, '/loans');
            },
          ),
          ListTile(
            leading: const Icon(Icons.assignment_return),
            title: const Text('Gestión de Devoluciones'),
            onTap: () {
              Navigator.pushReplacementNamed(context, '/returns');
            },
          ),
          ListTile(
            leading: const Icon(Icons.logout),
            title: const Text('Cerrar Sesión'),
            onTap: () {
              loginModel.logout();
              Navigator.pushReplacementNamed(context, '/login');
            },
          ),
        ],
      ),
    );
  }
}
