import 'package:flutter/material.dart';
import 'package:myuni/models/book_model.dart';
import 'package:myuni/services/book_service.dart';

// class BookProvider with ChangeNotifier {
//   List<Book> _books = [];

//   List<Book> get books => _books;

//   Future<void> fetchBooks() async {
//     _books = await BookService.fetchBooks();
//     notifyListeners();
//   }

//   void toggleAvailability(String id) {
//     int index = _books.indexWhere((book) => book.id == id);
//     if (index != -1) {
//       _books[index].isAvailable = !_books[index].isAvailable;
//       notifyListeners();
//     }
//   }
// }
