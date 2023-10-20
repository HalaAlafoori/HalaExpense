import 'package:flutter/material.dart';
import 'package:halaexpenses/providers/login_provider.dart';
import 'package:provider/provider.dart';
import 'color.dart';
import 'intro_pages/intro_one.dart';
import 'intro_pages/intro_three.dart';
import 'intro_pages/intro_two.dart';
import 'main_page.dart';
import 'brunch_page.dart';
import 'profile/settings.dart';
import 'transactions/add_trans.dart';
import 'transactions/show_all_trans.dart';
import 'providers/theme_provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ThemeProvider()),
        ChangeNotifierProvider(create: (_) => LoginProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return Consumer2<ThemeProvider, LoginProvider>(
      builder: (context, themeProvider, loginProvider, _) {
        final String initialRoute = loginProvider.isLoggedIn ? '/main' : '/intro1';

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
  }
}
