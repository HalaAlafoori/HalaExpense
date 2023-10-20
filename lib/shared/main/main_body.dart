import 'package:flutter/cupertino.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import '../../categories/main_categories.dart';
import '../../goals/main_goals.dart';
import '../../home/main_home.dart';
import '../../providers/login_provider.dart';


class MyMainBody extends StatelessWidget {
  MyMainBody(this._currentIndex);
  int _currentIndex;

  @override
  Widget build(BuildContext context) {
    final loginProvider = Provider.of<LoginProvider>(context);
    late double CurrentBudget = loginProvider.budget;
    List pages=[
      MainHome(CurrentBudget),
      MainGoals(),
      MainCategories(),

    ];

    return pages[_currentIndex];

  }
}




