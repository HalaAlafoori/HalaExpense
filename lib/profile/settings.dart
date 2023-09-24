import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:halaexpenses/color.dart';
import 'package:halaexpenses/shared/brunch/money_input.dart';
import 'package:halaexpenses/shared/brunch/reg_exp.dart';
import 'package:halaexpenses/shared/main/main_app_bar.dart';

import '../categories/icons.dart';
import '../shared/brunch/email_input.dart';
import '../shared/brunch/title_input.dart';



class Settings extends StatefulWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  State<Settings> createState() => _Settings();
}


class _Settings extends State<Settings> {




  var formKey=GlobalKey<FormState>();
  var nameCon=TextEditingController();
  var emailCon=TextEditingController();








  @override
  Widget build(BuildContext context) {
    return
      SingleChildScrollView(
        physics: NeverScrollableScrollPhysics(),
        child:
        Container(//color: Colors.indigoAccent,
          padding: EdgeInsets.all(20),child:
        Form(
          key: formKey,
          child:


          Column(children: [

            Container(//color: Colors.redAccent,
              height: MediaQuery.of(context).size.height *.77,
              child:
              Column(children: [

                TitleInput(nameCon,"Name"),

                EmailInput(emailCon,"Email"),

                Container(//color: Colors.yellow,

                  margin: EdgeInsets.only(top:70),

                  width: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.only(right: 120),
                  child:
                  OutlinedButton(
                    child:
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Text("Change Password",style: TextStyle(fontSize: 20,color: Colors.black)),
                    ),

                    style: ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(darkred)  ,
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0))),
                    ),

                    onPressed: () {
                      if(formKey.currentState!.validate()){
                        Navigator.pushNamed(context, "/");
                      }
                    },
                  ),
                ),




              ],),
            ),


            Container(//color: Colors.blue,
              height: MediaQuery.of(context).size.height *.1,
              child: Row(
                children: [

                  Container(

                    width: MediaQuery.of(context).size.width*.45,
                    padding: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                    child:
                    OutlinedButton(
                      child:
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Text("Cancel",style: TextStyle(fontSize: 20,color: Colors.black)),
                      ),

                      style: ButtonStyle(

                        shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0))),
                      ),

                      onPressed: () {
                        Navigator.pushNamed(context, "/");
                      },
                    ),
                  ),
                  Container(

                    width: MediaQuery.of(context).size.width*.45,
                    padding: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                    child:
                    OutlinedButton(
                      child:
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Text("Save",style: TextStyle(fontSize: 20,color: Colors.black)),
                      ),

                      style: ButtonStyle(
                        backgroundColor: MaterialStatePropertyAll(darkgreen)  ,
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0))),
                      ),

                      onPressed: () {
                        if(formKey.currentState!.validate()){
                          Navigator.pushNamed(context, "/");
                        }
                      },
                    ),
                  ),
                ],
              ),
            )




          ],),
        ),
        ),

      );
  }
}
