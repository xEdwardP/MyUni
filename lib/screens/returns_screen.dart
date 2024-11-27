import 'package:flutter/material.dart';
import 'package:myuni/widgets/custom_drawer.dart';
import 'package:myuni/utils/AppColors.dart';

class ReturnsScreen extends StatefulWidget {
  @override
  _ReturnsScreenState createState() => _ReturnsScreenState();
}

class _ReturnsScreenState extends State<ReturnsScreen> {
  final _formKey = GlobalKey<FormState>();
  final _bookIdController = TextEditingController();
  final _bookNameController = TextEditingController();
  final _studentIdController = TextEditingController();
  final _studentNameController = TextEditingController();

  String? _dueDate; // Almacena la fecha seleccionada
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
    if (_formKey.currentState!.validate() && _dueDate != null) {
      final returnDate = DateTime.now().toString().split(' ')[0];
      final fine = _calculateFine(_dueDate!, returnDate);

      setState(() {
        _returnsList.add({
          'bookId': _bookIdController.text,
          'bookName': _bookNameController.text,
          'studentId': _studentIdController.text,
          'studentName': _studentNameController.text,
          'returnDate': returnDate,
          'dueDate': _dueDate,
          'condition': _bookCondition,
          'fine': fine,
        });

        _bookIdController.clear();
        _bookNameController.clear();
        _studentIdController.clear();
        _studentNameController.clear();
        _dueDate = null;
        _bookCondition = "Buenas Condiciones";
      });
    } else if (_dueDate == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Por favor, selecciona la fecha límite')),
      );
    }
  }

  Future<void> _selectDueDate() async {
    final pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );
    if (pickedDate != null) {
      setState(() {
        _dueDate =
            pickedDate.toIso8601String().split('T')[0]; // Formato YYYY-MM-DD
      });
    }
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
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: TextFormField(
                                controller: _bookIdController,
                                decoration: InputDecoration(
                                  labelText: 'ID del Libro',
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                ),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Por favor, ingresa el ID del Libro';
                                  }
                                  return null;
                                },
                              ),
                            ),
                            const SizedBox(width: 10),
                            Expanded(
                              child: TextFormField(
                                controller: _bookNameController,
                                decoration: InputDecoration(
                                  labelText: 'Nombre del Libro',
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                ),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Por favor, ingresa el Nombre del Libro';
                                  }
                                  return null;
                                },
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        Row(
                          children: [
                            Expanded(
                              child: TextFormField(
                                controller: _studentIdController,
                                decoration: InputDecoration(
                                  labelText: 'Número de Cuenta',
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                ),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Por favor, ingresa el Número de Cuenta';
                                  }
                                  return null;
                                },
                              ),
                            ),
                            const SizedBox(width: 10),
                            Expanded(
                              child: TextFormField(
                                controller: _studentNameController,
                                decoration: InputDecoration(
                                  labelText: 'Nombre del Estudiante',
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                ),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Por favor, ingresa el Nombre del Estudiante';
                                  }
                                  return null;
                                },
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        Row(
                          children: [
                            Expanded(
                              child: GestureDetector(
                                onTap: _selectDueDate,
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 14, horizontal: 10),
                                  decoration: BoxDecoration(
                                    border: Border.all(color: Colors.grey),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        _dueDate ?? 'Fecha Límite',
                                        style: TextStyle(
                                          color: _dueDate == null
                                              ? Colors.grey
                                              : Colors.black,
                                        ),
                                      ),
                                      Icon(Icons.calendar_today,
                                          color: AppColors.primary),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(width: 10),
                            Expanded(
                              child: DropdownButtonFormField<String>(
                                value: _bookCondition,
                                onChanged: (value) {
                                  setState(() {
                                    _bookCondition = value!;
                                  });
                                },
                                isExpanded: true,
                                items: [
                                  'Buenas Condiciones',
                                  'Condiciones Reparables',
                                  'Condiciones Irreparables'
                                ]
                                    .map((condition) => DropdownMenuItem(
                                          value: condition,
                                          child: Text(
                                            condition,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ))
                                    .toList(),
                                decoration: InputDecoration(
                                  labelText: 'Estado del Libro',
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                ),
                              ),
                            ),
                          ],
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
              ),
              const SizedBox(height: 20),
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
                    elevation: 4,
                    margin: const EdgeInsets.symmetric(vertical: 5),
                    child: ListTile(
                      title: Text(returnItem['bookName']),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                              'Estudiante: ${returnItem['studentName']} (ID: ${returnItem['studentId']})\n'
                              'Fecha Límite: ${returnItem['dueDate']}, Devuelto: ${returnItem['returnDate']}'),
                          Text('Multa: L.${returnItem['fine']}'),
                          Text(
                            'Estado: ${returnItem['condition']}',
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
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
}
