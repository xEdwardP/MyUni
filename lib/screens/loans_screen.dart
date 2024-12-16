import 'package:flutter/material.dart';
import 'package:myuni/widgets/custom_drawer.dart';
import 'package:myuni/utils/AppColors.dart';
import 'package:myuni/data/books_data.dart'; // Importamos el archivo books_data

class LoansScreen extends StatefulWidget {
  @override
  _LoansScreenState createState() => _LoansScreenState();
}

class _LoansScreenState extends State<LoansScreen> {
  final List<Map<String, String>> loanedBooks = [];
  final TextEditingController bookTitleController = TextEditingController();
  int returnedBooksCount = 0;

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
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Encabezado
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
            // Estadísticas
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
            // Campo de búsqueda con autocompletado
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Autocomplete<String>(
                    optionsBuilder: (TextEditingValue textEditingValue) {
                      if (textEditingValue.text.isEmpty) {
                        return const Iterable<String>.empty();
                      }
                      return books
                          .where((book) => book['title']!
                              .toLowerCase()
                              .contains(textEditingValue.text.toLowerCase()))
                          .map((book) => book['title']!);
                    },
                    onSelected: (String selection) {
                      bookTitleController.text = selection;
                      _showLoanDialog(context, selection);
                    },
                    fieldViewBuilder:
                        (context, controller, focusNode, onFieldSubmitted) {
                      return TextField(
                        controller: controller,
                        focusNode: focusNode,
                        decoration: InputDecoration(
                          labelText: 'Título del libro',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          prefixIcon:
                              Icon(Icons.book, color: AppColors.primary),
                        ),
                        onSubmitted: (bookTitle) {
                          if (bookTitle.isEmpty) return;
                          if (books.any((book) => book['title'] == bookTitle)) {
                            _showLoanDialog(context, bookTitle);
                            controller.clear();
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                    'El libro "$bookTitle" no está disponible.'),
                                backgroundColor: Colors.red,
                              ),
                            );
                          }
                        },
                      );
                    },
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Presiona Enter después de ingresar el título para hacer un préstamo.',
                    style: TextStyle(fontSize: 14, color: Colors.grey),
                  ),
                ],
              ),
            ),
            SizedBox(height: 16),
            Divider(),
            // Lista de préstamos activos
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
            if (loanedBooks.isNotEmpty)
              ListView.builder(
                itemCount: loanedBooks.length,
                padding: const EdgeInsets.all(16.0),
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  final loan = loanedBooks[index];
                  return Card(
                    elevation: 4,
                    margin: EdgeInsets.only(bottom: 16.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: ListTile(
                      leading:
                          Icon(Icons.book_outlined, color: AppColors.primary),
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
              ),
            if (loanedBooks.isEmpty)
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  'No hay préstamos activos.',
                  style: TextStyle(fontSize: 18, color: Colors.grey),
                ),
              ),
          ],
        ),
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
              final studentName = studentNameController.text;
              final accountNumber = accountNumberController.text;
              final loanDuration = loanDurationController.text;

              if (studentName.isEmpty ||
                  accountNumber.isEmpty ||
                  loanDuration.isEmpty) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Por favor, completa todos los campos'),
                  ),
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
                bookTitleController.clear();
              });

              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('Préstamo registrado para "$bookTitle".'),
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
      loanedBooks.removeAt(index);
      returnedBooksCount++;
    });
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Libro devuelto correctamente.')),
    );
  }
}
