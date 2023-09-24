import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../color.dart';


Widget TransactionCard(context,index){
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
              color:index%3==0?darkred:darkgreen,
            ),
            child: Icon(index%3==0?Icons.coffee:Icons.monetization_on_rounded,size: 30,)),
        title: Container(margin: EdgeInsets.only(left: 20),//color: Colors.redAccent,
          child: Text(index%3==0?"Food":"Salary"),
        ),
        subtitle: Container(margin: EdgeInsets.only(left: 20),//color: Colors.indigoAccent,
          child: Text(index%3==0?"Lunch":"Monthly Salary"),
        ),
        trailing:
        Container(
          //color: Colors.pinkAccent,
            padding: EdgeInsets.symmetric(vertical: 10)
            ,child: Column(crossAxisAlignment: CrossAxisAlignment.end,children: [Text("\$200"),Text("Mon 06,2023",style: TextStyle(color: Colors.grey),),],))

    ),
  );
}