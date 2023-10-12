import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:halaexpenses/categories/icons.dart';
import 'package:halaexpenses/color.dart';
import 'package:halaexpenses/data/repositories/category_repo.dart';
import 'package:halaexpenses/data/repositories/transactions_repo.dart';
import 'package:halaexpenses/models/category_model.dart';
import 'package:halaexpenses/models/transaction_model.dart';
import 'package:halaexpenses/shared/brunch/reg_exp.dart';
import 'package:halaexpenses/shared/brunch/title_input.dart';
import 'package:halaexpenses/shared/main/main_app_bar.dart';
import 'package:date_format/date_format.dart';

import '../shared/brunch/money_input.dart';

class AddTrans extends StatefulWidget {
  const AddTrans({Key? key}) : super(key: key);

  @override
  State<AddTrans> createState() => _AddTrans();
}


class _AddTrans extends State<AddTrans> {
_AddTrans(){
  get_categories();
}

  Future get_categories()async{
    categories= await CategoryRepository().getAll() as List;
    //print(categories[0].name);
  }
  late List categories;
  // final List categories=['Food','Salary'];
  // final List categories_icons=[Icon(MyIcons.allicons[6]),Icon(MyIcons.allicons[9])];
  // //final List transaction_type=['income','spent'];
  // final  List transaction_color=[darkred,darkgreen];


  CategoryModel? _selectedCategory;


  Icon? _selectedIcon;
  int _selectedIndex=0;
  var formKey=GlobalKey<FormState>();
  var totalCon=TextEditingController();
  var titleCon=TextEditingController();
  DateTime now = new DateTime.now();


//add status:
  bool loading=false;
  bool iserror=false;
  bool issuccess=false;
  String error="";


@override
  Widget build(BuildContext context) {
    return


      SingleChildScrollView(
        child: Container(//color: Colors.indigoAccent,
            height: MediaQuery.of(context).size.height,
            padding: EdgeInsets.all(20),child:
          Form(
            key: formKey,
            child:




               Column(mainAxisAlignment: MainAxisAlignment.spaceBetween,children: [
                  Container(//color: Colors.redAccent,
                    height: MediaQuery.of(context).size.height *.7,

                    child:
                    SingleChildScrollView(
                      child: Column(children: [
                       TitleInput(titleCon, "Title"),
                        MoneyInput(totalCon, "Total"),


                        Container(//color:Colors.red,
                          margin: EdgeInsets.only(bottom: 10),
                          height: MediaQuery.of(context).size.height*.14,
                          padding: EdgeInsets.only(top:25,left: 20,right: 20,bottom: 10),
                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(30),color:Colors.grey.shade200,),




                          child:



                          Container(padding: EdgeInsets.only(left:10),
                            width: MediaQuery.of(context).size.width,
                            child:
                            // Text("Category")),
                            FutureBuilder<List<CategoryModel>>(
                              future: CategoryRepository().getAll(),
                              builder: (context, snapshot) {
                                if (snapshot.hasData) {
                                  var data = snapshot.data!;
                                  _selectedCategory=data[0];
                                  return
                                    DropdownButtonFormField(items: categories.map(
                                          (item) =>  DropdownMenuItem(child:Text(item.catName) ,value: item,)).toList(),

                                    onChanged: (val){
                                      print(val);


                                      setState(() {
                                        //String valstr=val ;

                                       // _selectedCategory=valstr;
                                        _selectedIndex=categories.indexOf(val);

                                        _selectedIcon=Icon(MyIcons.allicons[categories[_selectedIndex].catIcon]);
                                        print("_________${categories[_selectedIndex].catName}");
                                      });
                                    },
                                    icon: Icon(Icons.arrow_drop_down_circle_outlined,color: Colors.grey,),
                                    dropdownColor: Colors.grey.shade200,

                                    decoration: InputDecoration(
                                      fillColor: Colors.grey.shade200,
                                      filled: true,
                                      labelText: "Categories",
                                      labelStyle: TextStyle(color: Colors.black),


                                      prefixIcon:  Container(
                                          margin: EdgeInsets.only(right:15),
                                          padding: EdgeInsets.all(14),
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(20),
                                            color:categories[_selectedIndex].type==1?darkred:darkgreen,
                                          ),
                                          child: Icon(_selectedIcon?.icon,color: Colors.black26,)),



                                      focusedBorder:UnderlineInputBorder(
                                        borderSide: BorderSide(color: Colors.grey.shade200),
                                        borderRadius: BorderRadius.circular(23.0),
                                      ),
                                      enabledBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(color: Colors.grey.shade200),
                                        borderRadius: BorderRadius.circular(23.0),
                                      ),
                                    ));
                                } else {
                                  return const CircularProgressIndicator();
                                }
                              },
                            )

                          ),

                        ),

                      ],),
                    ),
                  ),


                 loading?CircularProgressIndicator():
                 Container(//color: Colors.blue,
                   height: MediaQuery.of(context).size.height *.1,
                   child: Row(
                     children: [

                       Container(

                         width: MediaQuery.of(context).size.width*.45,
                         padding: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                         child:
                         OutlinedButton(
                           child:
                           Padding(
                             padding: const EdgeInsets.all(20.0),
                             child: Text("Cancel",style: TextStyle(fontSize: 20,color: Colors.black)),
                           ),

                           style: ButtonStyle(

                             shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0))),
                           ),

                           onPressed: () {
                             Navigator.pushNamed(context, "/");
                           },
                         ),
                       ),
                       Container(

                         width: MediaQuery.of(context).size.width*.45,
                         padding: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                         child:
                         OutlinedButton(
                           child:
                           Padding(
                             padding: const EdgeInsets.all(20.0),
                             child: Text("Add",style: TextStyle(fontSize: 20,color: Colors.black)),
                           ),

                           style: ButtonStyle(
                             backgroundColor: MaterialStatePropertyAll(darkgreen)  ,
                             shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0))),
                           ),

                            onPressed: ()async{
                              if(formKey.currentState!.validate()){
                              try{
                              setState(() {
                              loading=true;
                              issuccess=false;
                              iserror=false;

                              });
                              var data={
                              "TransName":titleCon.text,
                              "CatId":categories[_selectedIndex].catId,
                              "Total":double.parse(totalCon.text),

                             // "TransDate":formatDate(DateFormat('hh:mm:ss').format(DateTime.now()));
                              "TransDate":(formatDate(DateTime.now(), [yyyy, '-', mm, '-', dd]))

                              };
                              print(data);
                              var addRes=await TransactionRepository().addToDb(TransactionModel.fromJson(data));
                              if(addRes ){
                              setState(() {
                              loading=false;
                              issuccess=true;
                              iserror=false;
                              error="";

                              });
                              Navigator.of(context).pop(true);
                              }
                              else{
                              setState(() {
                              loading=false;
                              issuccess=false;
                              iserror=true;
                              error="Operation failed!!";

                              });
                              }
                              }

                              catch(e){
                              setState(() {
                              loading=false;
                              issuccess=false;
                              iserror=true;
                              error="Exception: ${e}";

                              });
                              }
                              }

                              }
  ),
                         ),

                     ],
                   ),
                 ),

                 iserror?Text("error:${error}",style: TextStyle(color: Colors.red),):SizedBox(),
                 issuccess?Text("Added successfully",style: TextStyle(color: Colors.green),):SizedBox()




                ],),
              ),



    ),
      );
  }
}
