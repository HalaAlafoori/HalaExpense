import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:halaexpenses/brunch_page.dart';

Widget MyFloatingBtn(context,onPress){

  return  FloatingActionButton(
    child: Icon(Icons.add,size: 34),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(15),

    ), onPressed: onPress, );
}