import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../color.dart';
import 'package:percent_indicator/percent_indicator.dart';



Widget CategoryCard(context,Color iconBack){

  return Container(
    padding: EdgeInsets.all(20),

    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(20),
      color:Colors.grey.shade200,
    ),
   margin: EdgeInsets.all(10),
   child: Column(crossAxisAlignment: CrossAxisAlignment.center,
     children: [Container(
       padding: EdgeInsets.all(14),

         decoration: BoxDecoration(
           borderRadius: BorderRadius.circular(20),
           color:iconBack,
         ),
         child: Icon(Icons.coffee,size: 60,)),
       Container(margin: EdgeInsets.only(left: 10,top: 25),//color: Colors.redAccent,
         child: Text("Food",style: TextStyle(fontSize: 20),),
       ),]
     ,
   ),











  );
}

