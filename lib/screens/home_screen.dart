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
    // Obtener el tamaño de la pantalla
    double screenWidth = MediaQuery.of(context).size.width;

    // Definir cantidad de columnas en GridView
    int crossAxisCount = screenWidth < 600
        ? 2
        : screenWidth < 900
            ? 3
            : 4;

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
              height: 200,
            ),
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
            Expanded(
              child: GridView.builder(
                physics: const BouncingScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: crossAxisCount, // Número de columnas dinámico
                  crossAxisSpacing: 8,
                  mainAxisSpacing: 8,
                  childAspectRatio: 1.3,
                ),
                itemCount: 4,
                itemBuilder: (context, index) {
                  List<Map<String, dynamic>> items = [
                    {
                      'icon': Icons.book,
                      'value': '$totalPrestamos',
                      'title': 'Libros Prestados',
                      'color': Colors.teal,
                    },
                    {
                      'icon': Icons.people,
                      'value': '120',
                      'title': 'Usuarios Activos',
                      'color': Colors.orange,
                    },
                    {
                      'icon': Icons.menu_book,
                      'value': '2500',
                      'title': 'Libros Disponibles',
                      'color': Colors.blue,
                    },
                    {
                      'icon': Icons.timer,
                      'value': '10',
                      'title': 'Préstamos Vencidos',
                      'color': Colors.red,
                    },
                  ];
                  return buildCompactCard(
                    icon: items[index]['icon'],
                    value: items[index]['value'],
                    title: items[index]['title'],
                    color: items[index]['color'],
                  );
                },
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        height: 50,
        color: AppColors.secondary,
        child: Center(
          child: Text(
            '¡Gracias por usar la Biblioteca Virtual UNICAH!',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.black,
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
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
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
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: color,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Text(
              title,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 14,
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
