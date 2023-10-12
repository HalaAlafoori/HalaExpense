import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:halaexpenses/categories/category_card.dart';
import 'package:halaexpenses/color.dart';
import 'package:halaexpenses/models/category_model.dart';

import '../data/repositories/category_repo.dart';
import 'delete_cat.dart';




class MainCategories extends StatefulWidget {
  const MainCategories({Key? key}) : super(key: key);

  @override
  State<MainCategories> createState() => _MainCategoriesState();
}

class _MainCategoriesState extends State<MainCategories> {
  //final List<String> items=new List<String>.generate(5, (index) => "items ${index+1}");

  var dismissedItem;
  @override
  Widget build(BuildContext context) {
    return
      RefreshIndicator(
        onRefresh: ()async{
          setState(() {

          });
        },
        child: Scaffold(
        body:
        Container(padding: EdgeInsets.all(10),
          child:
           FutureBuilder<List<CategoryModel>>(
            future: CategoryRepository().getAll(),
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
                                      onTap: ()async{
                                        var delRes=await showDialog(context: context, builder: (context){
                                          var id=list[index].catId??0;
                                          return DeleteCat(id.toInt());});
                                        setState(() {

                                        });}

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
