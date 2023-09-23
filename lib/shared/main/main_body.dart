import 'package:flutter/cupertino.dart';

import '../../categories/main_categories.dart';
import '../../goals/main_goals.dart';
import '../../home/main_home.dart';

List pages=[
  MainHome(3200,2100),
  MainGoals(),
  MainCategories(),

];
Widget MyMainBody( int _currentIndex){
  return pages[_currentIndex];
}