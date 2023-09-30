import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../color.dart';
import 'three_dots.dart';

class IntroOne extends StatelessWidget {
  const IntroOne({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Container(

        height: MediaQuery.of(context).size.height,
        padding: EdgeInsets.all(26.0),
        width:MediaQuery.of(context).size.width ,
        child: Column(
          children: [
            Container(
               height: MediaQuery.of(context).size.height *.7,
            child:
            Column(children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 70),
                child: Text(
                  'Welcome to Hala Expense',
                  style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                    color:darkgreen[600],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 15.0),
                child: Text(
                  'Track your expenses and manage your finances with ease. Stay organized and take control of your spending.',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 15,
                    color: darkgreen[600],
                  ),
                ),
              ),
              SvgPicture.asset(
                'assets/images/pic.svg',
                //semanticsLabel: 'My SVG Image',
                height: (MediaQuery.of(context).size.height)* .3,
                width: MediaQuery.of(context).size.width,
              ),



            ],),),
            Container(//color: Colors.blueGrey ,
               height: MediaQuery.of(context).size.height *.23,
            child:
              Column(
                children: [
                  Padding(
                  padding: const EdgeInsets.all(50.0),
                  child:
                  OutlinedButton(
                    child:
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Text("Continue",style: TextStyle(fontSize: 20,color: Colors.black)),
                    ),

                    style: ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(darkgreen)  ,
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0))),
                    ),

                    onPressed: () {

                        Navigator.pushReplacementNamed(context, "/intro2");

                    },
                  ),
                ),
                  threeDots(1),],
              ),)

          ],
        ),
      ),



    );
  }
}
