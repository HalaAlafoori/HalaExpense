import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:halaexpenses/shared/brunch/reg_exp.dart';

class PassInput extends StatelessWidget {
  PassInput(this._controller,this._textLabel);
  var _controller = TextEditingController();
  final String _textLabel;

  @override
  Widget build(BuildContext context) {
    return  Container(margin: EdgeInsets.only(bottom: 10),
      padding: EdgeInsets.only(top:25,left: 20,right: 20,bottom: 10),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(30),color:Colors.grey.shade200,),




      child:



      TextFormField(

        //controller: nameCtr,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        style: TextStyle(color: Colors.green.shade900),
        controller:_controller ,
        obscureText: true,

        validator: (value){
          if(value == null)
          {return "${_textLabel} is required";}

          else{
            if(value!.length <8){return "${_textLabel} must have a minimum length of 8 characters.";}
            bool isValid = MyRegularExp.passwordRegExp.hasMatch(value);
            if (!isValid) {
              return """ ${_textLabel} must contain at least one alphabetic character\n and  one numeric digit.\n
                                    """;
            }
          }},
        decoration: InputDecoration(
          fillColor: Colors.grey.shade200,
          filled: true,
          labelText: _textLabel ,

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
