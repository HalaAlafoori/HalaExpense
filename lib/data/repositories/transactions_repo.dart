
import 'package:flutter/foundation.dart';
import 'package:sqflite/sqflite.dart';

import '../../models/category_model.dart';
import '../../models/transaction_model.dart';
import '../db_helper.dart';

class TransactionRepository{
  Future<List<TransactionModel>> getAll()async{

    try{
      // await Future.delayed(Duration(milliseconds: 300));
      var res = await DbHelper().getAll(DbTables.Transactions);
      List<TransactionModel> items = [];
      if(res != null){
        for (var e in res) {
          items.add(TransactionModel.fromJson(e));
        }
        return items;
      }

      return items;
    }
    catch(ex){
      rethrow;
    }
  }

  Future<List<TransactionModel>> getAllRecent()async{

    try{
      // await Future.delayed(Duration(milliseconds: 300));
      var res = await DbHelper().getAll(DbTables.Transactions);
      List<TransactionModel> items = [];
      if(res != null){
        for (var e in res) {
          items.add(TransactionModel.fromJson(e));
        }
        return items;
      }

      return items;
    }
    catch(ex){
      rethrow;
    }
  }

  Future<bool> addToDb(TransactionModel obj)async{
    try{
      await Future.delayed(Duration(milliseconds: 300));
      var addRes = await DbHelper().add(DbTables.Transactions, obj.toJson());
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

  Future<bool> updateToDb(TransactionModel obj)async{
    try{
      await Future.delayed(Duration(milliseconds: 300));
      var updateRes = await DbHelper().update(DbTables.Transactions, obj.toJson(),"TransId");
      if(updateRes > 0){
        print("Update item with name: ${obj.transName}");
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
      var delRes = await DbHelper().delete(DbTables.Transactions, id,"TransId");
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