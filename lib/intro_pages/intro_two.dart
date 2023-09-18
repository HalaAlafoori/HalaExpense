import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';

class IntroTwo extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Container(color: Colors.red,
        height: MediaQuery.of(context).size.height,
        padding: EdgeInsets.all(26.0),
        width:MediaQuery.of(context).size.width ,
        child: Column(
          children: [
            Container(color: Colors.teal,height: MediaQuery.of(context).size.height *.7,),
            Container(color: Colors.blueGrey ,height: MediaQuery.of(context).size.height *.23)

          ],
        ),
      ),



    );
  }
}
