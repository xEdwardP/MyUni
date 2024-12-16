class Book {
  final String id;
  final String title;
  final String author;
  final String category;
  final String description;
  final String image;

  Book({
    required this.id,
    required this.title,
    required this.author,
    required this.category,
    required this.description,
    required this.image,
  });

  factory Book.fromJson(Map<String, dynamic> json) {
    return Book(
      id: json['id'],
      title: json['title'],
      author: json['author'],
      category: json['category'],
      description: json['description'],
      image: json['image'],
    );
  }
}
