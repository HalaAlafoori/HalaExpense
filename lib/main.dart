import 'package:flutter/material.dart';
import 'package:halaexpenses/providers/login_provider.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'intro_pages/intro_one.dart';
import 'intro_pages/intro_two.dart';
import 'main_page.dart';
import 'profile/settings.dart';
import 'transactions/add_trans.dart';
import 'transactions/show_all_trans.dart';
import 'providers/theme_provider.dart';


void main() async {


//to wrap my providers into MyApp :

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ThemeProvider()),
        ChangeNotifierProvider(create: (_) => LoginProvider()),
      ],
      child: MyApp(),
    ),
  );
  // Delete the shared preference
  //  SharedPreferences preferences = await SharedPreferences.getInstance();
  //  preferences.clear();
  // preferences.remove('_budget');
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    final loginProvider = Provider.of<LoginProvider>(context, listen: false);
    final themeProvider = Provider.of<ThemeProvider>(context, listen: false);

    return FutureBuilder<void>(
      future: Future.wait([
        loginProvider.getLoginInfo(),
        themeProvider.getThemeInfo(),
      ]),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator();
        }

        return Consumer<ThemeProvider>(
          builder: (context, themeProvider, _) {
            final bool _isLoggedIn = loginProvider.isLoggedIn;
            final String initialRoute = _isLoggedIn ? '/main' : '/intro1';

            return MaterialApp(
              title: 'Flutter Demo',
              theme: themeProvider.themeData,
              routes: {
                '/intro1': (context) => IntroOne(),
                '/intro2': (context) => IntroTwo(),
                '/main': (context) => MainPage(),
                '/showtrans': (context) => ShowAllTrans(),
                '/addtrans': (context) => AddTrans(),
                '/settings': (context) => Settings(),
              },
              initialRoute: initialRoute,
            );
          },
        );
      },
    );
  }
}
