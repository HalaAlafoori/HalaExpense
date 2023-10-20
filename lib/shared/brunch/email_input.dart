import 'package:flutter/material.dart';
import 'package:halaexpenses/shared/brunch/reg_exp.dart';

import '../../providers/theme_provider.dart';
class EmailInput extends StatelessWidget {



  EmailInput(this._controller,this._textLabel);
  var _controller;
  String _textLabel;
  @override
  Widget build(BuildContext context) {
    return Container(margin: EdgeInsets.only(bottom: 10),
      padding: EdgeInsets.only(top:25,left: 20,right: 20,bottom: 10),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(30),color:ThemeProvider.getBack(context),),




      child:



      TextFormField(
        keyboardType: TextInputType.emailAddress,
        controller: _controller,
        //controller: nameCtr,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        style: TextStyle(color: Colors.green.shade900),


        validator: (value){
          if(value == "")
          {return "${_textLabel} is required";}

          else{

            bool isValid = MyRegularExp.emailRegExp.hasMatch(value!);
            if (!isValid) {
              return "${_textLabel} must be in a correct format";
            }
          }},
        decoration: InputDecoration(
          fillColor: ThemeProvider.getBack(context),
          filled: true,
          labelText: "${_textLabel}" ,

          labelStyle: TextStyle(color: Colors.black),
          focusedBorder:UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.grey.shade200),
            borderRadius: BorderRadius.circular(23.0),
          ),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.grey.shade200),
            borderRadius: BorderRadius.circular(23.0),
          ),
        ),
      ),


    );
  }
}
