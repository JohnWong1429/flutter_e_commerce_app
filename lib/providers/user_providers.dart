import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UserProvider extends ChangeNotifier implements ReassembleHandler {
  int? _id;
  String? _username;
  String? _email;
  String? _firstName;
  String? _lastName;
  String? _gender;
  String? _image;

  int? get id => _id;
  set id(int? value) {
    _id = value;
    notifyListeners();
  }

  String? get username => _username;
  set usename(String? value) {
    _username = value;
    notifyListeners();
  }

  String? get email => _email;
  set email(String? value) {
    _email = value;
    notifyListeners();
  }

  String? get firstName => _firstName;
  set firstName(String? value) {
    _firstName = value;
    notifyListeners();
  }

  String? get lastName => _lastName;
  set lastName(String? value) {
    _lastName = value;
    notifyListeners();
  }

  String? get gender => _gender;
  set gender(String? value) {
    _gender = value;
    notifyListeners();
  }

  String? get image => _image;
  set image(String? value) {
    _image = value;
    notifyListeners();
  }

  @override
  void reassemble() {
    // Did hot-reload
  }
}



// {
//   "id": 15,
//   "username": "kminchelle",
//   "email": "kminchelle@qq.com",
//   "firstName": "Jeanne",
//   "lastName": "Halvorson",
//   "gender": "female",
//   "image": "https://robohash.org/autquiaut.png?size=50x50&set=set1",
//   "token": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MTUsInVzZXJuYW1lIjoia21pbmNoZWxsZSIsImVtYWlsIjoia21pbmNoZWxsZUBxcS5jb20iLCJmaXJzdE5hbWUiOiJKZWFubmUiLCJsYXN0TmFtZSI6IkhhbHZvcnNvbiIsImdlbmRlciI6ImZlbWFsZSIsImltYWdlIjoiaHR0cHM6Ly9yb2JvaGFzaC5vcmcvYXV0cXVpYXV0LnBuZz9zaXplPTUweDUwJnNldD1zZXQxIiwiaWF0IjoxNjM1NzczOTYyLCJleHAiOjE2MzU3Nzc1NjJ9.n9PQX8w8ocKo0dMCw3g8bKhjB8Wo7f7IONFBDqfxKhs"
// }
     