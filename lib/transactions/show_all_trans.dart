import 'package:flutter/material.dart';
import 'package:halaexpenses/color.dart';

import '../home/transaction_card.dart';
import '../shared/main/dismiss_backgrounds.dart';
import '../shared/main/main_app_bar.dart';


class ShowAllTrans extends StatefulWidget {
  const ShowAllTrans({Key? key}) : super(key: key);

  @override
  State<ShowAllTrans> createState() => _ShowAllTransState();
}

class _ShowAllTransState extends State<ShowAllTrans> {
  var dismissableItem;
  final List<String> items=new List<String>.generate(10, (index) => "items ${index+1}");
  var dir;
  var dismissedItem;
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
                  ListView.builder(itemBuilder:(context, index){
                    return
                      Dismissible(
                        background: slideRightBackground(),
                        secondaryBackground: slideLeftBackground(),
                        key: Key(items[index]),
                        child: InkWell(
                            onTap: () {
                              print("${items[index]} clicked");
                            },
                            child: TransactionCard(context,index)),
                        confirmDismiss: (direction) async {
                          if (direction == DismissDirection.endToStart) {
                            setState(() {
                              dismissedItem=items[index];
                              items.removeAt(index);
                              ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text('item dismissed'),
                                    duration: Duration(seconds: 2),

                                    action: SnackBarAction(
                                      label: 'Undo',
                                      onPressed: () {
                                        setState(() {
                                          items.insert(index, dismissedItem!);
                                          dismissedItem = null;
                                        });
                                      },
                                    ),
                                  ));
                            });
                          } else {
                            // TODO: Navigate to edit page;
                          }
                        },

                      );


                  } ,
                    itemCount:items.length ,
                  ),
                  ) ,
                ]


            ),
          ),

        ],),
      ) ,
    );;
  }
}
