import 'package:flutter/material.dart';

class LoginModel with ChangeNotifier {
  String _email = '';
  String _password = '';
  bool _isLoggedIn = false;

  String get email => _email;
  String get password => _password;
  bool get isLoggedIn => _isLoggedIn;

  void setEmail(String email) {
    _email = email;
    notifyListeners();
  }

  void setPassword(String password) {
    _password = password;
    notifyListeners();
  }

  void login(BuildContext context, TextEditingController emailController,
      TextEditingController passwordController) {
    const String validEmail = 'epineda@yopmail.com';
    const String validPassword = '12345678';

    if (_validateEmail(_email) && _validatePassword(_password)) {
      if (_email == validEmail && _password == validPassword) {
        _isLoggedIn = true;
        notifyListeners();
        Navigator.pushReplacementNamed(context, '/home');
      } else {
        _isLoggedIn = false;
        _clearFields(emailController, passwordController);
        _showError(context, 'Credenciales inválidas');
      }
    } else {
      _isLoggedIn = false;
      _clearFields(emailController, passwordController);
      _showError(context, 'Formato de correo o contraseña incorrectos');
    }
    notifyListeners();
  }

  void logout() {
    _isLoggedIn = false;
    notifyListeners();
  }

  bool _validateEmail(String email) {
    final emailRegex = RegExp(r'^[^@\s]+@[^@\s]+\.[^@\s]+$');
    return emailRegex.hasMatch(email);
  }

  bool _validatePassword(String password) {
    return password.length >= 6;
  }

  void _showError(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Colors.red,
      ),
    );
  }

  void _clearFields(TextEditingController emailController,
      TextEditingController passwordController) {
    emailController.clear();
    passwordController.clear();
    setEmail('');
    setPassword('');
  }
}
