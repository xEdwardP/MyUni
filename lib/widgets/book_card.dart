import 'package:flutter/material.dart';
import 'package:myuni/screens/book_detail_screen.dart';

class BookCard extends StatelessWidget {
  final String title;
  final String author;
  final String category;
  final String description;
  final String image;

  const BookCard({
    required this.title,
    required this.author,
    required this.category,
    required this.description,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      child: ListTile(
        leading: Image.network(image, fit: BoxFit.cover, width: 50, height: 50),
        title: Text(title),
        subtitle: Text(author),
        trailing: const Icon(Icons.arrow_forward),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => BookDetailScreen(
                title: title,
                author: author,
                category: category,
                description: description,
                image: image,
              ),
            ),
          );
        },
      ),
    );
  }
}
