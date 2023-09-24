import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import '../home/transaction_card.dart';
import 'goals_card.dart';

class MainGoals extends StatefulWidget {


  @override
  State<MainGoals> createState() => _MainGoals();
}

class _MainGoals extends State<MainGoals> {
  bool _customIcons=false;
  @override
  Widget build(BuildContext context) {
    return
      ListView(padding: EdgeInsets.symmetric(vertical: 10,horizontal: 0),

        children: [
          ExpansionTile(title:GoalCard(context),
           // trailing:_customIcons? Icon(Icons.keyboard_arrow_up_rounded):Icon(Icons.keyboard_arrow_down_rounded),

            children: [TransactionCard(context),
            TransactionCard(context),
            TransactionCard(context)],),
          ExpansionTile(title:GoalCard(context),
            // trailing:_customIcons? Icon(Icons.keyboard_arrow_up_rounded):Icon(Icons.keyboard_arrow_down_rounded),

            children: [TransactionCard(context),
              TransactionCard(context),
              TransactionCard(context)],),
          ExpansionTile(title:GoalCard(context),
            // trailing:_customIcons? Icon(Icons.keyboard_arrow_up_rounded):Icon(Icons.keyboard_arrow_down_rounded),

            children: [TransactionCard(context),
              TransactionCard(context),
              TransactionCard(context)],),



        ],
      );
  }
}
