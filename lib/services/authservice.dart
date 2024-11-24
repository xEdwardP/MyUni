import 'package:flutter/material.dart';
import 'package:myuni/models/user_model.dart';

class Authservice with ChangeNotifier{
String _user;
String _email;
String _password;
bool _band = false;

Authservice({String user='',String email='',String password='', bool band=false})
:_user = user,
_email = email,
_password = password,
_band = band;

String get user=>_user;
String get email=>_email;
String get password=>_password;
bool get band =>_band;

void setuser(String user){
  _user=user;
  notifyListeners();
}

void setEmail(String email){
  _email=email;
  notifyListeners();
}

void setPassword(String password){
  _password=password;
  notifyListeners();
}
void signUp(BuildContext context){
 if(email.contains('@') && (email.endsWith('.com')|| email.endsWith('.es')) ){
  if(password.length >=6){
    _band=true;
    notifyListeners();
  }else{
  _band= false;
 }
 }else{
  _band=false;
 }
 notifyListeners();


}
}