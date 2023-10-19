import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class LoginProvider with ChangeNotifier {
  bool _isLoggedIn = false;
  String _username = '';
  String _email = '';
  String _password = '';
  double _budget=0;

  bool get isLoggedIn => _isLoggedIn;
  String get username => _username;
  String get email => _email;
  String get password => _password;
  double get budget => _budget;



  void login(String email, String password, String name,double budget) {
    // Perform login logic, such as validating credentials
    // For simplicity, we'll assume the login is successful
    _isLoggedIn = true;
    _email = email;
    _password = password;
    _username = name; // Set a default username for demonstration purposes
    _budget=budget;
    notifyListeners();
  }

  void logout() {
    _isLoggedIn = false;
    _username = '';
    _email = '';
    _password = '';
    _budget = 0;
    notifyListeners();
  }
  void setEmail(String newEmail) {
    _email = newEmail;
    notifyListeners();
  }
}