import 'package:flutter/material.dart';


void main() {
  runApp(BibliotecaApp());
}

class BibliotecaApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Biblioteca Universitaria',
      theme: ThemeData(primarySwatch: Colors.purple),
      home: HomeScreen(),
    );
  }
}

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
        title: Text('Biblioteca'),
        centerTitle: true,
        elevation: 4.0,
        backgroundColor: Colors.purple.shade700,
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.teal,
              ),
              child: Text(
                'Menú de Opciones',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.book),
              title: Text('Catálogo de Libros'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.history),
              title: Text('Historial de Préstamos'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Configuración'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.logout),
              title: Text('Cerrar Sesión'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
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
              SizedBox(height: 8),
              Text(
                'Consulta tus estadísticas y los libros prestados',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.grey[700],
                ),
              ),
              SizedBox(height: 20),
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
                      Text(
                        'Total de libros prestados esta semana:',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 18),
                      ),
                      SizedBox(height: 8),
                      Text(
                        '$totalPrestamos',
                        style: TextStyle(
                          fontSize: 36,
                          fontWeight: FontWeight.bold,
                          color: Colors.teal,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20),
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
              SizedBox(height: 16),
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
                              style: TextStyle(fontSize: 14),
                            ),
                            SizedBox(height: 4),
                            Container(
                              width: 24,
                              height: alturaBarra,
                              decoration: BoxDecoration(
                                color: Colors.purple.shade700,
                                borderRadius: BorderRadius.circular(4),
                              ),
                            ),
                            SizedBox(height: 4),
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
                    SizedBox(height: 16),
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




