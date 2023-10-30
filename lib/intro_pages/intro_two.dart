import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'package:halaexpenses/shared/brunch/email_input.dart';
import 'package:halaexpenses/shared/brunch/money_input.dart';

import 'package:halaexpenses/shared/brunch/title_input.dart';
import 'package:provider/provider.dart';

import '../color.dart';
import '../providers/login_provider.dart';
import '../shared/brunch/pass_input.dart';
import 'custom_elvated_btn.dart';
import 'dots.dart';

class IntroTwo extends StatelessWidget {



 // var emailCtr=TextEditingController();
  var budgetCtr=TextEditingController();
  //var passwordCtr=TextEditingController();
  var formKey=GlobalKey<FormState>();

  void _login(BuildContext context) {
    //final String email = emailCtr.text.trim();
    //final String password = passwordCtr.text.trim();

    final double budget = double.parse(budgetCtr.text.trim());

    final loginProvider = Provider.of<LoginProvider>(context, listen: false);
    loginProvider.login(budget);
    Navigator.pushNamed(context, "/main");
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
              Container(//color: Colors.teal,
                 height: MediaQuery.of(context).size.height *.75,
              child:  Column(children: [ Padding(
                padding: const EdgeInsets.symmetric(vertical: 30,horizontal: 0),
                child:
                Padding(padding:EdgeInsets.only(top: 50,bottom: 20) ,
                  child: Text(
                    'Sign up ',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: darkgreen[600],
                    ),
                  ),
                ),
              ),
                Container(
                  child:
                  Form(key: formKey,child: Column(children: [


                    MoneyInput(budgetCtr, "Current Budget"),

                    //other inputs should be included here


                  ],),



                  ),
                ),],),),
              Container(//color: Colors.blueGrey ,
                height: MediaQuery.of(context).size.height *.23,
                child:
                Column(
                  children: [
                    CustomElvatedBtn("Continue",(){

                        if(formKey.currentState!.validate()){

                          _login(context);

                        }


                    }),
                    Dots(2),],
                ),)

            ],
          ),
        ),
      ),



    );
  }
}
