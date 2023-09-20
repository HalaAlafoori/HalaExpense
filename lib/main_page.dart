import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:halaexpenses/color.dart';
import 'package:halaexpenses/home/main_home.dart';
import 'package:halaexpenses/home/transaction_card.dart';
import 'package:halaexpenses/shared/app_bar.dart';
import 'package:halaexpenses/shared/drawer.dart';
import 'package:halaexpenses/shared/total.dart';

class MainPage extends StatefulWidget {



  @override
  State<MainPage> createState() => _MainPageState();
}


class _MainPageState extends State<MainPage> {
  var income=3200;
  var spent=3220;
  List pages=[
    MainHome(3200,2100),
  ];



  int _currentIndex=0;

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
  appBar: MyAppBar("Home"),


      drawer: MyDrawer(),
      body:pages[_currentIndex],

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
