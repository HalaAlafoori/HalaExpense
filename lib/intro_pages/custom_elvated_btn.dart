import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomElvatedBtn extends StatelessWidget {
  CustomElvatedBtn(this.text,this.onPressed);
  String text;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return   Padding(
      padding: const EdgeInsets.only(bottom: 40.0),
      child: ElevatedButton(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Text(
            text,
            style: TextStyle(fontSize: 20, color: Colors.black),
          ),
        ),
        style: ElevatedButton.styleFrom(
          //  primary: darkgreen,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30.0),
          ),
          elevation: 5, // Add elevation
          shadowColor: Colors.black, // Add shadow color
        ),
        onPressed: onPressed,
      ),
    );
  }
}
