import 'package:flutter/material.dart';
import 'package:myuni/widgets/custom_drawer.dart';
import 'package:myuni/utils/AppColors.dart';

class LoansScreen extends StatefulWidget {
  @override
  _LoansScreenState createState() => _LoansScreenState();
}

class _LoansScreenState extends State<LoansScreen> {
  final List<Map<String, String>> loanedBooks = [];
  int returnedBooksCount = 0; // Contador de libros devueltos.
  final TextEditingController bookTitleController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Row(
          children: [
            Icon(
              Icons.bookmark,
              size: 28,
            ),
            SizedBox(
              width: 5,
            ),
            Text(
              'Prestamos',
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
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Préstamos UNICAH',
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
                color: AppColors.primary,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              children: [
                _buildStatCard(
                  'Préstamos Activos',
                  loanedBooks.length.toString(),
                  Icons.book,
                  AppColors.primary,
                ),
                SizedBox(width: 16),
                _buildStatCard(
                  'Libros Devueltos',
                  returnedBooksCount.toString(),
                  Icons.done_all,
                  Colors.green,
                ),
              ],
            ),
          ),
          SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: TextField(
              controller: bookTitleController,
              decoration: InputDecoration(
                labelText: 'Título del libro',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                prefixIcon: Icon(Icons.book, color: AppColors.primary),
              ),
              onSubmitted: (bookTitle) {
                if (bookTitle.isNotEmpty) {
                  _showLoanDialog(context, bookTitle);
                }
              },
            ),
          ),
          SizedBox(height: 16),
          Divider(),
          if (loanedBooks.isNotEmpty)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                'Préstamos Activos',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black54,
                ),
              ),
            ),
          Expanded(
            child: loanedBooks.isNotEmpty
                ? ListView.builder(
                    itemCount: loanedBooks.length,
                    padding: const EdgeInsets.all(16.0),
                    itemBuilder: (context, index) {
                      final loan = loanedBooks[index];
                      return Card(
                        elevation: 4,
                        margin: EdgeInsets.only(bottom: 16.0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: ListTile(
                          leading: Icon(Icons.book_outlined,
                              color: AppColors.primary),
                          title: Text(
                            loan['bookTitle']!,
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          subtitle: Text(
                              'Nombre: ${loan['studentName']}\nN° de Cuenta: ${loan['accountNumber']}\nDías: ${loan['days']}'),
                          trailing: IconButton(
                            icon: Icon(Icons.undo, color: Colors.red),
                            onPressed: () {
                              _returnBook(index);
                            },
                          ),
                        ),
                      );
                    },
                  )
                : Center(
                    child: Text(
                      'No hay préstamos activos.',
                      style: TextStyle(fontSize: 18, color: Colors.grey),
                      textAlign: TextAlign.center,
                    ),
                  ),
          ),
        ],
      ),
    );
  }

  Widget _buildStatCard(
      String title, String value, IconData icon, Color color) {
    return Expanded(
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, size: 40, color: color),
              SizedBox(height: 8),
              Text(
                value,
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              SizedBox(height: 4),
              Text(
                title,
                style: TextStyle(fontSize: 14, color: Colors.black54),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showLoanDialog(BuildContext context, String bookTitle) {
    final accountNumberController = TextEditingController();
    final studentNameController = TextEditingController();
    final loanDurationController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        title: Text(
          'Registrar Préstamo',
          style: TextStyle(color: AppColors.primary),
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Libro: $bookTitle',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            TextField(
              controller: studentNameController,
              decoration: InputDecoration(
                labelText: 'Nombre',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
            SizedBox(height: 16),
            TextField(
              controller: accountNumberController,
              decoration: InputDecoration(
                labelText: 'N° de Cuenta',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
            SizedBox(height: 16),
            TextField(
              controller: loanDurationController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Duración del préstamo (días)',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: Text('Cancelar'),
          ),
          ElevatedButton(
            onPressed: () {
              final accountNumber = accountNumberController.text;
              final studentName = studentNameController.text;
              final loanDuration = loanDurationController.text;

              if (accountNumber.isEmpty ||
                  studentName.isEmpty ||
                  loanDuration.isEmpty) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                      content: Text('Por favor, completa todos los campos')),
                );
                return;
              }

              setState(() {
                loanedBooks.add({
                  'bookTitle': bookTitle,
                  'studentName': studentName,
                  'accountNumber': accountNumber,
                  'days': loanDuration,
                });
                bookTitleController.clear(); // Limpia el campo del título.
              });

              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                      'Préstamo confirmado: $bookTitle al alumno ${studentName} con número de cuenta $accountNumber por $loanDuration días.'),
                  backgroundColor: Colors.green,
                  duration: Duration(seconds: 3),
                ),
              );

              Navigator.of(context).pop();
            },
            child: Text('Registrar'),
          ),
        ],
      ),
    );
  }

  void _returnBook(int index) {
    setState(() {
      final returnedBook = loanedBooks.removeAt(index);
      returnedBooksCount++; // Incrementa el contador de libros devueltos.
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
              'Devolución confirmada: ${returnedBook['bookTitle']} por el alumno ${returnedBook['studentName']} con número de cuenta ${returnedBook['accountNumber']}.'),
          backgroundColor: Colors.blue,
          duration: Duration(seconds: 3),
        ),
      );
    });
  }
}
