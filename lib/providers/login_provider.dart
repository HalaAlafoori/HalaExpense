import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginProvider extends ChangeNotifier {
  bool _isLoggedIn = false;
  double _budget = 0;
  double _leftAmount = 0;

  bool get isLoggedIn => _isLoggedIn;
  double get budget => _budget;
  double get leftAmount => _leftAmount;

  Future<void> login(double budget) async {
    _isLoggedIn = true;
    _budget = budget;
    await saveLoginInfo();

    notifyListeners();
  }

  Future<void> setLeftAmount(double leftAmount) async {
    _leftAmount=leftAmount;
    await saveLeftAmount();

    notifyListeners();
  }





  Future<void> saveLoginInfo() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('_isLoggedIn', _isLoggedIn);
    await prefs.setDouble('_budget', _budget);
  }


  Future<void> saveLeftAmount() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setDouble('_leftAmount', _leftAmount);

    //await prefs.setDouble('_budget', _budget);
  }
  Future<void> getLeftAmount() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();


    _leftAmount = prefs.getDouble('_leftAmount') ?? 0.0;

    //await prefs.setDouble('_budget', _budget);
  }

  Future<void> getLoginInfo() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _isLoggedIn = prefs.getBool('_isLoggedIn') ?? false;
    _budget = prefs.getDouble('_budget') ?? 0.0;
  }
}