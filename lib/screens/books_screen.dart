import 'package:flutter/material.dart';
import 'package:myuni/widgets/custom_drawer.dart';
import 'package:myuni/utils/AppColors.dart';

class BooksScreen extends StatefulWidget {
  const BooksScreen({Key? key}) : super(key: key);

  @override
  _BooksScreenState createState() => _BooksScreenState();
}

class _BooksScreenState extends State<BooksScreen> {
  final List<Map<String, String>> books = [
    {
      'title': 'El Quijote',
      'author': 'Miguel de Cervantes',
      'category': 'Clásicos',
      'description': 'Publicada en dos partes, en 1605 y 1615, es una de las obras más destacadas de la literatura española y universal. Narra las aventuras de un hidalgo que, influido por los libros de caballería, decide convertirse en caballero andante.',
      'image': 'panesito123'
    },
    {
      'title': 'Cien Años de Soledad',
      'author': 'Gabriel García Márquez',
      'category': 'Ficción',
      'description': 'Es una novela publicada en 1967 y es considerada una obra maestra de la literatura hispanoamericana y universal. La historia relata la vida de la familia Buendía en el ficticio pueblo de Macondo a lo largo de siete generaciones.',
      'image': 'panesito123'
    },
    {
      'title': 'Donde los Árboles Cantan',
      'author': 'Laura Gallego',
      'category': 'Fantasía',
      'description': 'Publicada en 2011, esta novela de fantasía juvenil narra la historia de Viana, una joven noble que se embarca en una aventura para salvar su reino y descubre un misterioso bosque donde los árboles cantan.',
      'image': 'panesito123'
    },
  ];

  String selectedCategory = 'Todos';

  @override
  Widget build(BuildContext context) {
    final filteredBooks = selectedCategory == 'Todos'
        ? books
        : books.where((book) => book['category'] == selectedCategory).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text('Biblioteca App'),
        centerTitle: true,
        backgroundColor: AppColors.primary,
      ),
      drawer: CustomDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              decoration: InputDecoration(
                hintText: 'Buscar libros...',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            SizedBox(height: 20),

            Text(
              'Categorías',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
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
                    onTap: () => setState(() => selectedCategory == 'Clásicos'),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),

            // Libros populares
            Text(
              'Libros populares',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
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
                  : Center(
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
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        margin: EdgeInsets.only(right: 8),
        decoration: BoxDecoration(
          color: isSelected ? Colors.blueAccent : Colors.blue[100],
          borderRadius: BorderRadius.circular(20),
        ),
        child: Text(
          label,
          style: TextStyle(
            color: isSelected ? Colors.white : Colors.black,
            fontWeight: FontWeight.bold,
          ),
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
      margin: EdgeInsets.symmetric(vertical: 8.0),
      child: ListTile(
        leading: Image.network(image, fit: BoxFit.cover, width: 50, height: 50),
        title: Text(title),
        subtitle: Text(author),
        trailing: Icon(Icons.arrow_forward),
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

class BookDetailScreen extends StatelessWidget {
  final String title;
  final String author;
  final String category;
  final String description;
  final String image;

  BookDetailScreen({
    required this.title,
    required this.author,
    required this.category,
    required this.description,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        backgroundColor: AppColors.primary,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: AspectRatio(
                  aspectRatio: 16 / 9,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: Image.network(
                      image,
                      width: double.infinity,
                      height: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Text(
                title,
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Text(
                'Autor: $author',
                style: TextStyle(fontSize: 18),
              ),
              SizedBox(height: 10),
              Text(
                'Categoría: $category',
                style: TextStyle(fontSize: 18, color: Colors.grey[600]),
              ),
              SizedBox(height: 20),
              Text(
                description,
                style: TextStyle(fontSize: 16),
              ),
            ],
          ),
        ),
      ),
    );
  }
}