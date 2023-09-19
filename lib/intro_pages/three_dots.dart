import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget threeDots (int chosenDot){
  return    Row(mainAxisAlignment: MainAxisAlignment.center,children: [

    Icon(Icons.circle,color:chosenDot==1? Colors.green:Colors.white,),
    SizedBox(width: 16),
    Icon(Icons.circle,color: chosenDot==2? Colors.green:Colors.white,),
    SizedBox(width: 16),
    Icon(Icons.circle,color: chosenDot==3? Colors.green:Colors.white,),

  ],);
}