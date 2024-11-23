import 'package:flutter/material.dart';

class DrawerItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final String routeName;
  final VoidCallback? onTap;

  DrawerItem({
    required this.icon,
    required this.title,
    required this.routeName,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon, color: Theme.of(context).primaryColor),
      title: Text(title),
      onTap: () {
        if (onTap != null) {
          onTap!();
        } else {
          Navigator.pushReplacementNamed(context, routeName);
        }
      },
    );
  }
}
