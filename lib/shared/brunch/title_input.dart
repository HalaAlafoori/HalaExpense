import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:halaexpenses/shared/brunch/reg_exp.dart';

import '../../providers/theme_provider.dart';

class TitleInput extends StatelessWidget {
  TitleInput(this._controller,this._textLabel);
  var _controller ;

  final String _textLabel;

  @override
  Widget build(BuildContext context) {
    return  Container(margin: EdgeInsets.only(bottom: 10),
      padding: EdgeInsets.only(top:25,left: 20,right: 20,bottom: 10),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(30),color:ThemeProvider.getBack(context),),




      child:



      TextFormField(

        //controller: nameCtr,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        style: TextStyle(color:ThemeProvider.getLabel(context)),
        controller:_controller ,

        validator: (value){
          if(value == "")
          {return "${_textLabel} is required";}

          else{
            if(value!.length <3){return "${_textLabel}  must be longer that 3 chars";}
            bool isValid = MyRegularExp.alphanumRegExp.hasMatch(value);
            if (!isValid) {
              return "${_textLabel}  must only contains letter and numbers";
            }
          }},
        decoration: InputDecoration(
          fillColor: ThemeProvider.getBack(context),
          filled: true,
          labelText: _textLabel ,

          labelStyle: TextStyle(color:ThemeProvider.getLabel(context)),
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
