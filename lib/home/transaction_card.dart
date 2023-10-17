import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../categories/icons.dart';
import '../color.dart';

String dateOnly(DateTime date) {
  var dateStr=date.toString();
  var dateArr=dateStr.split(' ');
  return dateArr[0];
}


Widget TransactionCard(context,item){
  print("hiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiii$item");
  DateTime date = new DateTime.fromMillisecondsSinceEpoch(item['TransDate']);
  print(date);

 // print(category);
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
            color:item['Type']==0?darkgreen:darkred,
            ),
           child: Icon(MyIcons.allicons[item['CatIcon']],size: 30,)),
        title: Container(margin: EdgeInsets.only(left: 10),//color: Colors.redAccent,
          child: Text(item['TransName']),
        ),
        subtitle: Container(margin: EdgeInsets.only(left: 20),//color: Colors.indigoAccent,
          child: Text(item['CatName']),
        ),
        trailing:
        Container(
          //color: Colors.pinkAccent,
            padding: EdgeInsets.symmetric(vertical: 10)
            ,child: Column(crossAxisAlignment: CrossAxisAlignment.end,children: [Text("\$ ${item['Total']}"),Text("${dateOnly(date)}",style: TextStyle(color: Colors.grey),),],))

    ),
  );
}