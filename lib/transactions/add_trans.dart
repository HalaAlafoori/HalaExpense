import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:halaexpenses/categories/icons.dart';
import 'package:halaexpenses/color.dart';
import 'package:halaexpenses/data/repositories/category_repo.dart';
import 'package:halaexpenses/data/repositories/transactions_repo.dart';
import 'package:halaexpenses/models/category_model.dart';
import 'package:halaexpenses/models/transaction_model.dart';
import 'package:halaexpenses/providers/login_provider.dart';
import 'package:halaexpenses/shared/brunch/title_input.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../providers/theme_provider.dart';
import '../shared/brunch/money_input.dart';

class AddTrans extends StatefulWidget {
  const AddTrans({Key? key}) : super(key: key);

  @override
  State<AddTrans> createState() => _AddTrans();
}


class _AddTrans extends State<AddTrans> {




  Future<List<CategoryModel>?>? _categories;
  late List<CategoryModel> categories=[]; // Change the type to a mutable list
  @override
initState(){
 _categories= get_categories();
}

  Future<List<CategoryModel>> get_categories()async{
    var res= await CategoryRepository().getAll() as List;
    _selectedIcon=Icon(MyIcons.allicons[res[0].catIcon]);
    _selectedCategory = res[0];
    categories.clear();
    res!.forEach((item) {
      categories.add(item);
    });


    return categories;
    print(categories[0].catIcon);


  }





  CategoryModel? _selectedCategory;


  Icon? _selectedIcon;
  int _selectedIndex=0;
  var formKey=GlobalKey<FormState>();
  var totalCon=TextEditingController();
  var titleCon=TextEditingController();

void noMoney(){
  ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Row(
          children: [
            Icon(Icons.warning, color: Colors.orange),
            SizedBox(width: 8),
            Text(
              'No enough money for this transaction',
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

//add status:
  bool loading=false;
  bool iserror=false;
  bool issuccess=false;
  String error="";
  bool noMoneyLeft=false;


@override
  Widget build(BuildContext context) {
  var left=context.watch<LoginProvider>().leftAmount;

    return
      SingleChildScrollView(physics: NeverScrollableScrollPhysics(),
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
                   Column(children: [
                       TitleInput(titleCon, "Title"),
                        MoneyInput(totalCon, "Total"),


                        Container(//color:Colors.red,
                          margin: EdgeInsets.only(bottom: 10),
                          height: MediaQuery.of(context).size.height*.14,
                          padding: EdgeInsets.only(top:25,left: 20,right: 20,bottom: 10),
                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(30),color:ThemeProvider.getBack(context),),
                          child:
                            // Text("Category")),
                            FutureBuilder(
                              future: _categories,
                              builder: (context, snapshot) {
                                if (snapshot.connectionState == ConnectionState.waiting) {
                                  return CircularProgressIndicator();
                                } else if (snapshot.hasData && snapshot.data!.isNotEmpty) {
                                  final List<CategoryModel> data = snapshot.data!;



                                  return
                                    DropdownButtonFormField(items: data.map(
                                            (item) =>  DropdownMenuItem(child:Text(item.catName!) ,value: item,)).toList(),

                                        onChanged: (val){
                                          if(val != null)
                                            print("0000000${val}");

                                          setState(() {
                                            _selectedIndex=categories.indexOf(val!);
                                            _selectedIcon=Icon(MyIcons.allicons[categories[_selectedIndex].catIcon!]);

                                            print("_________${categories[_selectedIndex].catName}");
                                          });
                                        },
                                        icon: Icon(Icons.arrow_drop_down_circle_outlined,color: Colors.grey,),
                                        dropdownColor: ThemeProvider.getBack(context),

                                        decoration: InputDecoration(
                                          fillColor: ThemeProvider.getBack(context),
                                          filled: true,
                                          labelText: "Categories",
                                          labelStyle: TextStyle(color:ThemeProvider.getLabel(context)),


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
                                  return Container(
                                    padding: EdgeInsets.all(16.0),
                                    decoration: BoxDecoration(
                                      color: darkred,
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    child: Row(
                                      children: [
                                        Icon(
                                          Icons.error_outline,
                                          color: Colors.white,
                                        ),
                                        SizedBox(width: 8.0),
                                        Text(
                                          'No categories available',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                                }
                              },
                            )



                        ),

                      ],),
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
                             child: Text("Cancel",style: TextStyle(fontSize: 20,color:ThemeProvider.getLabel(context))),
                           ),

                           style: ButtonStyle(

                             shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0))),
                           ),

                           onPressed: () {
                             Navigator.pop(context);
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
                             child: Text("Add",style: TextStyle(fontSize: 20,color:ThemeProvider.getLabel(context))),
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
                              noMoneyLeft=false;





                              });

                              if(left- double.parse(totalCon.text)<0 ){//&& type is red
                                 noMoney();
                                 noMoneyLeft=true;
                                 loading=false;

                              }

                              if (!noMoneyLeft) {
                                var dateTime = DateFormat('yyyy-MM-ddThh:mm:ss').parse(DateTime.now().toIso8601String());
                                print("numbers= ${dateTime.millisecondsSinceEpoch} & ${dateTime}");
                                
                                var data={
                                "TransName":titleCon.text,
                                "CatId":categories[_selectedIndex].catId,
                                "Total":double.parse(totalCon.text),
                                "TransDate":dateTime.millisecondsSinceEpoch
                                
                                };
                                print(data['TransDate']);
                                
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
