import 'package:flutter/material.dart';

import 'package:halaexpenses/data/repositories/transactions_repo.dart';
import 'package:halaexpenses/transactions/edit_trans.dart';

import '../data/db_helper.dart';
import '../home/transaction_card.dart';

import '../shared/main/dismiss_backgrounds.dart';
import '../shared/main/main_app_bar.dart';
import 'package:smartrefresh/smartrefresh.dart';



class ShowAllTrans extends StatefulWidget {
  const ShowAllTrans({Key? key}) : super(key: key);

  @override
  State<ShowAllTrans> createState() => _ShowAllTransState();

}

class _ShowAllTransState extends State<ShowAllTrans> {
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
    var res=await DbHelper().getAllTransCat();
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


  Future<void> _dismissItem(int index) async {

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
    await Future.delayed(Duration(seconds: 3));

    // Call your method after the Snackbar is hidden
  if(!undo)
    TransactionRepository().deleteFromDb(removedItem['TransId']);


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
                                  Dismissible(
                                    background: slideRightBackground(),
                                    secondaryBackground: slideLeftBackground(),
                                    key: Key(data![index].toString()),
                                    child: InkWell(
                                        onTap: () {
                                          // print("${items[index]} clicked");
                                        },
                                        child: TransactionCard(context,data[index])),
                                    //onDismissed always dismiss or returns an error

                                    confirmDismiss: (direction) async {
                                      //async--> Future return value: true or false
                                      //true--> dismissed
                                      //makes the card undragable while confirm(if there is )
                                      //false--> draged back
                                      if (direction == DismissDirection.endToStart) {

                                        _dismissItem(index);





                                          print("after dismiss${data}");
                                          print("@@@@@@@@@@@@");



                                      } else {
                                        // TODO: Navigate to edit page;
                                       var updateRes=await Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) => EditTrans(data[index]),
                                            ));
                                       if(updateRes){
                                         confirmUpdate(data[index]);


                                       }
                                       else{
                                         errorUpdate(data[index]);

                                       }
                                      }
                                    },

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
        ) ,
    ),
      );
  }
}
