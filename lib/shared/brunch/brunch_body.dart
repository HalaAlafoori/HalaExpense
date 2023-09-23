import 'package:flutter/cupertino.dart';
import 'package:halaexpenses/categories/add_cat.dart';
import 'package:halaexpenses/goals/add_goals.dart';

import '../../transactions/add_trans.dart';

List pages=[
  AddTrans(),
  AddGoals(),
  AddCat(),


];
Widget MyBrunchBody(int _page){
return pages[_page];


}