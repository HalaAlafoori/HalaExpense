import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../color.dart';


Widget TransactionCard(context){
  return
    Container(//color: Colors.yellowAccent,
    height: MediaQuery.of(context).size.height *.12 ,


    padding: EdgeInsets.symmetric(vertical: 15,horizontal: 5),
    child: ListTile(
        leading:
        Container(
            padding: EdgeInsets.all(14),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color:darkred,
            ),
            child: Icon(Icons.coffee,size: 30,)),
        title: Container(margin: EdgeInsets.only(left: 20),//color: Colors.redAccent,
          child: Text("Food"),
        ),
        subtitle: Container(margin: EdgeInsets.only(left: 20),//color: Colors.indigoAccent,
          child: Text("Lunch"),
        ),
        trailing:
        Container(
          //color: Colors.pinkAccent,
            padding: EdgeInsets.symmetric(vertical: 10)
            ,child: Column(crossAxisAlignment: CrossAxisAlignment.end,children: [Text("\$200"),Text("Mon 06,2023",style: TextStyle(color: Colors.grey),),],))

    ),
  );
}