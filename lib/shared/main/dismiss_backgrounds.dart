import 'package:flutter/material.dart';

import '../../color.dart';

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