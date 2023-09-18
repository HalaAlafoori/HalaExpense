import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';

class IntroTwo extends StatelessWidget {
  RegExp nameRegExp = RegExp(r'^[a-zA-Z]');
  RegExp emailRegExp = RegExp(r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$');
  RegExp budgetRegExp = RegExp(r'^\d+(\.\d{1,2})?$');
  RegExp passwordRegExp = RegExp(r'^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$');
  var nameCtr=TextEditingController();
  var emailCtr=TextEditingController();
  var budgetCtr=TextEditingController();
  var passwordCtr=TextEditingController();
  var formKey=GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Container(color:  Color.fromRGBO(86, 161, 82, 0.2),
        height: MediaQuery.of(context).size.height,
        padding: EdgeInsets.all(26.0),
        width:MediaQuery.of(context).size.width ,
        child: 
        SingleChildScrollView(
          child: Column(
            children: [
              Container(//color: Colors.teal,
                 height: MediaQuery.of(context).size.height *.7,
              child:  Column(children: [ Padding(
                padding: const EdgeInsets.symmetric(vertical: 50),
                child: Text(
                  'Sign up ',
                  style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                    color: Colors.green.shade900,
                  ),
                ),
              ),
                Container(
                  child: Form(key: formKey,child: Column(children: [

                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        controller: nameCtr,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        style: TextStyle(color: Colors.green.shade900),
                        validator: (value){
                          if(value == "")
                          {return "name is required";}

                          else{
                            if(value!.length <3){return "name must be longer that 3 chars";}
                            bool isValid = nameRegExp.hasMatch(value);
                            if (!isValid) {
                              return "name must only contains letter";
                            }
                          }},
                        decoration: InputDecoration(
                          labelText: 'Name',
                          labelStyle: TextStyle(color: Colors.green.shade900),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.green.shade900),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.green.shade900),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        controller: emailCtr,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        style: TextStyle(color: Colors.green.shade900),
                        validator: (value){
                          if(value == "")
                          {return "email is required";}

                          else{

                            bool isValid = emailRegExp.hasMatch(value!);
                            if (!isValid) {
                              return "email must be in a correct format";
                            }
                          }},
                        decoration: InputDecoration(
                          labelText: 'Email',
                          labelStyle: TextStyle(color: Colors.green.shade900),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.green.shade900),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.green.shade900),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        controller: budgetCtr,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        style: TextStyle(color: Colors.green.shade900),
                        validator: (value){
                          if(value == "")
                          {return "budget is required";}

                          else{

                            bool isValid = budgetRegExp.hasMatch(value!);
                            if (!isValid) {
                              return "budget is not in a correct format";
                            }
                          }},
                        decoration: InputDecoration(
                          labelText: 'Budget',
                          labelStyle: TextStyle(color: Colors.green.shade900),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.green.shade900),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.green.shade900),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        controller: passwordCtr,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        style: TextStyle(color: Colors.green.shade900),
                        validator: (value){
                          if(value == null)
                          {return "password is required";}

                          else{
                            if(value!.length <8){return "password must have a minimum length of 8 characters.";}
                            bool isValid = passwordRegExp.hasMatch(value);
                            if (!isValid) {
                              return """ Password must contain at least one alphabetic character\n and  one numeric digit.\n
                                    """;
                            }
                          }},
                        decoration: InputDecoration(
                          labelText: 'Password',
                          labelStyle: TextStyle(color: Colors.green.shade900),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.green.shade900),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.green.shade900),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        ),
                      ),
                    ),




                  ],),



                  ),
                ),],),),
              Container(//color: Colors.blueGrey ,
                 height: MediaQuery.of(context).size.height *.23,
              child:   Column(
                children: [ Padding(
                  padding: const EdgeInsets.all(50.0),
                  child: ElevatedButton(

                    onPressed: () {
    if(formKey.currentState!.validate()){
                      Navigator.of(context).pushReplacementNamed('/intro3');}
                    },
                    child: Text('Continue',style: TextStyle(fontSize: 24,fontWeight: FontWeight.w600)),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.white,
                      onPrimary: Colors.green.shade800,
                    ),
                  ),
                ),
                  Row(mainAxisAlignment: MainAxisAlignment.center,children: [

                    Icon(Icons.circle,color: Colors.white,),
                    SizedBox(width: 16),
                    Icon(Icons.circle,color: Colors.green,),
                    SizedBox(width: 16),
                    Icon(Icons.circle,color: Colors.white,),

                  ],),],
              ),)

            ],
          ),
        ),
      ),



    );
  }
}
