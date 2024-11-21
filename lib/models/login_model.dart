import 'package:flutter/material.dart';

class LoginModel with ChangeNotifier {
  String _email;
  String _password;
  bool _isLoggedIn;

  LoginModel({String email = '', String password = '', bool isLoggedIn = false})
      : _email = email,
        _password = password,
        _isLoggedIn = isLoggedIn;

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

  void login(BuildContext context) {
    if (email.contains('@') &&
        (email.endsWith('.com') || email.endsWith('.es'))) {
      if (password.length >= 6) {
        _isLoggedIn = true;
        notifyListeners();
        Navigator.pushReplacementNamed(context, '/home');
      } else {
        _isLoggedIn = false;
      }
    } else {
      _isLoggedIn = false;
    }
    notifyListeners();
  }
}
