import 'package:flutter/material.dart';
import 'package:halaexpenses/color.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeProvider with ChangeNotifier {

  //static methods

  static Color? getIcons(BuildContext context){
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final backgroundColor = isDarkMode ? Colors.grey.shade50 : Colors.grey.shade600;
    return backgroundColor;

  }
  static Color? getBack(BuildContext context){
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final backgroundColor = isDarkMode ? Colors.grey.shade600 : Colors.blueGrey.shade50;
    return backgroundColor;

  }
  static Color? getLabel(BuildContext context){
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final backgroundColor = isDarkMode ? Colors.white : Colors.black;
    return backgroundColor;

  }


  static Color? getTitle(BuildContext context){
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final backgroundColor = isDarkMode ? Colors.white70 : Colors.black;
    return backgroundColor;

  }


  bool _isDarkMode = false;

  ThemeData get themeData =>
      _isDarkMode ? _darkTheme : _lightTheme;

  bool get isDarkMode => _isDarkMode;

  // bool isDark(){
  //   if(_isDarkMode==true)
  //     return true;
  //   else
  //     return false;
  // }

  void toggleTheme() async{
    _isDarkMode = !_isDarkMode;
    await saveThemeInfo();
    notifyListeners();
  }

  ThemeData _lightTheme = ThemeData(
    primarySwatch: darkgreen,
    // Add other light theme properties here
  );

  ThemeData _darkTheme = ThemeData.dark().copyWith(
    scaffoldBackgroundColor: Colors.grey.shade800, // Set the page background color to black
      // inputDecorationTheme: InputDecorationTheme(
      //   labelStyle: TextStyle(
      //     color: Colors.white, // Set the title color to white
      //   ),
      // ),
    // textTheme: ThemeData.dark().textTheme.copyWith(
    //   bodyText1: TextStyle(color: Colors.white), // Set the text color to white
    //   bodyText2: TextStyle(color: Colors.white), // Set the secondary text color to white
    //   headline6: TextStyle(
    //     color: Colors.white, // Set the title color to white
    //   ),
    //
    // ),
    appBarTheme: AppBarTheme(
      color:darkgreen[200],
     // titleTextStyle: TextStyle(color: Colors.red,fontSize: 20,fontWeight: FontWeight.bold),

      actionsIconTheme: IconThemeData(color: Colors.white70 ),
      iconTheme: IconThemeData(color: Colors.white70 )
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: darkgreen[200],
     foregroundColor: Colors.white70
    ),

    //for text button, clicked items
    colorScheme: ColorScheme.dark().copyWith(
      primary: darkgreen, // Set the primary color for dark mode

//secondary: Colors.white,

    ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(

        selectedItemColor: darkgreen[200], // Set the color of the selected bottom navigation bar item in dark mode
      )
    // Add other dark theme properties here
  );
  Future<void> saveThemeInfo() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('_isDark', _isDarkMode);
    print("theme saved into shared prefrence");

  }

  Future<void> getThemeInfo() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _isDarkMode = prefs.getBool('_isDark') ?? false;
  }
}



