import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:halaexpenses/categories/icons.dart';

import '../color.dart';
import 'package:percent_indicator/percent_indicator.dart';



Widget CategoryCard(context,item){


  return Container(
    padding: EdgeInsets.all(0),

    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(20),
      //color:Colors.grey.shade200,
    ),
   margin: EdgeInsets.symmetric(horizontal:10),
   child:
   Column(crossAxisAlignment: CrossAxisAlignment.center,
     children: [Container(
         padding: EdgeInsets.all(14),

         decoration: BoxDecoration(
           borderRadius: BorderRadius.circular(20),
           color:item.type==1?darkred:darkgreen,
         ),
         child: Icon(MyIcons.allicons[item.catIcon],size: 40,)),

       Container(margin: EdgeInsets.only(left: 10,top: 10),//color: Colors.redAccent,
         child: Text(item.catName,style: TextStyle(fontSize: 13),),
       ),

     ]
     ,
   ),











  );
}

