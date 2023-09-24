import 'package:flutter/material.dart';
import 'package:halaexpenses/color.dart';

import '../home/transaction_card.dart';
import '../shared/main/main_app_bar.dart';


class ShowAllTrans extends StatefulWidget {
  const ShowAllTrans({Key? key}) : super(key: key);

  @override
  State<ShowAllTrans> createState() => _ShowAllTransState();
}

class _ShowAllTransState extends State<ShowAllTrans> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: MyMainAppBar("All Transactions"),
      body:Container(//color: Colors.redAccent,
        padding: EdgeInsets.all(10),//color: Colors.pink,
        child: Column(children: [



          Container(//color: Colors.indigo,
            padding: EdgeInsets.all(10),
            // color: Colors.blue ,

            child: Column(
              children: [

                Container(//color: Colors.lime,
                  height: MediaQuery.of(context).size.height *.85  ,
                  child:
                  ListView(
                    children: [
                      TransactionCard(context),
                      TransactionCard(context),
                      TransactionCard(context),
                      TransactionCard(context),
                      TransactionCard(context),
                      TransactionCard(context),
                      TransactionCard(context),
                      TransactionCard(context),
                      TransactionCard(context),
                      TransactionCard(context),
                      TransactionCard(context),
                      TransactionCard(context),
                      TransactionCard(context),




                    ],
                  ) ,
                )
              ],

            ),
          ),

        ],),
      ) ,
    );;
  }
}
