import 'package:flutter/material.dart';




AppBar MyMainAppBar(String title){
  return  AppBar(
    title: Text(title,style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.bold),),
    centerTitle: true,
    actions: [

      Padding(
        padding: const EdgeInsets.symmetric(vertical: 7.0,horizontal: 20.0),
        child: Icon(Icons.search),
      )
    ],

  );
}