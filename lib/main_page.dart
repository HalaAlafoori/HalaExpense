import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:halaexpenses/color.dart';
import 'package:halaexpenses/shared/app_bar.dart';
import 'package:halaexpenses/shared/drawer.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
//import 'package:syncfusion_flutter_charts/sparkcharts.dart';
class MainPage extends StatefulWidget {



  @override
  State<MainPage> createState() => _MainPageState();
}
class Total{
  Total(this.title,this.money);
  final String title;
  final int money;
}
class _MainPageState extends State<MainPage> {
  var income=3200;
  var spent=3220;



  int _currentIndex=0;
  late List<Total> _chartData;
  late TooltipBehavior _tooltipBehavior;

  List<Total> getChartData(){
    final List<Total> chartData=[
      Total('total', income+spent),
      Total('spent', spent),



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
    return  Scaffold(
  appBar: MyAppBar("Home"),


      drawer: MyDrawer(),
      body:
          Container(padding: EdgeInsets.all(10),//color: Colors.pink,
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
                                child: Text("\$ ${income}",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25),),
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

                            onPressed: () {},
                          ),],

                      ),
                    ),
                    Container(//color: Colors.lime,
                      height: MediaQuery.of(context).size.height *.415 ,
                      child:
                      ListView(
                        children: [
                          Container(//color: Colors.yellowAccent,
                            height: MediaQuery.of(context).size.height *.12 ,


                            padding: EdgeInsets.symmetric(vertical: 15,horizontal: 5),
                            child: ListTile(
                              leading: Container(
                                  padding: EdgeInsets.all(14),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color:darkgreen,
                                  ),
                                  child: Icon(Icons.coffee,size: 30,)),
                              title: Container(margin: EdgeInsets.only(left: 20),//color: Colors.redAccent,
                                child: Text("Food"),
                              ),
                              subtitle: Container(margin: EdgeInsets.only(left: 20),//color: Colors.indigoAccent,
                                child: Text("Lunch"),
                              ),
                              trailing:
                              Container(
                                //color: Colors.pinkAccent,
                                  padding: EdgeInsets.symmetric(vertical: 10)
                                  ,child: Column(crossAxisAlignment: CrossAxisAlignment.end,children: [Text("\$200"),Text("Mon 06,2023",style: TextStyle(color: Colors.grey),),],))

                            ),
                          ),


                        ],
                      ) ,
                    )
                  ],

                ),
              ),

            ],),
          ),
    floatingActionButton:
    FloatingActionButton(
      child: Icon(Icons.add,size: 34),
      shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(15),

    ), onPressed: () {  }, ),
      bottomNavigationBar: BottomNavigationBar(
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: true,
        showSelectedLabels: true,
        // backgroundColor: Colors.blueGrey,
        onTap: (i){
          _currentIndex=i;
          setState(() {

          });
        },
        currentIndex: _currentIndex,
        items: [
          BottomNavigationBarItem(

            tooltip: "This is the home button",
            icon:Icon(Icons.home),
            label:'Home',

          ),

          BottomNavigationBarItem(
              icon:Icon(Icons.bar_chart),
              label:'Sacle'
          ),
          BottomNavigationBarItem(
              icon:Icon(Icons.list_rounded),
              label:'Categories'
          ),
        ],),


    );
  }
}
