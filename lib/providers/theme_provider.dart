import 'package:flutter/material.dart';
import 'package:halaexpenses/color.dart';

class ThemeProvider extends ChangeNotifier {
  static Color? getBack(BuildContext context){
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final backgroundColor = isDarkMode ? Colors.grey.shade600 : Colors.blueGrey.shade50;
    return backgroundColor;

  }

  bool _isDarkMode = false;

  ThemeData get themeData =>
      _isDarkMode ? _darkTheme : _lightTheme;

  bool get isDarkMode => _isDarkMode;

  bool isDark(){
    if(_isDarkMode==true)
      return true;
    else
      return false;
  }

  void toggleTheme() {
    _isDarkMode = !_isDarkMode;
    notifyListeners();
  }

  ThemeData _lightTheme = ThemeData(
    primarySwatch: darkgreen,
    // Add other light theme properties here
  );

  ThemeData _darkTheme = ThemeData.dark().copyWith(
    scaffoldBackgroundColor: Colors.grey.shade800, // Set the page background color to black
      inputDecorationTheme: InputDecorationTheme(
        labelStyle: TextStyle(
          color: Colors.white, // Set the title color to white
        ),
      ),
    textTheme: ThemeData.dark().textTheme.copyWith(
      bodyText1: TextStyle(color: Colors.white), // Set the text color to white
      bodyText2: TextStyle(color: Colors.white), // Set the secondary text color to white
      headline6: TextStyle(
        color: Colors.white, // Set the title color to white
      ),

    ),
    appBarTheme: AppBarTheme(
      color:darkgreen[200],
      titleTextStyle: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.bold),
      actionsIconTheme: IconThemeData(color: Colors.black ),
      iconTheme: IconThemeData(color: Colors.black )
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: darkgreen[200]
    ),
    colorScheme: ColorScheme.dark().copyWith(
      primary: darkgreen, // Set the primary color for dark mode

secondary: Colors.white,

    ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
       // backgroundColor: Colors.black, // Set the background color of the BottomNavigationBar in dark mode
        selectedItemColor: darkgreen[200], // Set the color of the selected bottom navigation bar item in dark mode
      )
    // Add other dark theme properties here
  );
}

