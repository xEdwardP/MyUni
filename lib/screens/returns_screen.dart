import 'package:flutter/material.dart';
import 'package:myuni/widgets/custom_drawer.dart';
import 'package:myuni/utils/AppColors.dart';

class ReturnsScreen extends StatefulWidget {
  @override
  _ReturnsScreenState createState() => _ReturnsScreenState();
}

class _ReturnsScreenState extends State<ReturnsScreen> {
  final _bookIdController = TextEditingController();
  final _studentIdController = TextEditingController();
  final List<Map<String, String>> _returnsList = [
    {'bookId': '12345', 'studentId': '001', 'returnDate': '2024-11-20'},
    {'bookId': '67890', 'studentId': '002', 'returnDate': '2024-11-21'},
  ];

  void _addReturn() {
    setState(() {
      _returnsList.add({
        'bookId': _bookIdController.text,
        'studentId': _studentIdController.text,
        'returnDate': DateTime.now().toString().split(' ')[0],
      });
      _bookIdController.clear();
      _studentIdController.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Gestión de Devoluciones'),
        backgroundColor: AppColors.primary,
      ),
      drawer: CustomDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Registrar Devolución',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            TextField(
              controller: _bookIdController,
              decoration: InputDecoration(labelText: 'ID del Libro'),
            ),
            TextField(
              controller: _studentIdController,
              decoration: InputDecoration(labelText: 'ID del Estudiante'),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: _addReturn,
              child: Text('Registrar'),
              style: ElevatedButton.styleFrom(
              ),
            ),
            Divider(height: 20, thickness: 2),
            Text(
              'Historial de Devoluciones',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: _returnsList.length,
                itemBuilder: (context, index) {
                  final returnItem = _returnsList[index];
                  return ListTile(
                    title: Text('Libro: ${returnItem['bookId']}'),
                    subtitle: Text(
                        'Estudiante: ${returnItem['studentId']}\nFecha: ${returnItem['returnDate']}'),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _bookIdController.dispose();
    _studentIdController.dispose();
    super.dispose();
  }
}
