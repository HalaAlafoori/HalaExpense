
import 'package:flutter/foundation.dart';

import '../../models/category_model.dart';
import '../db_helper.dart';

class CategoryRepository{
  Future<List<CategoryModel>> getAll()async{

    try{
      // await Future.delayed(Duration(milliseconds: 300));
      var res = await DbHelper().getAll(DbTables.Categories);
      List<CategoryModel> items = [];
      if(res != null){
        for (var e in res) {
          items.add(CategoryModel.fromJson(e));
        }
        return items;
      }

      return items;
    }
    catch(ex){
      rethrow;
    }
  }

  Future<bool> addToDb(CategoryModel obj)async{
    try{
      await Future.delayed(Duration(milliseconds: 300));
      var addRes = await DbHelper().add(DbTables.Categories, obj.toJson());
      if(addRes > 0){
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
      var delRes = await DbHelper().delete(DbTables.Categories,id,"CatId" );
      if(delRes > 0){
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