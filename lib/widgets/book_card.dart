import 'package:flutter/material.dart';

class BookCard extends StatelessWidget {
  final String title;
  final String author;
  final String category;
  final String description;
  final int stock;

  const BookCard({
    required this.title,
    required this.author,
    required this.category,
    required this.description,
    required this.stock,
  });

  void _showBookDetails(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        title: Text(title),
        content: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Autor: $author',
                  style: const TextStyle(fontWeight: FontWeight.bold)),
              const SizedBox(height: 5),
              Text('Categoría: $category',
                  style: const TextStyle(fontWeight: FontWeight.bold)),
              const SizedBox(height: 5),
              Text('Descripción: $description'),
              const SizedBox(height: 10),
              Text('Disponibles: ${stock - 2}'),
              Text('Libros prestados: ${2}'),
              Text('Total de libros: ${stock}'),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Cerrar'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 20),
      child: ListTile(
        leading: const Icon(Icons.book),
        title: Text(title),
        subtitle: Text('Género: $category\nAutor: $author'),
        onTap: () => _showBookDetails(context),
      ),
    );
  }
}
