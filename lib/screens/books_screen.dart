import 'package:flutter/material.dart';
import 'package:myuni/data/books_data.dart';
import 'package:myuni/widgets/book_card.dart';
import 'package:myuni/widgets/category_chip.dart';
import 'package:myuni/widgets/custom_drawer.dart';
import 'package:myuni/utils/AppColors.dart';

class BooksScreen extends StatefulWidget {
  const BooksScreen({Key? key});

  @override
  _BooksScreenState createState() => _BooksScreenState();
}

class _BooksScreenState extends State<BooksScreen> {

  String selectedCategory = 'Todos';
  String searchQuery = '';

  @override
  Widget build(BuildContext context) {
    final filteredBooks = books.where((book) {
      final matchesCategory = selectedCategory == 'Todos' || book['category'] == selectedCategory;
      final matchesSearch = book['title']!.toLowerCase().contains(searchQuery.toLowerCase()) ||
                            book['author']!.toLowerCase().contains(searchQuery.toLowerCase());
      return matchesCategory && matchesSearch;
    }).toList();
    return Scaffold(
      appBar: AppBar(
        title: const Row(
          children: [
            Icon(
              Icons.book,
              size: 28,
            ),
            SizedBox(
              width: 5,
            ),
            Text(
              'Libros',
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
      body: Padding(
        padding: const EdgeInsets.all(16.0),
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
                hintText: 'Buscar libro...',
                prefixIcon: const Icon(Icons.search),
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
                  Center(
                    child: CategoryChip(
                      label: 'Todos',
                      isSelected: selectedCategory == 'Todos',
                      onTap: () => setState(() => selectedCategory = 'Todos'),
                    ),
                  ),
                  Center(
                    child: CategoryChip(
                      label: 'Ficción',
                      isSelected: selectedCategory == 'Ficción',
                      onTap: () => setState(() => selectedCategory = 'Ficción'),
                    ),
                  ),
                  Center(
                    child: CategoryChip(
                      label: 'Ciencia',
                      isSelected: selectedCategory == 'Ciencia',
                      onTap: () => setState(() => selectedCategory = 'Ciencia'),
                    ),
                  ),
                  Center(
                    child: CategoryChip(
                      label: 'Fantasía',
                      isSelected: selectedCategory == 'Fantasía',
                      onTap: () =>
                          setState(() => selectedCategory = 'Fantasía'),
                    ),
                  ),
                  Center(
                    child: CategoryChip(
                      label: 'Clásicos',
                      isSelected: selectedCategory == 'Clásicos',
                      onTap: () =>
                          setState(() => selectedCategory = 'Clásicos'),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Libros populares',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: filteredBooks.isNotEmpty
                  ? ListView(
                      children: filteredBooks.map((book) {
                        return BookCard(
                          title: book['title']!,
                          author: book['author']!,
                          category: book['category']!,
                          description: book['description']!,
                          image: book['image']!,
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
          ],
        ),
      ),
    );
  }
}
