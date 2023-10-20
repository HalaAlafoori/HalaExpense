import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:halaexpenses/color.dart';

Widget threeDots (int chosenDot){
  return    Row(mainAxisAlignment: MainAxisAlignment.center,children: [

    Icon(Icons.circle,color:chosenDot==1? darkgreen:Colors.grey.shade200,),
    SizedBox(width: 16),
    Icon(Icons.circle,color: chosenDot==2? darkgreen:Colors.grey.shade200,),


  ],);
}