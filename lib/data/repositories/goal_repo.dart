
import 'package:flutter/foundation.dart';

import '../../models/category_model.dart';
import '../../models/goal_model.dart';
import '../db_helper.dart';

class GoalRepository{
  Future<List<GoalModel>> getAll()async{

    try{
      // await Future.delayed(Duration(milliseconds: 300));
      var res = await DbHelper().getAll(DbTables.Goal);

      List<GoalModel> items = [];
      print("[[[[[[[[[[${res}");

      if(res != null){
        print("object");
        for (var e in res) {

          items.add(GoalModel.fromJson(e));
          print("loop");
        }

        return items;
      }


      return items;
    }
    catch(ex){
      print("null");
      rethrow;
    }
  }

  Future<bool> addToDb(GoalModel obj)async{
    try{
      await Future.delayed(Duration(milliseconds: 300));
      var addRes = await DbHelper().add(DbTables.Goal, obj.toJson());

      if(addRes > 0){
        print("hellllllo");
        return true;
      }
      else{
        return false;
      }
    }
    catch(ex){
      rethrow;
    }
  }
  Future<bool> updateToDb(GoalModel obj)async{
    try{

      await Future.delayed(Duration(milliseconds: 300));
      var updateRes = await DbHelper().update(DbTables.Goal, obj.toJson(),"GoalId");
      if(updateRes > 0){
        print("Update item with name: ${obj.goalId}");
        return true;
      }
      else{
        return false;
      }
    }
    catch(ex){
      rethrow;
    }
  }

  Future<bool> deleteFromDb(int id)async{
    try{
      await Future.delayed(Duration(milliseconds: 300));
      var delRes = await DbHelper().delete(DbTables.Goal,id,"GoalId" );
      if(delRes > 0){
        print("deleted");

        return true;
      }
      else{
        return false;
      }
    }
    catch(ex){
      rethrow;
    }
  }

}