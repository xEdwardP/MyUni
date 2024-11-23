import 'package:flutter/material.dart';
import 'package:myuni/utils/AppColors.dart';
import 'package:myuni/widgets/custom_drawer.dart';

class HomeScreen extends StatelessWidget {
  final Map<String, int> prestamosPorDia = {
    'Lunes': 15,
    'Martes': 12,
    'Miércoles': 18,
    'Jueves': 10,
    'Viernes': 22,
  };

  int calcularTotalPrestamos() {
    return prestamosPorDia.values.reduce((a, b) => a + b);
  }

  @override
  Widget build(BuildContext context) {
    int totalPrestamos = calcularTotalPrestamos();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Menú Principal'),
        centerTitle: true,
        elevation: 4.0,
        backgroundColor: AppColors.secondary,
      ),
      drawer: CustomDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              'assets/logo.png', 
              height: 200, // Ajusta el tamaño de la imagen
            ),
            // Bienvenida
            Text(
              '¡Bienvenido a la Biblioteca Virtual UNICAH!',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.purple.shade800,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Mira las estadísticas de los Libros de biblioteca',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey[700],
              ),
            ),
            const SizedBox(height: 16),
            // Cards compactas
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 1,
                mainAxisSpacing: 1,
                childAspectRatio: 1.5, // Relación ancho/alto de las tarjetas
                physics: const BouncingScrollPhysics(),
                children: [
                  buildCompactCard(
                    icon: Icons.book,
                    value: '$totalPrestamos',
                    title: 'Libros Prestados',
                    color: Colors.teal,
                  ),
                  buildCompactCard(
                    icon: Icons.people,
                    value: '120',
                    title: 'Usuarios Activos',
                    color: Colors.orange,
                  ),
                  buildCompactCard(
                    icon: Icons.menu_book,
                    value: '2500',
                    title: 'Libros Disponibles',
                    color: Colors.blue,
                  ),
                  buildCompactCard(
                    icon: Icons.timer,
                    value: '10',
                    title: 'Préstamos Vencidos',
                    color: Colors.red,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildCompactCard({
    required IconData icon,
    required String value,
    required String title,
    required Color color,
  }) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  icon,
                  size: 70, // Ícono más pequeño
                  color: color,
                ),
                const SizedBox(width: 4),
                Text(
                  value,
                  style: TextStyle(
                    fontSize: 30, // Tamaño de texto reducido
                    fontWeight: FontWeight.bold,
                    color: color,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 4),
            Text(
              title,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20, // Texto más pequeño
                fontWeight: FontWeight.w500,
                color: Colors.grey[700],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
