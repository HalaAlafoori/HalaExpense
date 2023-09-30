import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'package:halaexpenses/shared/brunch/email_input.dart';
import 'package:halaexpenses/shared/brunch/money_input.dart';

import 'package:halaexpenses/shared/brunch/title_input.dart';

import '../color.dart';
import '../shared/brunch/pass_input.dart';
import 'three_dots.dart';

class IntroTwo extends StatelessWidget {


  var nameCtr=TextEditingController();
  var emailCtr=TextEditingController();
  var budgetCtr=TextEditingController();
  var passwordCtr=TextEditingController();
  var formKey=GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        padding: EdgeInsets.all(26.0),
        width:MediaQuery.of(context).size.width ,
        child: 
        SingleChildScrollView(
          child: Column(
            children: [
              Container(//color: Colors.teal,
                 height: MediaQuery.of(context).size.height *.8,
              child:  Column(children: [ Padding(
                padding: const EdgeInsets.symmetric(vertical: 30),
                child: Text(
                  'Sign up ',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: darkgreen[600],
                  ),
                ),
              ),
                Container(
                  child: Form(key: formKey,child: Column(children: [

                   TitleInput(nameCtr, "Name"),
                    EmailInput(emailCtr, "Email"),
                    MoneyInput(budgetCtr, "Current Budget"),
                    PassInput(passwordCtr,"Password"),




                  ],),



                  ),
                ),],),),
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
    if(formKey.currentState!.validate()){

                          Navigator.pushReplacementNamed(context, "/intro3");}

                        },
                      ),
                    ),
                    threeDots(2),],
                ),)

            ],
          ),
        ),
      ),



    );
  }
}
