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
        title: const Row(
          children: [
            Icon(
              Icons.home,
              size: 28,
            ),
            SizedBox(
              width: 5,
            ),
            Text(
              'Menu Principal',
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
              'Observa una Breve estadística de los Libros de biblioteca',
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
                crossAxisSpacing: 6,
                mainAxisSpacing: 39,
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
      // Barra amarilla en la parte inferior
      bottomNavigationBar: Container(
        height: 50,
        color: AppColors.secondary, // Color barra inferior
        child: Center(
          child: Text(
            '¡Gracias por usar la Biblioteca Virtual UNICAH!',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.black, // Contraste de texto
            ),
          ),
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
                  size: 25,
                  color: color,
                ),
                const SizedBox(width: 6),
                Text(
                  value,
                  style: TextStyle(
                    fontSize: 27,
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
                fontSize: 15,
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
