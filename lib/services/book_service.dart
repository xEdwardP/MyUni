import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:myuni/models/book_model.dart';

class BookService {
  static Future<List<Book>> fetchBooks(int page, int itemsPerPage) async {
    final response = await http.get(Uri.parse(
        'https://api.example.com/books?page=$page&limit=$itemsPerPage'));
    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      return data.map((json) => Book.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load books');
    }
  }
}
