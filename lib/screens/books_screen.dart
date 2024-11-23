import 'package:flutter/material.dart';
import 'package:myuni/widgets/custom_drawer.dart';
import 'package:myuni/utils/AppColors.dart';

class BooksScreen extends StatefulWidget {
  const BooksScreen({Key? key});

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
      'image': 'https://m.media-amazon.com/images/I/71r22pLOqhL._AC_UF894,1000_QL80_.jpg'
    },
    {
      'title': 'Cien Años de Soledad',
      'author': 'Gabriel García Márquez',
      'category': 'Ficción',
      'description': 'Es una novela publicada en 1967 y es considerada una obra maestra de la literatura hispanoamericana y universal. La historia relata la vida de la familia Buendía en el ficticio pueblo de Macondo a lo largo de siete generaciones.',
      'image': 'https://i0.wp.com/www.editorialelcuervo.com/wp-content/uploads/2022/02/17.-CIEN-ANOS-DE-SOLEDAD.jpg?fit=433%2C642&ssl=1'
    },
    {
      'title': 'Donde los Árboles Cantan',
      'author': 'Laura Gallego',
      'category': 'Fantasía',

      'description': 'Publicada en 2011, esta novela de fantasía juvenil narra la historia de Viana, una joven noble que se embarca en una aventura para salvar su reino y descubre un misterioso bosque donde los árboles cantan.',
      'image': 'https://images-eu.ssl-images-amazon.com/images/I/91gYns+sNGL._AC_UL600_SR600,600_.jpg'
    },
    {
      'title': '1984',
      'author': 'George Orwell',
      'category': 'Ciencia',
      'description': 'Una novela distópica publicada en 1949 que presenta una visión totalitaria y opresiva de la sociedad.',
      'image': 'https://miro.medium.com/v2/resize:fit:1400/1*vcN21-CZGrj5dwozpqS2lg.jpeg'
    },
    {
      'title': 'El Principito',
      'author': 'Antoine de Saint-Exupéry',
      'category': 'Clásicos',
      'description': 'Publicado en 1943, esta novela corta francesa es una obra de literatura muy influyente que cuenta la historia de un joven príncipe que explora diferentes planetas.',
      'image': 'https://images.cdn1.buscalibre.com/fit-in/360x360/68/08/6808fc4e45bdbde5ff2d1b03bc89348d.jpg'
    },
    {
      'title' : 'Quinta estacion',
      'author': 'N. K. Jemisin',
      'category': 'Ficción',
      'description': 'La quinta estacion es la primera parte de la trilogia de la Tierra fragmentada, saga ambientada en una Tierra conformada por un supercontinente, la Quietud, que esta atravesado por diferentes lineas sísmicas.',
      'image': 'https://m.media-amazon.com/images/I/A1LBgN1rIqL.jpg'
    },
    {
      'title': 'El despertar del leviatan',
      'author': 'James S. A. Corey',
      'category': 'Ficción',
      'description': 'Es la primera entrega de la saga The expanse, que continua con La guerra de Caliban, la saga se adapto por la cadena Syfy en la serie de televison The expanse',
      'image': 'https://m.media-amazon.com/images/I/811F-IZSj8L._UF894,1000_QL80_.jpg'
    },
    {
      'title': 'El problema de los tres cuerpos',
      'author': 'Cixin Liu',
      'category': 'Ficción',
      'description': 'Es el primer libro de la trilogia titulada El recuerdo del pasado de la tierra, pero los lectores chinos generalmente se refiere a la serie por el titulo de la primera novela, el hace referencia al problema de los tres cuerpos en el campo de la mecanica orbital.',
      'image': 'https://i.ebayimg.com/images/g/1NsAAOSwKs5mDqhD/s-l225.jpg'
    },
    {
      'title': 'Hacia las estrellas',
      'author': 'Alex Riveiro',
      'category': 'Ciencia',
      'description': 'Hacia las estrellas plantea una ucronia en la que un meterito arrasa Washington D.C. en 1952, años antes de la fundacion de la NASA, que quedara borrada de la historia.',
      'image': 'https://m.media-amazon.com/images/I/71qIk2zehMS._AC_UF894,1000_QL80_.jpg'
    },
    {
      'title': 'Inteligencia Artificial',
      'author': 'Ignasi Belda',
      'category': 'Ciencia',
      'description': 'El auge sin precedentes de la inteligencia artificial nos esta llevando al diseño de maquinas con capacidades equiparables a las del ser humano.',
      'image': 'https://m.media-amazon.com/images/I/61uPstZXDWL._AC_UF894,1000_QL80_.jpg'
    },
    {
      'title': 'El mundo como yo lo veo',
      'author': 'Albert Einsteins',
      'category': 'Ciencia',
      'description': 'Es un libro que recopila los escritos de Albert Einstein, en el que se puede conocer sus pensamientos, ideas, preocupaciones y variedades de intereses, el libro presenta una antologia de la vida y obra de Eistein uno de los fisicos mas famosos de la historia',
      'image': 'https://m.media-amazon.com/images/I/61e37XE36rL._AC_UF894,1000_QL80_.jpg'
    },
    {
      'title': 'Inmune',
      'author': 'Philip Dettmer',
      'category': 'Ciencia',
      'description': 'A menudo, las cosas que que mas nos afectan permanecen ocultas a la vista, es el caso del sistema   inmunitario, tan indispensable para nosotros como el corazon o los pulmones, pero desconocido para la mayoria de la gente.',
      'image': 'https://m.media-amazon.com/images/I/81FuGhBLSWL._AC_UF1000,1000_QL80_.jpg'
    },
    {
      'title': 'Los dioses del norte',
      'author': 'Jara Santamaria',
      'category': 'Fantasía',
      'description': 'Los dioses del norte es una novela juvenil de aventuras escrita en el año 2019, la historia se desarrolla en el valle de Baztan, en el pais vasco.',
      'image': 'https://m.media-amazon.com/images/I/81BoRxyvW8L.jpg'
    },
    {
      'title': 'Narnia',
      'author': 'C. S. Lewis',
      'category': 'Fantasía',
      'description': 'En este mundo, la magia es comun, hay bestias miticas y algunos animales pueden hablar',
      'image': 'https://is1-ssl.mzstatic.com/image/thumb/Publication1/v4/c4/76/4e/c4764e9b-2f89-e9fe-e735-23647d5aba7c/cover.jpg/1200x900wz.jpg'
    },
    {
      'title': 'Todas las hadas del reino',
      'author': 'Laura Gallego',
      'category': 'Fantasía',
      'description': 'Todas la hadas del reino es una novela que cuenta la historia de Camelia, una hada madrina que ayuda a las jovenes doncellas y a aspirantes a heroes a alcanzar   sus finales felices.',
      'image': 'https://images-na.ssl-images-amazon.com/images/I/91gPVWpN9+L._AC_UL210_SR210,210_.jpg'
    },
    {
      'title': 'Los tres mosqueteros',
      'author': 'Alejandro Dumas',
      'category': 'Clásicos',
      'description': 'Los mosqueteros, que componian tanto infanteria como caballeria, eran expertos en el manejo de la espada y las armas de fuego, durante tiempos de paz, servia como escolta para el rey y organizaban simulacros de batallas como entretenimiento de la corte.',
      'image': 'https://m.media-amazon.com/images/I/71T-tUJSKbL.jpg'
    },
    {
      'title': 'La odisea',
      'author': 'Homero',
      'category': 'Clásicos',
      'description': 'La odisea narra la historia del heroe griego Odiseo, Ulises el viaje de regreso a su reino de Itaca donde le esperan su esposa Penelope, rodada de pretendiente, y su hijo Telemaco. Un trayecto de aproximadamente un mes de navegacion que se alarga diez años, los mismos que duro la guerra de Troya',
      'image': 'https://m.media-amazon.com/images/I/61YUYPYlkzL._AC_UF894,1000_QL80_.jpg'
    },
    
  ];

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

                    onTap: () => setState(() => selectedCategory = 'Clásicos'),
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

            

            