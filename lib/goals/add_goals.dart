import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:halaexpenses/color.dart';
import 'package:halaexpenses/shared/brunch/money_input.dart';
import 'package:halaexpenses/shared/brunch/reg_exp.dart';
import 'package:halaexpenses/shared/main/main_app_bar.dart';

import '../categories/icons.dart';

class AddGoals extends StatefulWidget {
  const AddGoals({Key? key}) : super(key: key);

  @override
  State<AddGoals> createState() => _AddGoals();
}


class _AddGoals extends State<AddGoals> {
  _AddGoals() {
    _selectedCategory = categories[0];

    _selectedIcon = categories_icons[0];
  }


  final List categories=['Food','Salary'];
  final List categories_icons=[Icon(MyIcons.allicons[6]),Icon(MyIcons.allicons[9])];




  String? _selectedCategory="";


  Icon? _selectedIcon;
  int _selectedIndex=0;
  var formKey=GlobalKey<FormState>();
  var limitCon=TextEditingController();




  //reg exp


  @override
  Widget build(BuildContext context) {
    return
      SingleChildScrollView(
        physics: NeverScrollableScrollPhysics(),
        child:
        Container(//color: Colors.indigoAccent,
          padding: EdgeInsets.all(20),child:
        Form(
          key: formKey,
          child:


          Column(children: [

            Container(//color: Colors.redAccent,
              height: MediaQuery.of(context).size.height *.77,
              child:
              Column(children: [

               MoneyInput(limitCon, "Limit"),


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
                    DropdownButtonFormField(items: categories.map(
                            (item) =>  DropdownMenuItem(child: Text(item),value:item)).toList(),

                      onChanged: (val){
                        setState(() {
                          String valstr=val as String;

                          _selectedCategory=valstr;
                          _selectedIndex=categories.indexOf(valstr);
                          _selectedIcon=(categories_icons[_selectedIndex]);
                        });
                      },value: _selectedCategory,
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
                              color:darkred,
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
                      ),),

                  ),

                ),

              ],),
            ),


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

                      onPressed: () {
                        if(formKey.currentState!.validate()){
                          Navigator.pushNamed(context, "/");
                        }
                      },
                    ),
                  ),
                ],
              ),
            )




          ],),
        ),
        ),

      );
  }
}
