import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';

class IntroOne extends StatelessWidget {
  const IntroOne({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Container(color:  Color.fromRGBO(86, 161, 82, 0.2),
        height: MediaQuery.of(context).size.height,
        padding: EdgeInsets.all(26.0),
        width:MediaQuery.of(context).size.width ,
        child: Column(
          children: [
            Container(//color: Colors.teal,
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
                    color: Colors.green.shade900,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 15.0),
                child: Text(
                  'Track your expenses and manage your finances with ease. Stay organized and take control of your spending.',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 15,
                    color: Colors.green.shade900,
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
                children: [ Padding(
                  padding: const EdgeInsets.all(50.0),
                  child: ElevatedButton(

                    onPressed: () {
                      Navigator.of(context).pushReplacementNamed('/intro2');
                    },
                    child: Text('Continue',style: TextStyle(fontSize: 24,fontWeight: FontWeight.w600,color: Colors.green.shade900)),

                  ),
                ),
                  Row(mainAxisAlignment: MainAxisAlignment.center,children: [

                    Icon(Icons.circle,color: Colors.green,),
                    SizedBox(width: 16),
                    Icon(Icons.circle,color: Colors.white,),
                    SizedBox(width: 16),
                    Icon(Icons.circle,color: Colors.white,),

                  ],),],
              ),)

          ],
        ),
      ),



    );
  }
}
