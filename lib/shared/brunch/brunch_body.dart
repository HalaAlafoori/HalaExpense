import 'package:flutter/cupertino.dart';
import 'package:halaexpenses/categories/add_cat.dart';
import 'package:halaexpenses/goals/add_goals.dart';
import 'package:halaexpenses/profile/settings.dart';

import '../../data/repositories/category_repo.dart';
import '../../transactions/add_trans.dart';

List pages=[
  AddTrans(),
  AddGoals(),
  AddCat(),
  Settings(),


];
Widget MyBrunchBody(int _page){
return pages[_page];


}