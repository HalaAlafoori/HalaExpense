import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../color.dart';
import 'package:percent_indicator/percent_indicator.dart';



Widget CategoryCard(context,Color iconBack){

  return Container(
    padding: EdgeInsets.all(7),

    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(20),
      //color:Colors.grey.shade200,
    ),
   margin: EdgeInsets.all(10),
   child:
   Column(crossAxisAlignment: CrossAxisAlignment.center,
     children: [Container(
         padding: EdgeInsets.all(14),

         decoration: BoxDecoration(
           borderRadius: BorderRadius.circular(20),
           color:darkred,
         ),
         child: Icon(Icons.electric_bolt_rounded,size: 40,)),

       Container(margin: EdgeInsets.only(left: 10,top: 10),//color: Colors.redAccent,
         child: Text("Settings",style: TextStyle(fontSize: 13),),
       ),

     ]
     ,
   ),











  );
}

