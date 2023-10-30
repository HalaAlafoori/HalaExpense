import 'dart:async';
import 'package:shared_preferences/shared_preferences.dart';

void Logout()async{
SharedPreferences preferences = await SharedPreferences.getInstance();
await preferences.clear();}