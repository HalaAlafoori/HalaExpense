import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'goals_card.dart';

class MainGoals extends StatefulWidget {


  @override
  State<MainGoals> createState() => _MainGoals();
}

class _MainGoals extends State<MainGoals> {
  @override
  Widget build(BuildContext context) {
    return
      ListView(padding: EdgeInsets.symmetric(vertical: 10,horizontal: 10),

        children: [
          GoalCard(context),
          GoalCard(context),
          GoalCard(context),


        ],
      );
  }
}
