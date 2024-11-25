import 'package:flutter/material.dart';
import 'package:myuni/utils/AppColors.dart';

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
