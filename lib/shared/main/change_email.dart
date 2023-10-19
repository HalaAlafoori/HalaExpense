import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:halaexpenses/shared/brunch/email_input.dart';
import 'package:provider/provider.dart';

import '../../color.dart';
import '../../providers/login_provider.dart';

class ChangeEmailDialog extends StatefulWidget {
  final String currentEmail;
  ChangeEmailDialog(this.currentEmail);


  @override
  _ChangeEmailDialogState createState() => _ChangeEmailDialogState();
}

class _ChangeEmailDialogState extends State<ChangeEmailDialog> {
  @override
  void initState() {
    _emailController = TextEditingController(text: widget.currentEmail);
    

    super.initState();
  }
  late TextEditingController _emailController;
  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  void _saveEmail(BuildContext context) {
    final String newEmail = _emailController.text.trim();

    final loginProvider = Provider.of<LoginProvider>(context, listen: false);
    loginProvider.setEmail(newEmail);

    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return


     AlertDialog(
        title:
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 18.0,horizontal: 55),
          child: Text('Change Email',style: TextStyle(fontSize: 25),),
        ),
        content:
            EmailInput(_emailController,"New Email"),




        actions: [
         Row(mainAxisAlignment: MainAxisAlignment.spaceAround,children: [
           OutlinedButton(
             child:
             Padding(
               padding: const EdgeInsets.all(20.0),
               child: Text("Cancel",style: TextStyle(fontSize: 20,color: Colors.black)),
             ),

             style: ButtonStyle(

               shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0))),
             ),

             onPressed: () => Navigator.pop(context),
           ),

           OutlinedButton(onPressed: () => _saveEmail(context),
             child:
             Padding(
               padding: const EdgeInsets.symmetric(vertical: 20.0,horizontal: 30),
               child: Text("Add",style: TextStyle(fontSize: 20,color: Colors.black)),
             ),

             style: ButtonStyle(
               backgroundColor: MaterialStatePropertyAll(darkgreen)  ,
               shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0))),
             ),),
         ],)

        ],

      );
  }
}