import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/theme_provider.dart';




AppBar MyMainAppBar(context,String title){
  return  AppBar(
    leading:
    Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0,horizontal: 18.0),
      child: IconButton(
          onPressed: () {
            Provider.of<ThemeProvider>(context, listen: false).toggleTheme();
          },

          icon:
          Consumer<ThemeProvider>(
              builder: (context, themeProvider, _) {
                return Icon(
                  themeProvider.isDark()
                      ? Icons.light_mode // Light mode icon
                      : Icons.dark_mode, // Dark mode icon
                  size: 25,
                );
              })
      ),
    ),
    title: Text(title,style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.bold),),
    centerTitle: true,
    actions: [

      Padding(
        padding: const EdgeInsets.symmetric(vertical: 7.0,horizontal: 20.0),
        child: Icon(Icons.search),
      ),

    ],

  );
}