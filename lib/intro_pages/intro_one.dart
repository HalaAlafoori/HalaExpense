import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../color.dart';
import 'custom_elvated_btn.dart';
import 'dots.dart';

//stateless--> without any internal state management
class IntroOne extends StatelessWidget {
  const IntroOne({Key? key}) : super(key: key);

  Widget _buildDescriptionText() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15.0),
      child: Text(
        'Track your expenses and manage your finances with ease. Stay organized and take control of your spending.',
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 15,
          color: darkgreen[600],
        ),
      ),
    );
  }

  Widget _buildWelcomeText() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 70),
      child: Text(
        'Welcome to Hala Expense',
        style: TextStyle(
          fontSize: 26,
          fontWeight: FontWeight.bold,
          color: darkgreen[600],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Container(

        height: MediaQuery.of(context).size.height,
        padding: EdgeInsets.symmetric(horizontal: 26.0),
        width:MediaQuery.of(context).size.width ,
        child: 
        SingleChildScrollView(
          child: Column(
            children: [
              Container(
                 height: MediaQuery.of(context).size.height *.75,
              child:
              Column(children: [
                _buildWelcomeText(),
                _buildDescriptionText(),
                Semantics(label: 'App intro logo',
                  child: SvgPicture.asset(
                    'assets/images/pic.svg',
                    //semanticsLabel: 'My SVG Image',
                    height: (MediaQuery.of(context).size.height)* .3,
                    width: MediaQuery.of(context).size.width,
                  ),
                ),



              ],),),
              Container(//color: Colors.blueGrey ,
                height: MediaQuery.of(context).size.height *.23,
                child:
                Column(
                  children: [
                    CustomElvatedBtn("Get Started",(){
                      Navigator.pushNamed(context, "/intro2");
                    }),
                    Dots(1),
                  ],
                ),)

            ],
          ),
        ),
      ),



    );
  }
}

