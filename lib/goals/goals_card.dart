import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../color.dart';
import 'package:percent_indicator/percent_indicator.dart';



Widget GoalCard(context){
  return Container(//color: Colors.grey.shade200,
      width: MediaQuery.of(context).size.width,
      height:MediaQuery.of(context).size.height * .13,
      //color:Colors.white70,


      child:
      Row(
        children: [

          Container(//color: Colors.cyan,
            width: MediaQuery.of(context).size.width *.25,
            height:MediaQuery.of(context).size.height * .15,
            padding: EdgeInsets.all(14),
            child: Container(

                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color:Colors.grey.shade200,
                ),
                child: Icon(Icons.coffee,size: 30,)),
          ),
          Container(//color: Colors.yellow,
            width: MediaQuery.of(context).size.width *.65,
            height:MediaQuery.of(context).size.height * .15,
            child: Column(
              children: [
                Container(//color: Colors.red,
                  width: MediaQuery.of(context).size.width *.65,
                  height:MediaQuery.of(context).size.height * .06,
                  child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,children: [
                    Container(margin: EdgeInsets.only(left: 10,top: 25),//color: Colors.redAccent,
                      child: Text("Food",style: TextStyle(fontSize: 17),),
                    ),
                    Container(
                      //color: Colors.pinkAccent,
                        padding: EdgeInsets.only(top: 20)
                        ,child:
                    Row(crossAxisAlignment: CrossAxisAlignment.end,children: [Text("2000",style: TextStyle(fontSize: 17)),Icon(Icons.monetization_on)],))
                  ],
                    // Row(children: [],)
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 10),
                  width: 300,
                  height: 20,
                  child:
                  ClipRRect(

                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    child: LinearProgressIndicator(


                      value: 0.7,
                      valueColor: AlwaysStoppedAnimation<Color>(darkgreen),
                      backgroundColor: darkred,
                    ),
                  ),
                )

              ],
            ),

          )

        ],
      )








  );
}

