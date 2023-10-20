import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:halaexpenses/providers/login_provider.dart';

import 'package:halaexpenses/shared/main/buttom_nav.dart';
import 'package:halaexpenses/shared/main/floating_btn.dart';
import 'package:halaexpenses/shared/main/main_app_bar.dart';

import 'package:halaexpenses/shared/main/main_body.dart';
import 'package:provider/provider.dart';

class MainPage extends StatefulWidget {



  @override
  State<MainPage> createState() => _MainPageState();
}


class _MainPageState extends State<MainPage> {

  //var income=3200;

  var spent=3220;




  int _currentIndex=0;

  @override
  Widget build(BuildContext context) {

    return  Scaffold(
  appBar: MyMainAppBar(context,"Hala Expense"),



      body:MyMainBody(_currentIndex),




      bottomNavigationBar: MyButtomNav(_currentIndex,(i){
        _currentIndex=i;
        setState(() {

        });
      })



    );
  }
}
