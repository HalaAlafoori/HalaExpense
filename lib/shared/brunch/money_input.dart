import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'reg_exp.dart';
class MoneyInput extends StatelessWidget {
  MoneyInput(this._controller,this._textLabel);
  var _controller = TextEditingController();
  final String _textLabel;
  @override
  Widget build(BuildContext context) {
    return  Container(
      margin: EdgeInsets.only(bottom: 10),
      padding: EdgeInsets.only(top:25,left: 20,right: 20,bottom: 10),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(30),color:Colors.grey.shade200,),




      child:



      TextFormField(

        controller: _controller,
        keyboardType: TextInputType.numberWithOptions(),
        autovalidateMode: AutovalidateMode.onUserInteraction,
        style: TextStyle(color: Colors.green.shade900),

        validator: (value){
          if(value == "")
          {return "${_textLabel} is required";}

          else{

            bool isValid = MyRegularExp.priceRegExp.hasMatch(value!);
            if (!isValid) {
              return "${_textLabel} is not in a correct format";
            }
          }},
        decoration: InputDecoration(
          fillColor: Colors.grey.shade200,
          filled: true,
          labelText: _textLabel,

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
