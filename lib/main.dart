import 'package:flutter/material.dart';
import 'package:myuni/screens/attendance_student_screen.dart';
import 'package:provider/provider.dart';
import 'models/login_model.dart';
import 'screens/login_screen.dart';
import 'screens/home_screen.dart';
import 'screens/books_screen.dart';
import 'screens/loans_screen.dart';
import 'screens/returns_screen.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => LoginModel(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/login',
      routes: {
        '/login': (context) => LoginScreen(),
        '/home': (context) => HomeScreen(),
        '/books': (context) => BooksScreen(),
        '/loans': (context) => LoansScreen(),
        '/returns': (context) => ReturnsScreen(),
        '/attendances': (context) => AttendanceScreen(),
      },
    );
  }
}
