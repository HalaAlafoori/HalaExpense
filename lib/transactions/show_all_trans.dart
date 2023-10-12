import 'package:flutter/material.dart';
import 'package:halaexpenses/color.dart';
import 'package:halaexpenses/data/repositories/transactions_repo.dart';

import '../data/db_helper.dart';
import '../home/transaction_card.dart';
import '../models/transaction_model.dart';
import '../shared/main/dismiss_backgrounds.dart';
import '../shared/main/main_app_bar.dart';


class ShowAllTrans extends StatefulWidget {
  const ShowAllTrans({Key? key}) : super(key: key);

  @override
  State<ShowAllTrans> createState() => _ShowAllTransState();
}

class _ShowAllTransState extends State<ShowAllTrans> {
  //var dismissableItem;
  final List<String> items=new List<String>.generate(10, (index) => "items ${index+1}");
  var dir;
  var dismissedItem;
  @override
  Widget build(BuildContext context) {
    return
      RefreshIndicator(
        onRefresh: ()async{
          setState(() {

          });
        },
        child: Scaffold(
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
                    FutureBuilder<List<Map<String,dynamic>>?>(
                      future: DbHelper().getAllTransCat(),
                      builder: (context,snapshot){
                        if(snapshot.connectionState ==ConnectionState.waiting){
                          return Center(child: CircularProgressIndicator());
                        }
                        else if(snapshot.connectionState ==ConnectionState.done){
                          if(snapshot.hasError)
                            return Center(child: Text("Error ${snapshot.error.toString()}"));
                          else if(snapshot.hasData){
                            var list=snapshot.data??[];
                            var myList = List.from(list);
                            return

                              ListView.builder(itemBuilder:(context, index){
                                return
                                  Dismissible(
                                    background: slideRightBackground(),
                                    secondaryBackground: slideLeftBackground(),
                                    key: Key(myList[index].toString()),
                                    child: InkWell(
                                        onTap: () {
                                          // print("${items[index]} clicked");
                                        },
                                        child: TransactionCard(context,myList[index])),
                                    //onDismissed always dismiss or returns an error

                                    confirmDismiss: (direction) async {
                                      //async--> Future return value: true or false
                                      //true--> dismissed
                                      //makes the card undragable while confirm(if there is )
                                      //false--> draged back
                                      if (direction == DismissDirection.endToStart) {

                                          dismissedItem=myList[index];
                                          print(dismissedItem);
                                         // var isdel=TransactionRepository().deleteFromDb(dismissedItem['TransId']);
                                          myList.removeAt(index);
                                          // if(isdel != null && isdel==true){
                                          //   setState(() {
                                          //
                                          //   });
                                          // }

                                          print("after dismiss${myList}");
                                          ScaffoldMessenger.of(context).showSnackBar(
                                              SnackBar(
                                                content: Text('item dismissed'),
                                                duration: Duration(seconds: 2),

                                                action: SnackBarAction(
                                                  label: 'Undo',
                                                  onPressed: () {

                                                      var data={
                                                        "TransId":dismissedItem['TransId'],

                                                        "TransName":dismissedItem['TransName'],
                                                        "CatId":dismissedItem['CatId'],
                                                        "Total":(dismissedItem['Total']),

                                                        // "TransDate":formatDate(DateFormat('hh:mm:ss').format(DateTime.now()));
                                                        "TransDate":dismissedItem['TransDate']

                                                      };
                                                      var addRes= TransactionRepository().addToDb(TransactionModel.fromJson(data));
                                                      print("ttttttt${myList}");

                                                      //  items.insert(index, dismissedItem!);
                                                      dismissedItem = null;


                                                  },
                                                ),
                                              )

                                        );
                                          setState(() {

                                          });

                                      } else {
                                        // TODO: Navigate to edit page;
                                      }
                                    },

                                  );


                              } ,
                                itemCount:myList.length ,
                              );
                          }
                          else{
                            return Center(child: Text("Error ${snapshot.error.toString()}"));

                          }

                        }
                        else{
                          return Center(child: Text("Error ${snapshot.error.toString()}"));

                        }

                      },),
                    ) ,
                  ]


              ),
            ),

          ],),
        ) ,
    ),
      );;
  }
}
