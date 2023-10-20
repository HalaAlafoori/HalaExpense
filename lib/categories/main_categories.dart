import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:halaexpenses/categories/category_card.dart';
import 'package:halaexpenses/color.dart';
import 'package:halaexpenses/models/category_model.dart';
import 'package:smartrefresh/smartrefresh.dart';

import '../brunch_page.dart';
import '../data/repositories/category_repo.dart';
import '../shared/main/floating_btn.dart';
import '../shared/main/main_app_bar.dart';
import 'delete_cat.dart';




class MainCategories extends StatefulWidget {
  const MainCategories({Key? key}) : super(key: key);

  @override
  State<MainCategories> createState() => _MainCategoriesState();
}

class _MainCategoriesState extends State<MainCategories> {
  //final List<String> items=new List<String>.generate(5, (index) => "items ${index+1}");


  Future<List<CategoryModel>>? _data;
  late List<CategoryModel> data=[];
  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey =
  GlobalKey<RefreshIndicatorState>();
  final RefreshController _refreshController = RefreshController();


  @override
  void initState(){
    print("init -----------");

    //print("budget ----------- ${CurrentBudget}");


    _data = fetchData();

    super.initState();
  }

  Future<List<CategoryModel>> fetchData() async {
    // Getting data from the database
    var res = await CategoryRepository().getAll();
    data.clear();


    res!.forEach((item) {
      data.add(item);

    });

    return data;
  }
  Future<void> _refreshData() async {
    setState(() {
      _data=null;
      _data = fetchData();
    });
    await _data;
    _refreshController.setFRefreshState(PullToRefreshState());
    _refreshController.refreshCompleted();
  }
  void search(value){
    print("insearch");
    List<CategoryModel> datacopy=List.from(data);

    var res=List.from(datacopy);
    print("------------${res}");
    datacopy.clear();
    res!.forEach((item) {
      print("inloop ");
      if (item.catName.contains(value))
        datacopy.add(item);

    });
    setState(() {
      _data = Future.value(datacopy);
    });
    _refreshController.setFRefreshState(PullToRefreshState());
    _refreshController.refreshCompleted();


  }




  @override
  Widget build(BuildContext context) {
    return

        Scaffold(
          appBar: MyMainAppBar("Hala Expense",(value){
            search(value);
          }),
          floatingActionButton:MyFloatingBtn(context,()async{

            var isAdd=await Navigator.of(context).push(MaterialPageRoute(builder: (context)=> BrunchPage(2)
            ));
            if(isAdd!=null && isAdd==true){
              setState(() {
                _data = fetchData();
              });
              print("^^^^^^^^^^^^^^^^^^${data}");
              _refreshController.refreshCompleted();
            }



          }),
        body:
        Container(padding: EdgeInsets.all(10),
          child:
          RefreshIndicator(
            key: _refreshIndicatorKey,
            onRefresh: _refreshData,
            child:
            FutureBuilder<List<CategoryModel>>(
            future: _data!,
            builder: (context,snapshot){
              if(snapshot.connectionState ==ConnectionState.waiting){
                return Center(child: CircularProgressIndicator());
              }
              else if(snapshot.connectionState ==ConnectionState.done){
                if(snapshot.hasError)
                  return Center(child: Text("Error ${snapshot.error.toString()}"));
                else if(snapshot.hasData){
                  var list=snapshot.data??[];
                  return

                    GridView.count(crossAxisCount: 3,childAspectRatio: 1,
                      children: List.generate(list.length, (index) =>
                          Container(//color: Colors.indigo,
                            child: Column(
                              children: [
                                Container(alignment: Alignment.centerRight,

                                    //   color: Colors.yellowAccent,
                                    child:
                                    GestureDetector(child:
                                    CircleAvatar(child:
                                    Icon(Icons.close_rounded,color: Colors.white70,size:20,),radius: 13,backgroundColor: darkred,),
                                      onTap:() async{
                                        var delRes=await


                                          showDialog(
                                            context: context,
                                            builder: (BuildContext context) {
                                              return AlertDialog(
                                                shape: RoundedRectangleBorder(
                                                  borderRadius: BorderRadius.circular(16),
                                                ),
                                                title: Text(
                                                  'Confirm Delete',
                                                  style: TextStyle(
                                                    fontSize: 20,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                                content: Text(
                                                  'Are you sure you want to delete this item?',
                                                  style: TextStyle(fontSize: 16),
                                                ),
                                                actions: [
                                                  TextButton(
                                                    onPressed: () async{
                                                      await CategoryRepository().deleteFromDb(list[index].catId!.toInt()); // Call deleteFromDB function
                                                      Navigator.of(context).pop(true); // Close the dialog
                                                    },
                                                    child: Text(
                                                      'Delete',
                                                      style: TextStyle(
                                                        fontSize: 16,
                                                        fontWeight: FontWeight.bold,
                                                        color: Colors.red,
                                                      ),
                                                    ),
                                                  ),
                                                  TextButton(
                                                    onPressed: () {
                                                      Navigator.of(context).pop(false); // Close the dialog
                                                    },

                                                    child: Text(
                                                      'Cancel',
                                                      style: TextStyle(
                                                        fontSize: 16,
                                                        fontWeight: FontWeight.bold,
                                                        color: Colors.grey,
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              );
                                            },
                                          );
                                        if(delRes){
                                          print("deleteeeeeeeeeeted");
                                          setState(() {
                                            _refreshData();
                                          });


                                        }

                                      }
                                    )),
                                CategoryCard(context,list[index]),
                              ],

                            ),
                          ) ,),
                    );
                }
                else{
                  return Center(child: Text("Error ${snapshot.error.toString()}"));

                }

              }
              else{
                return Center(child: Text("Error ${snapshot.error.toString()}"));

              }

            },),

        ) ,
    ),
      );
      






  }
}
