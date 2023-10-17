import 'package:date_format/date_format.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../categories/icons.dart';
import '../color.dart';
import '../data/repositories/category_repo.dart';
import '../data/repositories/goal_repo.dart';
import '../data/repositories/transactions_repo.dart';
import '../models/category_model.dart';
import '../models/goal_model.dart';
import '../models/transaction_model.dart';
import '../shared/brunch/brunch_app_bar.dart';
import '../shared/brunch/money_input.dart';

class EditGoal extends StatefulWidget {
  EditGoal(this.item){
    print("%%%%%%%%%%%%%%% ${item}");
  }


  Map<String, dynamic> item;

  @override
  State<EditGoal> createState() => _EditGoalState();
}

class _EditGoalState extends State<EditGoal> {


  @override
  void initState() {
    get_categories();

    editedItem=widget.item;
    limitCon=TextEditingController(text: editedItem['SpentLimit'].toString());

    _selectedIcon= Icon(MyIcons.allicons[editedItem['CatIcon']]);
    _selectedType=editedItem['Type'];



  }

  Future get_categories()async{
    categories= await CategoryRepository().getAll() as List;
    catId=editedItem['CatId']-1;
    print(categories);
    print("@@@@@@@@@${categories[catId].catName}");

  }

  bool dateChanged=false;
  late List categories;
  var editedItem;


  var limitCon;
  var titleCon;
  int catId=-1;

  CategoryModel? _selectedCategory;


  Icon? _selectedIcon;

  int _selectedIndex=0;
  int _selectedType=0;


  var formKey=GlobalKey<FormState>();

  DateTime now = new DateTime.now();


//add status:
  bool loading=false;
  bool iserror=false;
  bool issuccess=false;
  String error="";

  void noChange(){
    ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Row(
            children: [
              Icon(Icons.warning, color: Colors.orange),
              SizedBox(width: 8),
              Text(
                'Nothing to update',
                style: TextStyle(color: Colors.orange, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          backgroundColor: Colors.yellow,
          elevation: 6,
          behavior: SnackBarBehavior.floating,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          duration: Duration(seconds: 3),
        ));

  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: MyBrunchAppBar("Edit Transaction"),
        body:



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

                    MoneyInput(limitCon, "Total"),


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
                                  DropdownButtonFormField(
                                      value: categories.isNotEmpty ? categories[catId] : null, // Set the default value
                                      items: categories.map(
                                              (item) =>  DropdownMenuItem(child:Text(item.catName) ,value: item,)).toList(),

                                      onChanged: (val){
                                        print(val);



                                        setState(() {
                                          //String valstr=val ;

                                          // _selectedCategory=valstr;
                                          print(".............${val}");
                                          _selectedIndex=categories.indexOf(val);
                                          _selectedType=categories[_selectedIndex].type;

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
                                              color:_selectedType==1?darkred:darkgreen,
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
                            child: Text("Update",style: TextStyle(fontSize: 20,color: Colors.black)),
                          ),

                          style: ButtonStyle(
                            backgroundColor: MaterialStatePropertyAll(darkgreen)  ,
                            shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0))),
                          ),

                          onPressed: ()async{
                            if(formKey.currentState!.validate()){
                              try{
                                if(

                                    editedItem['SpentLimit']!= double.parse(limitCon.text)||
                                    editedItem['CatId']!=categories[_selectedIndex].catId


                                ){
                                  dateChanged=true;
                                  print("----------true---###${dateChanged}");
                                  //make a condition to the rest
                                }

                                else{
                                  noChange();
                                  print("-------------###${dateChanged}");}

                                if(dateChanged){
                                  setState(() {
                                    loading=true;
                                    issuccess=false;
                                    iserror=false;

                                  });
                                  var data={

                                    "GoalId":editedItem['GoalId'],
                                    "CatId":categories[_selectedIndex].catId,
                                    "SpentLimit":double.parse(limitCon.text),
                                    "GoalDate":editedItem['GoalDate']

                                  };
                                  print(data);
                                  var updateRes=await GoalRepository().updateToDb(GoalModel.fromJson(data));
                                  if(updateRes ){
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
        ));
  }
}
