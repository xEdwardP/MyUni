import 'package:flutter/material.dart';
import 'package:myuni/utils/AppColors.dart';

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
      // leading: Icon(icon, color: Theme.of(context).primaryColor),
      leading: Icon(icon, color: AppColors.primary),
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
