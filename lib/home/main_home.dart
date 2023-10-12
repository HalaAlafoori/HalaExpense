import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:halaexpenses/data/db_helper.dart';
import 'package:halaexpenses/data/repositories/category_repo.dart';
import 'package:halaexpenses/home/transaction_card.dart';
import 'package:halaexpenses/models/transaction_model.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../color.dart';
import '../data/repositories/transactions_repo.dart';
import '../shared/main/dismiss_backgrounds.dart';
class Total{
  Total(this.title,this.money);
  final String title;
  final double money;
}


class MainHome extends StatefulWidget {
  final double income;
  final double spent;
  MainHome(this.income,this.spent);


  @override
  State<MainHome> createState() => _MainHomeState();
}

class _MainHomeState extends State<MainHome> {
  late List<Total> _chartData;
  late TooltipBehavior _tooltipBehavior=TooltipBehavior(enable: true);
  // List<String> items=new List<String>.generate(10, (index) => "items ${index+1}");
var dir;
  var dismissedItem;

  List<Total> getChartData(){
    final List<Total> chartData=[
      Total('total', widget.income+widget.spent),
      Total('spent', widget.spent),



    ];
    return chartData;
  }

  @override
  void initState(){
    _chartData=getChartData();
    DbHelper().deleteDatabase();
    //_tooltipBehavior=TooltipBehavior(enable: true);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return  Container(padding: EdgeInsets.all(10),//color: Colors.pink,
      child: Column(children: [
        Container(
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(30),color:Colors.blueGrey.shade50,),
          //padding: EdgeInsets.all(25),
          height: MediaQuery.of(context).size.height * .3,
          child: Row(children: [
            Container(//color: Colors.teal,
              padding: EdgeInsets.symmetric(vertical: 21),
              width: MediaQuery.of(context).size.width * .4,


              child: Column(//left
                children: [
                  Container(//color: Colors.cyanAccent,
                    padding: EdgeInsets.only(top:10,bottom: 10,left: 5),

                    height:
                    MediaQuery.of(context).size.height * .12,
                    child: Column(
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
                          child: Text("\$ ${widget.income}",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25),),
                        )

                      ],
                    ),
                  ),
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
                          child: Text("\$ ${widget.spent}",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25),),
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


                    ),
                  ),

                ],
              ),
            )
          ],),
        ),


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
              Container(//color: Colors.lime,
                height: MediaQuery.of(context).size.height *.444 ,
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
                        return

                          ListView.builder(itemBuilder:(context, index){
                            return
                              Dismissible(
                                background: slideRightBackground(),
                                secondaryBackground: slideLeftBackground(),
                                key: Key(list[index].toString()),
                                child: InkWell(
                                    onTap: () {
                                     // print("${items[index]} clicked");
                                    },
                                    child: TransactionCard(context,list[index])),
                                //onDismissed always dismiss or returns an error

                                confirmDismiss: (direction) async {
                                  //async--> Future return value: true or false
                                  //true--> dismissed
                                  //makes the card undragable while confirm(if there is )
                                  //false--> draged back
                                  if (direction == DismissDirection.endToStart) {
                                    setState(() {
                                      dismissedItem=list[index];
                                      print(dismissedItem);
                                      TransactionRepository().deleteFromDb(dismissedItem['TransId']);
                                     //list.removeAt(index);
                                      ScaffoldMessenger.of(context).showSnackBar(
                                          SnackBar(
                                            content: Text('item dismissed'),
                                            duration: Duration(seconds: 2),

                                            action: SnackBarAction(
                                              label: 'Undo',
                                              onPressed: () {
                                                setState(() {
                                                  var data={
                                                    "TransId":dismissedItem['TransId'],

                                                    "TransName":dismissedItem['TransName'],
                                                    "CatId":dismissedItem['CatId'],
                                                    "Total":(dismissedItem['Total']),

                                                    // "TransDate":formatDate(DateFormat('hh:mm:ss').format(DateTime.now()));
                                                    "TransDate":dismissedItem['TransDate']

                                                  };
                                                  print(data);
                                                  var addRes= TransactionRepository().addToDb(TransactionModel.fromJson(data));

                                                  //  items.insert(index, dismissedItem!);
                                                  dismissedItem = null;
                                                });
                                              },
                                            ),
                                          )
                                      );
                                    });
                                  } else {
                                    // TODO: Navigate to edit page;
                                  }
                                },

                              );


                          } ,
                            itemCount:list.length ,
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

              )
            ],

          ),
        ),

      ],),
    );
  }
}


