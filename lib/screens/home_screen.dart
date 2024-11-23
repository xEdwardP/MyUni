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
        title: const Text('Menu Principal'),
        centerTitle: true,
        elevation: 4.0,
        backgroundColor: AppColors.secondary,
      ),
      drawer: CustomDrawer(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Bienvenida
              Text(
                '¡Bienvenido a la Biblioteca!',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.purple.shade800,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'Consulta tus estadísticas y los libros prestados',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.grey[700],
                ),
              ),
              const SizedBox(height: 20),
              // Resumen numérico
              Card(
                elevation: 3,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                color: Colors.purple.shade100,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      const Text(
                        'Total de libros prestados esta semana:',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 18),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        '$totalPrestamos',
                        style: const TextStyle(
                          fontSize: 36,
                          fontWeight: FontWeight.bold,
                          color: Colors.teal,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),
              // Gráfico de barras
              Text(
                'Préstamos por día:',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.purple.shade800,
                ),
              ),
              const SizedBox(height: 16),
              Container(
                padding: const EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color: Colors.purple.shade50,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: prestamosPorDia.entries.map((entry) {
                        final String dia = entry.key;
                        final int prestamos = entry.value;
                        final double alturaBarra = prestamos.toDouble() * 4;
                        return Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              '$prestamos',
                              style: const TextStyle(fontSize: 14),
                            ),
                            const SizedBox(height: 4),
                            Container(
                              width: 24,
                              height: alturaBarra,
                              decoration: BoxDecoration(
                                color: Colors.purple.shade700,
                                borderRadius: BorderRadius.circular(4),
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              dia.substring(0, 3),
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.teal.shade800,
                              ),
                            ),
                          ],
                        );
                      }).toList(),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      'Distribución de préstamos por día',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey.shade700,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
