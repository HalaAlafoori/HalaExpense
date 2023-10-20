import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:halaexpenses/data/db_helper.dart';

import 'package:halaexpenses/home/transaction_card.dart';
import 'package:halaexpenses/providers/theme_provider.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../brunch_page.dart';
import '../color.dart';
import '../data/repositories/transactions_repo.dart';
import '../providers/login_provider.dart';
import '../shared/main/dismiss_backgrounds.dart';
import 'package:smartrefresh/smartrefresh.dart';

import '../shared/main/floating_btn.dart';
import '../shared/main/main_app_bar.dart';
import '../transactions/edit_trans.dart';

class Total{
  Total(this.title,this.money);
  final String title;
  final double money;
}


class MainHome extends StatefulWidget {
  MainHome(this.currentBudget);
  double currentBudget;




  @override
  State<MainHome> createState() => _MainHomeState();
}

class _MainHomeState extends State<MainHome> {
  late double CurrentBudget=widget.currentBudget;
  Future<double>? _spent;
  //double spent = 0.0;
  late List<Total> _chartData;
  late TooltipBehavior _tooltipBehavior=TooltipBehavior(enable: true);
  var dir;
  var dismissedItem;
  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey =
  GlobalKey<RefreshIndicatorState>();
  final RefreshController _refreshController = RefreshController();
  Future<List<Map<String, dynamic>>?>? _data;
  late List<Map<String, dynamic>> data=[]; // Change the type to a mutable list




  @override
  void initState(){
    print("init -----------");

    //print("budget ----------- ${CurrentBudget}");


    _data = fetchData();

    super.initState();
  }



  List<Total> getChartData(spentAmount){
    final List<Total> chartData=[
      Total('total', CurrentBudget),
      Total('spent', spentAmount),

    ];
    return chartData;
  }

