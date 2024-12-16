import 'package:flutter/material.dart';
import 'package:myuni/utils/AppColors.dart';
import 'package:myuni/utils/drawer_item.dart';
import 'package:provider/provider.dart';
import 'package:myuni/models/login_model.dart';

class CustomDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final loginModel = Provider.of<LoginModel>(context);

    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          // User Card
          UserAccountsDrawerHeader(
            decoration: const BoxDecoration(
              color: AppColors.secondary,
              image: DecorationImage(
                image: AssetImage('assets/background.jpg'), // Background
                fit: BoxFit.cover,
              ),
            ),
            accountName: const Text(
              'Dexter Morgan',
              style: TextStyle(fontSize: 18, color: Colors.white),
            ),
            accountEmail: Text(
              loginModel.email,
              style: const TextStyle(color: Colors.white70),
            ),
            currentAccountPicture: CircleAvatar(
              radius: 40,
              backgroundColor: Colors.white,
              backgroundImage: const AssetImage('assets/user.png'), // Userphoto
              child: loginModel.email.isEmpty
                  ? const Icon(
                      Icons.person,
                      size: 50,
                      color: AppColors.secondary,
                    )
                  : null,
            ),
          ),
          DrawerItem(
            icon: Icons.home,
            title: 'Inicio',
            routeName: '/home',
          ),
          DrawerItem(
            icon: Icons.book,
            title: 'Libros',
            routeName: '/books',
          ),
          DrawerItem(
            icon: Icons.bookmark,
            title: 'Gestión de Préstamos',
            routeName: '/loans',
          ),
          DrawerItem(
            icon: Icons.assignment_return,
            title: 'Gestión de Devoluciones',
            routeName: '/returns',
          ),
          DrawerItem(
            icon: Icons.list,
            title: 'Asistencias',
            routeName: '/attendances',
          ),
          const Divider(),
          DrawerItem(
            icon: Icons.logout,
            title: 'Cerrar Sesión',
            routeName: '/login',
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
