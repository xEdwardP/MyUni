import 'package:flutter/material.dart';
import 'package:myuni/widgets/custom_drawer.dart';
import 'package:myuni/utils/AppColors.dart';

class LoansScreen extends StatefulWidget {
  @override
  _LoansScreenState createState() => _LoansScreenState();
}

class _LoansScreenState extends State<LoansScreen> {
  // Lista de libros prestados
  final List<Map<String, String>> loanedBooks = [];

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
        children: [
          // Título "Préstamos UNICAH".
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Préstamos UNICAH',
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
                color: AppColors.primary,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          // Campo para registrar un nuevo préstamo.
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: TextField(
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
          // Subtítulo para la lista de préstamos.
          if (loanedBooks.isNotEmpty)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Préstamos Activos',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black54,
                  ),
                ),
              ),
            ),
          // Historial de préstamos activos.
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
                              'Prestatario: ${loan['borrower']}\nDías: ${loan['days']}'),
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
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.sentiment_dissatisfied,
                            size: 48, color: Colors.grey),
                        SizedBox(height: 8),
                        Text(
                          'No hay préstamos activos.',
                          style: TextStyle(fontSize: 18, color: Colors.grey),
                        ),
                      ],
                    ),
                  ),
          ),
        ],
      ),
    );
  }

  // Diálogo para registrar un nuevo préstamo.
  void _showLoanDialog(BuildContext context, String bookTitle) {
    final TextEditingController borrowerController = TextEditingController();
    final TextEditingController loanDurationController =
        TextEditingController();

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
              controller: borrowerController,
              decoration: InputDecoration(
                labelText: 'Nombre del prestatario',
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
            onPressed: () => Navigator.of(context).pop(), // Cierra el diálogo.
            child: Text('Cancelar'),
          ),
          ElevatedButton(
            onPressed: () {
              final borrower = borrowerController.text;
              final loanDuration = loanDurationController.text;

              if (borrower.isEmpty || loanDuration.isEmpty) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                      content: Text('Por favor, completa todos los campos')),
                );
                return;
              }

              // Agrega el préstamo al historial de préstamos activos.
              setState(() {
                loanedBooks.add({
                  'bookTitle': bookTitle,
                  'borrower': borrower,
                  'days': loanDuration,
                });
              });

              // Muestra un mensaje de confirmación.
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                      'Préstamo confirmado: $bookTitle a $borrower por $loanDuration días.'),
                  backgroundColor: Colors.green,
                  duration: Duration(seconds: 3),
                ),
              );

              Navigator.of(context).pop(); // Cierra el diálogo.
            },
            child: Text('Registrar'),
          ),
        ],
      ),
    );
  }

  // Función para devolver un libro.
  void _returnBook(int index) {
    setState(() {
      final returnedBook = loanedBooks.removeAt(index);
      // Muestra un mensaje de confirmación de devolución.
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
              'Libro devuelto: ${returnedBook['bookTitle']} por ${returnedBook['borrower']}.'),
          backgroundColor: Colors.blue,
          duration: Duration(seconds: 3),
        ),
      );
    });
  }
}