  // Define the spent variable
  double spent = 0.0;

// Fetch data and calculate spent
  Future<List<Map<String, dynamic>>?> fetchData() async {
    // Getting data from the database
    var res = await DbHelper().getAllTransCat();
    data.clear();
    spent = 0.0; // Reset the spent amount

    res!.forEach((item) {
      data.add(item);
      spent += item['Total'];
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

  void search(value){
    print("insearch");
    List<Map<String, dynamic>> datacopy=List.from(data);

    var res=List.from(datacopy);
    print("------------${res}");
    datacopy.clear();
    res!.forEach((item) {
      print("inloop ");
      if (item["TransName"].contains(value))
        datacopy.add(item);

    });
    setState(() {
      _data = Future.value(datacopy);
    });
    _refreshController.setFRefreshState(PullToRefreshState());
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
        content: Row(
          children: [
            Icon(
              Icons.delete,
              color: Colors.red,
            ),
            SizedBox(width: 8.0),
            Text(
              'Item dismissed',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        backgroundColor: Colors.grey.shade200,
        elevation: 6.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        behavior: SnackBarBehavior.floating,
        duration: Duration(seconds: 3),
        action: SnackBarAction(
          label: 'Undo',
          textColor: Colors.red,
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
      ),
    );




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

    return Scaffold(
      appBar: MyMainAppBar("Hala Expense",(value){
        search(value);
      }),
      floatingActionButton:MyFloatingBtn(context,()async{

          var isAdd=await Navigator.of(context).push(MaterialPageRoute(builder: (context)=> BrunchPage(0)
          ));
          if(isAdd!=null && isAdd==true){
            setState(() {
              _data = fetchData();
            });
            print("^^^^^^^^^^^^^^^^^^${data}");
            _refreshController.refreshCompleted();
          }



      }),
      body: Container(padding: EdgeInsets.all(10),//color: Colors.pink,
        child:
        SingleChildScrollView(
          child: Column(children: [
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

                    double spentAmount =  spent;
                    _chartData=getChartData(spentAmount);
                    //  var myList = List.from(list);



                    return
                      Container(
                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(30),color:ThemeProvider.getBack(context),),
                          //padding: EdgeInsets.all(25),
                          height: MediaQuery.of(context).size.height * .3,
                          child:
                          Row(
                              children: [
                                Container(
                                  // ... Your existing code with modifications ...
                                  child: Column(
                                    children: [
                                      Container(//color: Colors.pink,
                                        padding: EdgeInsets.only(top:10,bottom: 10,left: 5),

                                        height:
                                        MediaQuery.of(context).size.height * .12,
                                        child:
                                        Column(
                                          children: [
                                            Row(
                                              children: [
                                                Padding(
                                                  padding: const EdgeInsets.all(4.0),
                                                  child: Text("\$",style: TextStyle(color: darkgreen),),
                                                ),
                                                Padding(
                                                  padding: const EdgeInsets.all(4.0),
                                                  child: Text("income",style: TextStyle(color: Colors.grey),),
                                                )

                                              ],
                                            ),
                                            Container(padding: EdgeInsets.all(10),
                                              child: Text("\$ ${CurrentBudget}",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25),),
                                            )

                                          ],
                                        ),),



                                      Container(//color: Colors.pink,
                                        padding: EdgeInsets.only(top:10,bottom: 10,left: 5),

                                        height:
                                        MediaQuery.of(context).size.height * .12,
                                        child: Column(
                                          children: [
                                            Row(
                                              children: [
                                                Padding(
                                                  padding: const EdgeInsets.all(4.0),
                                                  child: Text("\$",style: TextStyle(color: darkred),),
                                                ),
                                                Padding(
                                                  padding: const EdgeInsets.all(4.0),
                                                  child: Text("spent",style: TextStyle(color: Colors.grey),),
                                                )

                                              ],
                                            ),
                                            Container(padding: EdgeInsets.all(10),
                                              child: Text("\$ ${spent}",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25),),
                                            )

                                          ],
                                        ),
                                      ),




                                    ],
                                  ),
                                ),

                                Container(//color: Colors.amber,
                                  //padding: EdgeInsets.only(top:30),
                                  child: Column(//right
                                    children: [
                                      Container(width: MediaQuery.of(context).size.width * .55,
                                          height: MediaQuery.of(context).size.height * .3,
                                          child:
                                          SfCircularChart(

                                            palette: [darkgreen,darkred],
                                            //title: ChartTitle(text: "Contienents"),
                                            //legend: Legend(isVisible: true,),
                                            tooltipBehavior: _tooltipBehavior,
                                            series: [

                                              DoughnutSeries(

                                                  dataSource: _chartData,
                                                  xValueMapper: (datum, index) => datum.title,
                                                  yValueMapper: (datum, index) => datum.money,
                                                  dataLabelSettings: DataLabelSettings(isVisible: false),
                                                  enableTooltip: true,
                                                  explode: true,

                                                  // Explode all the segments
                                                  explodeAll: true

                                              )],

                                            // ... Your existing code ...
                                          ))],
                                  ),
                                )]));
                  }
                  else{
                    return Center(child: Text("Error ${snapshot.error.toString()}"));

                  }

                }
                else{
                  return Center(child: Text("Error ${snapshot.error.toString()}"));

                }

              },),


            Container(
              padding: EdgeInsets.only(top: 10,left: 10,right: 10),
              //color: Colors.blue ,
              height: MediaQuery.of(context).size.height *.513,
              child: Column(
                children: [
                  Container(//color: Colors.lightGreen ,
                    child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children:[
                        Text("Recent treansactions",style: TextStyle(fontSize: 18,color: Colors.grey),),
                        OutlinedButton(
                          child: Text("See All >"),

                          style: ButtonStyle(
                            shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0))),
                          ),

                          onPressed: () {
                            Navigator.of(context).pushNamed("/showtrans");
                          },
                        ),],

                    ),
                  ),
                  RefreshIndicator(
                    notificationPredicate:(notification) => false,//to stop refresh on pull down
                    key: _refreshIndicatorKey,
                    onRefresh: _refreshData,
                    child: Container(//color: Colors.lime,
                      height: MediaQuery.of(context).size.height *.444 ,
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
                                          if(  updateRes && updateRes!=null ){
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

                    ),
                  )
                ],

              ),
            ),

          ],),
        ),
      ) ,
    );


  }
}


