import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class LoginProvider with ChangeNotifier {
  bool _isLoggedIn = false;
  double _budget=0;

  bool get isLoggedIn => _isLoggedIn;
  double get budget => _budget;



  void login(String email, String password, String name,double budget) {
    // Perform login logic, such as validating credentials
    // For simplicity, we'll assume the login is successful
    _isLoggedIn = true;
    _budget=budget;
    notifyListeners();
  }

  void logout() {
    _isLoggedIn = false;
    _budget = 0;
    notifyListeners();
  }

}