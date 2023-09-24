import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:halaexpenses/home/transaction_card.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
//import 'package:syncfusion_flutter_charts/sparkcharts.dart';

import '../color.dart';
class Total{
  Total(this.title,this.money);
  final String title;
  final double money;
}
Widget slideRightBackground() {
  return Container(
    color: Colors.grey.shade200,
    child: Align(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          SizedBox(
            width: 20,
          ),
          Icon(
            Icons.edit,
            color: darkgreen,
          ),
          Text(
            " Edit",
            style: TextStyle(
              color: darkgreen,
              fontWeight: FontWeight.w700,
            ),
            textAlign: TextAlign.left,
          ),
        ],
      ),
      alignment: Alignment.centerLeft,
    ),
  );
}
Widget slideLeftBackground() {
  return Container(
    color: Colors.grey.shade200,
    child: Align(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Icon(
            Icons.delete,
            color: darkred,
          ),
          Text(
            " Delete",
            style: TextStyle(
              color: darkred,
              fontWeight: FontWeight.w700,
            ),
            textAlign: TextAlign.right,
          ),
          SizedBox(
            width: 20,
          ),
        ],
      ),
      alignment: Alignment.centerRight,
    ),
  );
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
  late TooltipBehavior _tooltipBehavior;
  final List<String> items=new List<String>.generate(10, (index) => "items ${index+1}");
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
    _tooltipBehavior=TooltipBehavior(enable: true);
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
          padding: EdgeInsets.all(10),
          // color: Colors.blue ,
          height: MediaQuery.of(context).size.height *.5,
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
                height: MediaQuery.of(context).size.height *.415 ,
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
                        child: TransactionCard(context)),
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
              )
            ],

          ),
        ),

      ],),
    );
  }
}


