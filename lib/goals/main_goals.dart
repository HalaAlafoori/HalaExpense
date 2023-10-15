import 'package:flutter/material.dart';

import 'package:halaexpenses/data/repositories/transactions_repo.dart';
import 'package:halaexpenses/goals/goals_card.dart';
import 'package:halaexpenses/transactions/edit_trans.dart';

import '../data/db_helper.dart';
import '../home/transaction_card.dart';

import '../shared/main/dismiss_backgrounds.dart';
import '../shared/main/main_app_bar.dart';
import 'package:smartrefresh/smartrefresh.dart';



class MainGoals extends StatefulWidget {
  const MainGoals({Key? key}) : super(key: key);

  @override
  State<MainGoals> createState() => _MainGoals();

}

class _MainGoals extends State<MainGoals> {
  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey =
  GlobalKey<RefreshIndicatorState>();
  final RefreshController _refreshController = RefreshController();
  Future<List<Map<String, dynamic>>?>? _data;
  late List<Map<String, dynamic>> data=[]; // Change the type to a mutable list
  var dir;
  var dismissedItem;



  @override
  void initState() {

    _data = fetchData();
  }

  Future<List<Map<String, dynamic>>?> fetchData() async {
    //getting data from db
    var res=await DbHelper().getAllPlansCat();
    data.clear();
    res!.forEach((item) {
      data.add(item);
    });


    return data;
  }

  Future<void> _refreshData() async {
    setState(() {
      _data=null;
      _data = fetchData();
    });
    await _data;

    _refreshController.refreshCompleted();
  }



  @override
  Widget build(BuildContext context) {
    return
      RefreshIndicator(
        notificationPredicate:(notification) => false,//to stop refresh on pull down
        key: _refreshIndicatorKey,
        onRefresh: _refreshData,


          child:Container(//color: Colors.redAccent,
            padding: EdgeInsets.all(10),//color: Colors.pink,
            child: 
            
            SingleChildScrollView(
              child: Column(children: [



                Container(//color: Colors.indigo,
                  padding: EdgeInsets.all(10),
                  // color: Colors.blue ,

                  child: Column(
                      children: [

                        Container(//color: Colors.lime,
                          height: MediaQuery.of(context).size.height *.85  ,
                          child:
                          FutureBuilder<List<Map<String, dynamic>>?>(
                            future:_data!,
                            builder: (context,snapshot){
                              if(snapshot.connectionState ==ConnectionState.waiting){
                                return Center(child: CircularProgressIndicator());
                              }
                              else if(snapshot.connectionState ==ConnectionState.done){
                                if(snapshot.hasError)
                                  return Center(child: Text("Error ${snapshot.error.toString()}"));
                                else if(snapshot.hasData){

                                  final List<Map<String, dynamic>> data = snapshot.data!;

                                  //  var myList = List.from(list);

                                  return

                                    ListView.builder(itemBuilder:(context, index){
                                      return
                                        Container(//color: Colors.red,
                                          child: Dismissible(
                                            background: slideRightBackground(),
                                            secondaryBackground: slideLeftBackground(),
                                            key: Key(data[index].toString()),
                                            child: InkWell(
                                              onTap: () {
                                                // print("${items[index]} clicked");
                                              },
                                              child:
                                              Container(
                                                child: ExpansionTile(title:GoalCard(context,data[index]),
                                                  // trailing:_customIcons? Icon(Icons.keyboard_arrow_up_rounded):Icon(Icons.keyboard_arrow_down_rounded),

                                                  children: [Text("data")],),
                                              ),

                                            ),
                                            //onDismissed always dismiss or returns an error

                                            confirmDismiss: (direction) async {
                                              //async--> Future return value: true or false
                                              //true--> dismissed
                                              //makes the card undragable while confirm(if there is )
                                              //false--> draged back
                                              if (direction == DismissDirection.endToStart) {

                                                //_dismissItem(index);





                                                print("after dismiss${data}");
                                                print("@@@@@@@@@@@@");



                                              } else {
                                                // TODO: Navigate to edit page;
                                                // var updateRes=await Navigator.push(
                                                //     context,
                                                //     MaterialPageRoute(
                                                //       builder: (context) => EditTrans(data[index]),
                                                //     ));
                                                // if(updateRes){
                                                //   confirmUpdate(data[index]);
                                                //
                                                //
                                                // }
                                                // else{
                                                //   errorUpdate(data[index]);
                                                //
                                                // }
                                              }
                                            },

                                          ),
                                        );


                                    } ,
                                      itemCount:data.length ,
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
            ),
          ) ,
       
      );
  }
}
