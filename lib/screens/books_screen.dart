import 'package:flutter/material.dart';
import 'package:myuni/data/books_data.dart';
import 'package:myuni/screens/addbook_screen.dart';
import 'package:myuni/widgets/book_card.dart';
import 'package:myuni/widgets/category_chip.dart';
import 'package:myuni/utils/AppColors.dart';
import 'package:myuni/widgets/custom_drawer.dart';

class BooksScreen extends StatefulWidget {
  const BooksScreen({Key? key}) : super(key: key);

  @override
  _BooksScreenState createState() => _BooksScreenState();
}

class _BooksScreenState extends State<BooksScreen> {
  String selectedCategory = 'Todos';
  String searchQuery = '';
  int currentPage = 0;
  final int itemsPerPage = 5;

  @override
  Widget build(BuildContext context) {
    final filteredBooks = books.where((book) {
      final matchesCategory =
          selectedCategory == 'Todos' || book['category'] == selectedCategory;
      final matchesSearch =
          book['title']!.toLowerCase().contains(searchQuery.toLowerCase()) ||
              book['author']!.toLowerCase().contains(searchQuery.toLowerCase());
      return matchesCategory && matchesSearch;
    }).toList();

    final paginatedBooks = filteredBooks
        .skip(currentPage * itemsPerPage)
        .take(itemsPerPage)
        .toList();
    final totalPages = (filteredBooks.length / itemsPerPage).ceil();

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
        backgroundColor: AppColors.primary,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddBookScreen()),
          ).then((newBook) {
            if (newBook != null) {
              setState(() {
                books.add(newBook);
              });
            }
          });
        },
        child: const Icon(Icons.add),
        backgroundColor: AppColors.secondary,
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              onChanged: (value) {
                setState(() {
                  searchQuery = value;
                });
              },
              decoration: InputDecoration(
                hintText: 'Buscar libros...',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Categorías',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            SizedBox(
              height: 50,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  CategoryChip(
                    label: 'Todos',
                    isSelected: selectedCategory == 'Todos',
                    onTap: () => setState(() => selectedCategory = 'Todos'),
                  ),
                  CategoryChip(
                    label: 'Ficción',
                    isSelected: selectedCategory == 'Ficción',
                    onTap: () => setState(() => selectedCategory = 'Ficción'),
                  ),
                  CategoryChip(
                    label: 'Ciencia',
                    isSelected: selectedCategory == 'Ciencia',
                    onTap: () => setState(() => selectedCategory = 'Ciencia'),
                  ),
                  CategoryChip(
                    label: 'Fantasía',
                    isSelected: selectedCategory == 'Fantasía',
                    onTap: () => setState(() => selectedCategory = 'Fantasía'),
                  ),
                  CategoryChip(
                    label: 'Clásicos',
                    isSelected: selectedCategory == 'Clásicos',
                    onTap: () => setState(() => selectedCategory = 'Clásicos'),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: paginatedBooks.isNotEmpty
                  ? ListView(
                      children: paginatedBooks.map((book) {
                        return BookCard(
                          title: book['title']!,
                          author: book['author']!,
                          category: book['category']!,
                          description: book['description']!,
                          image: book['image']!,
                          available: book['available']!,
                        );
                      }).toList(),
                    )
                  : const Center(
                      child: Text(
                        'No hay libros disponibles en esta categoría.',
                        style: TextStyle(fontSize: 16, color: Colors.grey),
                      ),
                    ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  onPressed: currentPage > 0
                      ? () {
                          setState(() {
                            currentPage--;
                          });
                        }
                      : null,
                  icon: Icon(Icons.arrow_back,
                      color: currentPage > 0 ? Colors.blue : Colors.grey),
                ),
                Text('Página ${currentPage + 1} de $totalPages'),
                IconButton(
                  onPressed: currentPage < totalPages - 1
                      ? () {
                          setState(() {
                            currentPage++;
                          });
                        }
                      : null,
                  icon: Icon(Icons.arrow_forward,
                      color: currentPage < totalPages - 1
                          ? Colors.blue
                          : Colors.grey),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class AddBookScreen extends StatelessWidget {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController authorController = TextEditingController();
  final TextEditingController categoryController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController imageUrlController = TextEditingController();
  final TextEditingController availableController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Agregar Nuevo Libro'),
        backgroundColor: AppColors.secondary,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: titleController,
              decoration: const InputDecoration(labelText: 'Título'),
            ),
            TextField(
              controller: authorController,
              decoration: const InputDecoration(labelText: 'Autor'),
            ),
            TextField(
              controller: categoryController,
              decoration: const InputDecoration(labelText: 'Categoría'),
            ),
            TextField(
              controller: descriptionController,
              decoration: const InputDecoration(labelText: 'Descripción'),
            ),
            TextField(
              controller: imageUrlController,
              decoration: const InputDecoration(labelText: 'URL de la Imagen'),
            ),
            TextField(
              controller: availableController,
              decoration: const InputDecoration(labelText: 'Disponibles'),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                final newBook = {
                  'title': titleController.text,
                  'author': authorController.text,
                  'category': categoryController.text,
                  'description': descriptionController.text,
                  'image': imageUrlController.text,
                  'available': int.tryParse(availableController.text) ?? 0,
                };
                Navigator.pop(context, newBook);
              },
              child: const Text('Agregar Libro'),
            ),
          ],
        ),
      ),
    );
  }
}

class CategoryChip extends StatelessWidget {
  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  const CategoryChip({
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        margin: const EdgeInsets.only(right: 8),
        decoration: BoxDecoration(
          color: isSelected ? Colors.blueAccent : Colors.blue[100],
          borderRadius: BorderRadius.circular(20),
        ),
        child: Text(
          label,
          style: TextStyle(
              color: isSelected ? Colors.white : Colors.black,
              fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}

class BookCard extends StatelessWidget {
  final String title;
  final String author;
  final String category;
  final String description;
  final String image;
  final int available;

  const BookCard({
    required this.title,
    required this.author,
    required this.category,
    required this.description,
    required this.image,
    required this.available,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 20),
      child: Row(
        children: [
          Image.network(image, height: 100, width: 70, fit: BoxFit.cover),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.bold),
                ),
                Text(author, style: const TextStyle(color: Colors.grey)),
                Text(
                  category,
                  style: const TextStyle(color: Colors.blueAccent),
                ),
                Text('Disponibles: $available'),
                const SizedBox(height: 5),
                Text(
                  description,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

