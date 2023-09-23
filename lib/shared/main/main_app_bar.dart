import 'package:flutter/material.dart';

AppBar MyMainAppBar(String title){
  return  AppBar(
    title: Text(title),
    centerTitle: true,
    actions: [

      Padding(
        padding: const EdgeInsets.symmetric(vertical: 7.0,horizontal: 20.0),
        child: Icon(Icons.search),
      )
    ],

  );
}