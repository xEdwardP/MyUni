import 'package:flutter/material.dart';
import 'package:myuni/widgets/custom_drawer.dart';
import 'package:myuni/utils/AppColors.dart';

class ReturnsScreen extends StatefulWidget {
  @override
  _ReturnsScreenState createState() => _ReturnsScreenState();
}

class _ReturnsScreenState extends State<ReturnsScreen> {
  final _bookIdController = TextEditingController();
  final _bookNameController = TextEditingController();
  final _studentIdController = TextEditingController();
  final _studentNameController = TextEditingController();
  final _dueDateController = TextEditingController();

  String _bookCondition = "Buenas Condiciones"; // Estado inicial del libro
  final double _finePerDay = 10.0; // Multa por día de retraso en lempiras

  final List<Map<String, dynamic>> _returnsList = [
    {
      'bookId': '12345',
      'bookName': 'El Principito',
      'studentId': '001',
      'studentName': 'Carlos Martínez',
      'returnDate': '2024-11-20',
      'dueDate': '2024-11-19',
      'condition': 'Buenas Condiciones',
      'fine': 0.0,
    },
    {
      'bookId': '67890',
      'bookName': 'Cien Años de Soledad',
      'studentId': '002',
      'studentName': 'María López',
      'returnDate': '2024-11-21',
      'dueDate': '2024-11-20',
      'condition': 'Condiciones Reparables',
      'fine': 10.0,
    },
  ];

  double _calculateFine(String dueDate, String returnDate) {
    final due = DateTime.parse(dueDate);
    final returned = DateTime.parse(returnDate);

    if (returned.isAfter(due)) {
      final daysLate = returned.difference(due).inDays;
      return daysLate * _finePerDay;
    }
    return 0.0;
  }

  void _addReturn() {
    final returnDate = DateTime.now().toString().split(' ')[0];
    final fine = _calculateFine(_dueDateController.text, returnDate);

    setState(() {
      _returnsList.add({
        'bookId': _bookIdController.text,
        'bookName': _bookNameController.text,
        'studentId': _studentIdController.text,
        'studentName': _studentNameController.text,
        'returnDate': returnDate,
        'dueDate': _dueDateController.text,
        'condition': _bookCondition,
        'fine': fine,
      });

      _bookIdController.clear();
      _bookNameController.clear();
      _studentIdController.clear();
      _studentNameController.clear();
      _dueDateController.clear();
      _bookCondition = "Buenas Condiciones";
    });
  }

  void _showReturnDetails(Map<String, dynamic> returnItem) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Detalles de la Devolución'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Libro: ${returnItem['bookName']} (ID: ${returnItem['bookId']})'),
              Text('Estudiante: ${returnItem['studentName']} (ID: ${returnItem['studentId']})'),
              Text('Fecha de Devolución: ${returnItem['returnDate']}'),
              Text('Fecha Límite: ${returnItem['dueDate']}'),
              Text('Estado del Libro: ${returnItem['condition']}'),
              Text('Multa: L ${returnItem['fine'].toStringAsFixed(2)}'),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Cerrar'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Row(
          children: [
            Icon(
              Icons.assignment_return,
              size: 28,
            ),
            SizedBox(
              width: 5,
            ),
            Text(
              'Devoluciones',
              style: TextStyle(fontSize: 25),
            ),
          ],
        ),
        centerTitle: true,
        backgroundColor: AppColors.secondary,
      ),
      drawer: CustomDrawer(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Registrar Devolución',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: AppColors.primary,
                ),
              ),
              const SizedBox(height: 10),
              Card(
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      TextField(
                        controller: _bookIdController,
                        decoration: InputDecoration(
                          labelText: 'ID del Libro',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      TextField(
                        controller: _bookNameController,
                        decoration: InputDecoration(
                          labelText: 'Nombre del Libro',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      TextField(
                        controller: _studentIdController,
                        decoration: InputDecoration(
                          labelText: 'Número de Cuenta del Estudiante',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      TextField(
                        controller: _studentNameController,
                        decoration: InputDecoration(
                          labelText: 'Nombre del Estudiante',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      TextField(
                        controller: _dueDateController,
                        decoration: InputDecoration(
                          labelText: 'Fecha Límite (Y-M-D)',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      DropdownButtonFormField<String>(
                        value: _bookCondition,
                        onChanged: (value) {
                          setState(() {
                            _bookCondition = value!;
                          });
                        },
                        items: ['Buenas Condiciones', 'Condiciones Reparables', 'Condiciones Irreparables']
                            .map((condition) => DropdownMenuItem(
                                  value: condition,
                                  child: Text(condition),
                                ))
                            .toList(),
                        decoration: InputDecoration(
                          labelText: 'Estado del Libro',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      ElevatedButton.icon(
                        onPressed: _addReturn,
                        icon: const Icon(Icons.check_circle_outline),
                        label: const Text('Registrar'),
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(
                              vertical: 14, horizontal: 24),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          backgroundColor: AppColors.secondary,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),
              const Divider(height: 20, thickness: 2),
              const Text(
                'Historial de Devoluciones',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: AppColors.primary,
                ),
              ),
              const SizedBox(height: 10),
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: _returnsList.length,
                itemBuilder: (context, index) {
                  final returnItem = _returnsList[index];
                  return Card(
                    elevation: 3,
                    margin: const EdgeInsets.symmetric(vertical: 8),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: ListTile(
                      leading: const Icon(Icons.book, color: AppColors.primary),
                      title: Text('Libro: ${returnItem['bookName']}'),
                      subtitle: Text(
                          'Estudiante: ${returnItem['studentName']}\nMulta: L ${returnItem['fine'].toStringAsFixed(2)}'),
                      onTap: () => _showReturnDetails(returnItem),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _bookIdController.dispose();
    _bookNameController.dispose();
    _studentIdController.dispose();
    _studentNameController.dispose();
    _dueDateController.dispose();
    super.dispose();
  }
}
