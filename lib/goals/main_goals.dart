import 'package:flutter/material.dart';

import 'package:halaexpenses/data/repositories/transactions_repo.dart';
import 'package:halaexpenses/transactions/edit_trans.dart';

import '../data/db_helper.dart';
import '../data/repositories/goal_repo.dart';
import '../home/transaction_card.dart';

import '../models/transaction_model.dart';
import '../shared/main/dismiss_backgrounds.dart';
import '../shared/main/main_app_bar.dart';
import 'package:smartrefresh/smartrefresh.dart';

import 'goals_card.dart';



class MainGoals extends StatefulWidget {
  const MainGoals({Key? key}) : super(key: key);

  @override
  State<MainGoals> createState() => _MainGoals();

}

class _MainGoals extends State<MainGoals> {
  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey =
  GlobalKey<RefreshIndicatorState>();
  final RefreshController _refreshController = RefreshController();
  late List<dynamic> allData=[];
  Future<List<dynamic>?>? _allData;
  Future<List<Map<String, dynamic>>?>? _data;
  late List<Map<String, dynamic>> data=[]; // Change the type to a mutable list
  Future<List<Map<String, dynamic>>?>?  _transData;
  late List<Map<String, dynamic>> transData=[];
  var dir;
  var dismissedItem;
  List transactions=[];



  @override
  void initState() {

    _data = fetchData();

  }

  Future<List<Map<String, dynamic>>?>? fetchData() async {
    //getting data from db
    var res=await DbHelper().getAllPlansCatTrans();
    data.clear();
    transData.clear();
    //print("cleared");
    res!["main"].forEach((item) {
      //print("not null");
      data.add(item);
      //print("added");

    });
    res!["sub"].forEach((item) {
      //print("not null2");
      transData.add(item);
      //print("added2");

    });
    print(transData);


    return data;
  }

  Future<void> _refreshData() async {
    setState(() {
      _allData=null;
      _allData = fetchData();
    });
    await _allData;

    _refreshController.refreshCompleted();
  }

List getTransById(Map<String, dynamic> item){
    //print("+++++++++${item["CatId"]},$transData");
    transactions.clear();
    //print("%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%${transactions.length}");

    for (var element in transData) {
      if(item["CatId"]==element["CatId"] && item["GoalDate"]<=element["TransDate"]){
        var updatedElement = Map.from(element); // Create a new Map with the same values as the existing element
        updatedElement["Type"] = item["Type"]; // Update the "CatId" key with a value of 1
        updatedElement["CatName"] = item["CatName"];
        updatedElement["CatIcon"] = item["CatIcon"];
      //  print("in");
        transactions.add(updatedElement);}
    }
    //print("%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%${transactions.length}");
    return transactions;
}

  double getProgressVal(transactions,limit){
  double prgressVal;
  double sum=0;
  for(var transaction in transactions){
    sum+=transaction["Total"];

  }
  prgressVal= 1-(sum / limit);


    return prgressVal;
  }

  Future<void> _dismissItem(int index) async {
    print("//////////////////////////////////////////////////////////////////////////");

    bool undo=false;
    print("+++++++++++++++++++++++++++++++++++++++++");
    var removedItem=data[index];
    print("^^^^^^^^^^^^^${removedItem}");

    data?.removeAt(index);

    setState(() {
      _data = Future.value(data);
    });
    // _refreshData();
    _refreshController.setFRefreshState(PullToRefreshState());
    _refreshController.refreshCompleted();

    //udno snack

    ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Item dismissed'),
          action: SnackBarAction(
            label: 'Undo',
            onPressed: () {

              undo=true;
              print("7777777777777777777777777777777777777777777777777777777777777777");


              data?.insert(index,removedItem);
              setState(() {
                _data = Future.value(data);
              });
              print("^^^^^^^^^^^^^^^^^^${data}");
              _refreshController.refreshCompleted();

            },
          ),
        ));


    // Wait for the Snackbar to be closed
    await Future.delayed(Duration(seconds: 2));

    // Call your method after the Snackbar is hidden
    if(!undo)
      GoalRepository().deleteFromDb(removedItem['GoalId']);


  }

  void confirmUpdate(item){
    ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content:
          Row(
            children: [
              Icon(Icons.check_circle, color: Colors.green),
              SizedBox(width: 8),
              Text(
                'Item ${item['TransName']} updated successfully',
                style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold),
              ),
            ],
          ),

          backgroundColor: Colors.white,
          elevation: 6,
          behavior: SnackBarBehavior.floating,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),



        ));
    setState(() {
      _data = fetchData();
    });
    print("^^^^^^^^^^^^^^^^^^${data}");
    _refreshController.refreshCompleted();
    // _refreshData();
  }

  void errorUpdate(item){
    ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Row(
            children: [
              Icon(Icons.error, color: Colors.red),
              SizedBox(width: 8),
              Text(
                'Failed to update item',
                style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          backgroundColor: Colors.white,
          elevation: 6,
          behavior: SnackBarBehavior.floating,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          duration: Duration(seconds: 3),
        ));
  }



  @override
  Widget build(BuildContext context) {
    return
      RefreshIndicator(
        notificationPredicate:(notification) => false,//to stop refresh on pull down
        key: _refreshIndicatorKey,
        onRefresh: _refreshData,

       child:
         SingleChildScrollView(
           child: Container(//color: Colors.redAccent,
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

                                    ListView.builder(
                                      scrollDirection: Axis.vertical,
                                      shrinkWrap: true,
                                      itemCount: data.length,
                                      itemBuilder: (context, index) {
                                        var transactions = getTransById(data[index]);
                                        double progressVal=getProgressVal(transactions,data[index]["SpentLimit"]);
                                        return Dismissible(
                                          key: Key(data[index].toString()),
                                          background: slideRightBackground(),
                                          secondaryBackground: slideLeftBackground(),
                                          child: InkWell(
                                            onTap: () {
                                              // print("${items[index]} clicked");
                                            },
                                            child: ExpansionTile(
                                              title: GoalCard(context, data[index],progressVal),
                                              children: transactions.map((transaction) {
                                                return TransactionCard(context, transaction);
                                              }).toList(),
                                            ),
                                          ),
                                          confirmDismiss: (direction) async {
                                            if (direction == DismissDirection.endToStart) {
                                              _dismissItem(index);



                                              print("after dismiss${data}");
                                              print("@@@@@@@@@@@@");
                                            } else {

                                              // TODO: Navigate to edit page;
                                              var updateRes=await Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                    builder: (context) => EditGoal(data[index]),
                                                  ));
                                              if(updateRes){
                                                confirmUpdate(data[index]);


                                              }
                                              else{
                                                errorUpdate(data[index]);

                                              }


                                            }
                                            return false; // Return false to prevent dismissing the item
                                          },
                                        );
                                      },
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
