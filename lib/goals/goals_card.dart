import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:halaexpenses/categories/icons.dart';

import '../color.dart';
import 'package:percent_indicator/percent_indicator.dart';

import '../providers/theme_provider.dart';



Widget GoalCard(context,item,progressVal){


  var index=0;
  return Container(
    //color: Colors.indigo,
    child: Row(
      children: [
        Container(//color: Colors.cyan,
          width: MediaQuery.of(context).size.width *.25,
          height:MediaQuery.of(context).size.height * .12,
          padding: EdgeInsets.all(14),
          child: Container(

              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                  color:ThemeProvider.getBack(context)
              ),
              child: Icon(MyIcons.allicons[item['CatIcon']],size: 30,)),
        ),
        Container(
          child: Column(
            children: [
              Container(
                child:
                Container(//color: Colors.red,
                  width: MediaQuery.of(context).size.width *.45,
                  height:MediaQuery.of(context).size.height * .06,
                  child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,children: [
                    Container(margin: EdgeInsets.only(left: 10,top: 25),//color: Colors.redAccent,
                      child: Text(item['CatName'],style: TextStyle(fontSize: 17),),
                    ),
                    Container(


                        //color: Colors.pinkAccent,
                        padding: EdgeInsets.only(top: 20)
                        ,child:
                    Row(crossAxisAlignment: CrossAxisAlignment.end,children: [Text(item['SpentLimit'].toString(),style: TextStyle(fontSize: 17)),Icon(Icons.monetization_on)],))
                  ],
// Row(children: [],)
                  ),
                ),

                /////////////////////////
              ),
              Container(
                 //color: Colors.cyan,


                    margin: EdgeInsets.symmetric(vertical: 10),
                    width: 180,
                    height: 20,
                    child:
                    ClipRRect(

                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      child: LinearProgressIndicator(


                        value: progressVal,
                        valueColor: AlwaysStoppedAnimation<Color>(darkgreen),
                        backgroundColor: darkred,
                      ),
                    ),
                  )


            ],
          ),
        )
      ],
    ),
  );
}


