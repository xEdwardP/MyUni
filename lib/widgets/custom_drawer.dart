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
          DrawerHeader(
            decoration: BoxDecoration(
              color: AppColors.primary,
            ),
            child: Text(
              'Menú Principal',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.book),
            title: Text('Libros'),
            onTap: () {
              Navigator.pushReplacementNamed(context, '/books');
            },
          ),
          ListTile(
            leading: Icon(Icons.bookmark),
            title: Text('Gestión de Préstamos'),
            onTap: () {
              Navigator.pushReplacementNamed(context, '/loans');
            },
          ),
          ListTile(
            leading: Icon(Icons.assignment_return),
            title: Text('Gestión de Devoluciones'),
            onTap: () {
              Navigator.pushReplacementNamed(context, '/returns');
            },
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text('Inicio'),
            onTap: () {
              Navigator.pushReplacementNamed(context, '/home');
            },
          ),
          ListTile(
            leading: Icon(Icons.logout),
            title: Text('Cerrar Sesión'),
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
