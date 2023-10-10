import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:halaexpenses/brunch_page.dart';

Widget MyFloatingBtn(context,_currentIndex){
  int page=_currentIndex;
  return  FloatingActionButton(
    child: Icon(Icons.add,size: 34),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(15),

    ), onPressed: () async{
  Navigator.of(context).push(MaterialPageRoute(builder: (context){

     return BrunchPage(page);
   }));

  }, );
}