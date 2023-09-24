import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../color.dart';
import 'package:percent_indicator/percent_indicator.dart';



Widget CategoryCard(context,index){

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
           color:index%3==0?darkred:darkgreen,
         ),
         child: Icon(index%3==0?Icons.bus_alert_rounded:Icons.monetization_on_rounded,size: 40,)),

       Container(margin: EdgeInsets.only(left: 10,top: 10),//color: Colors.redAccent,
         child: Text(index%3==0?"Transports":"Salary",style: TextStyle(fontSize: 13),),
       ),

     ]
     ,
   ),











  );
}

