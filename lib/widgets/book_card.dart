import 'package:flutter/material.dart';

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
