import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
class MyButtomNav extends StatelessWidget {
  MyButtomNav(this._currentIndex,this.onTap);


  int _currentIndex;
  Function(int)? onTap;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      unselectedItemColor: Colors.grey,
      showUnselectedLabels: true,
      showSelectedLabels: true,
      // backgroundColor: Colors.blueGrey,
      onTap: onTap,
      currentIndex: _currentIndex,
      items: [
        BottomNavigationBarItem(

          tooltip: "This is the home button",
          icon:Icon(Icons.home),
          label:'Home',


        ),

        BottomNavigationBarItem(
            icon:Icon(Icons.bar_chart),
            label:'Goals'
        ),
        BottomNavigationBarItem(
            icon:Icon(Icons.list_rounded),
            label:'Categories'
        ),
      ],);
  }
}
