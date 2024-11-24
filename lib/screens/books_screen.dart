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
        child: Icon(Icons.add),
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
