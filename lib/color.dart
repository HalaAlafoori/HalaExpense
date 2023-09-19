import 'package:flutter/material.dart';

const MaterialColor white = MaterialColor(_whitePrimaryValue, <int, Color>{
  50: Color(0xFFFFFFFF),
  100: Color(0xFFFFFFFF),
  200: Color(0xFFFFFFFF),
  300: Color(0xFFFFFFFF),
  400: Color(0xFFFFFFFF),
  500: Color(_whitePrimaryValue),
  600: Color(0xFFFFFFFF),
  700: Color(0xFFFFFFFF),
  800: Color(0xFFFFFFFF),
  900: Color(0xFFFFFFFF),
});
const int _whitePrimaryValue = 0xFFFFFFFF;

const MaterialColor whiteAccent = MaterialColor(_whiteAccentValue, <int, Color>{
  100: Color(0xFFFFFFFF),
  200: Color(_whiteAccentValue),
  400: Color(0xFFFFFFFF),
  700: Color(0xFFFFFFFF),
});
const int _whiteAccentValue = 0xFFFFFFFF;