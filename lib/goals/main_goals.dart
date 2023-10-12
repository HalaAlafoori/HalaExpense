import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import '../home/transaction_card.dart';
import '../shared/main/dismiss_backgrounds.dart';
import 'goals_card.dart';

class MainGoals extends StatefulWidget {


  @override
  State<MainGoals> createState() => _MainGoals();
}

class _MainGoals extends State<MainGoals> {
  final List<String> items=new List<String>.generate(10, (index) => "items ${index+1}");
  var dir;
  var dismissedItem;
  bool _customIcons=false;
  @override
  Widget build(BuildContext context) {
    return Text("fix card");

          // ListView.builder(itemBuilder:(context, index,null){
          //   return
          //     Dismissible(
          //       background: slideRightBackground(),
          //       secondaryBackground: slideLeftBackground(),
          //       key: Key(items[index]),
          //       child: InkWell(
          //           onTap: () {
          //             print("${items[index]} clicked");
          //           },
          //           child:   ExpansionTile(title:GoalCard(context,index),
          //             // trailing:_customIcons? Icon(Icons.keyboard_arrow_up_rounded):Icon(Icons.keyboard_arrow_down_rounded),
          //
          //             children: [TransactionCard(context,index),
          //               TransactionCard(context,index),
          //               TransactionCard(context,index)],),
          //
          //       ),
          //       confirmDismiss: (direction) async {
          //         if (direction == DismissDirection.endToStart) {
          //           setState(() {
          //             dismissedItem=items[index];
          //             items.removeAt(index);
          //             ScaffoldMessenger.of(context).showSnackBar(
          //                 SnackBar(
          //                   content: Text('item dismissed'),
          //                   duration: Duration(seconds: 2),
          //
          //                   action: SnackBarAction(
          //                     label: 'Undo',
          //                     onPressed: () {
          //                       setState(() {
          //                         items.insert(index, dismissedItem!);
          //                         dismissedItem = null;
          //                       });
          //                     },
          //                   ),
          //                 ));
          //           });
          //         } else {
          //           // TODO: Navigate to edit page;
          //         }
          //       },
          //
          //     );
          //
          //
          // } ,
          //   itemCount:items.length ,
          // );





  }
}
