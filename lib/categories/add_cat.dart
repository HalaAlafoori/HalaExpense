import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:halaexpenses/color.dart';
import 'package:halaexpenses/shared/brunch/reg_exp.dart';
import 'package:halaexpenses/shared/main/main_app_bar.dart';

import 'icons.dart';

class AddCat extends StatefulWidget {
  const AddCat({Key? key}) : super(key: key);

  @override
  State<AddCat> createState() => _AddCat();
}
enum TransactionType{income, spent}

class _AddCat extends State<AddCat> {
  _AddCat(){


  }
  TransactionType? _selectedType;
  int _selectedIcon=0;

  var formKey=GlobalKey<FormState>();
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
                Container(margin: EdgeInsets.only(bottom: 10),
                  padding: EdgeInsets.only(top:25,left: 20,right: 20,bottom: 10),
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(30),color:Colors.grey.shade200,),




                  child:



                  TextFormField(

                    //controller: nameCtr,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    style: TextStyle(color: Colors.green.shade900),

                    validator: (value){
                      if(value == "")
                      {return "title is required";}

                      else{
                        if(value!.length <3){return "title must be longer that 3 chars";}
                        bool isValid = MyRegularExp.alphanumRegExp.hasMatch(value);
                        if (!isValid) {
                          return "title must only contains letter and numbers";
                        }
                      }},
                    decoration: InputDecoration(
                      fillColor: Colors.grey.shade200,
                      filled: true,
                      labelText: "Title",

                      labelStyle: TextStyle(color: Colors.black),
                      focusedBorder:UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey.shade200),
                        borderRadius: BorderRadius.circular(23.0),
                      ),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey.shade200),
                        borderRadius: BorderRadius.circular(23.0),
                      ),
                    ),
                  ),


                ),
                Container(//color:Colors.red,
                  margin: EdgeInsets.only(bottom: 10),
                  height: MediaQuery.of(context).size.height*.3,
                  padding: EdgeInsets.only(top:25,left: 20,right: 20,bottom: 10),
                  // decoration: BoxDecoration(borderRadius: BorderRadius.circular(30),color:Colors.grey.shade200,),




                  child:



                  Container(
                    width: MediaQuery.of(context).size.width,

                    // Text("Category")),
                    child:
                    Column(crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(padding: EdgeInsets.only(top:10,bottom: 20),
                          child:

                          Text("Transaction Type",style: TextStyle(fontSize: 18),),),
                        Container(width: MediaQuery.of(context).size.width/2,
                          child: RadioListTile(value: TransactionType.income,

                              groupValue: _selectedType,
                              title: Text(TransactionType.income.name),
                              tileColor:TransactionType.income==_selectedType? Colors.white70:Colors.grey.shade200,

                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20), side: BorderSide(color: Colors.grey)),
                              onChanged: (val){
                                setState(() {
                                  _selectedType=val;
                                });
                              }),
                        ),

                        SizedBox(height:15 ),
                        Container(width: MediaQuery.of(context).size.width/2,
                          child: RadioListTile(value: TransactionType.spent,
                              groupValue: _selectedType,
                              title: Text(TransactionType.spent.name),
                              tileColor:TransactionType.spent==_selectedType? Colors.white70:Colors.grey.shade200,

                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20), side: BorderSide(color: Colors.grey)),
                              onChanged: (val){
                                setState(() {
                                  _selectedType=val;
                                });
                              }),
                        ),

                      ],
                    ),

                  ),

                ),
                Container(//color:Colors.red,

                  margin: EdgeInsets.only(bottom: 0),
                  height: MediaQuery.of(context).size.height*.3,
                  padding: EdgeInsets.only(top:0,left: 20,right: 20,bottom: 10),
                  // decoration: BoxDecoration(borderRadius: BorderRadius.circular(30),color:Colors.grey.shade200,),




                  child:



                  Container(
                    width: MediaQuery.of(context).size.width,

                    // Text("Category")),
                    child:
                    Column(crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(padding: EdgeInsets.only(top:10,bottom: 20),
                          child:

                          Text("Icon",style: TextStyle(fontSize: 18),),),
                        Container(alignment: Alignment.center,
                            margin: EdgeInsets.only(bottom: 10),
                            padding: EdgeInsets.all(14),
                            // height: MediaQuery.of(context).size.height*.08,
                            width: MediaQuery.of(context).size.width*.21,
                            decoration: BoxDecoration(borderRadius: BorderRadius.circular(30),color:TransactionType.income==_selectedType?darkgreen:darkred),




                            child:



                            TextButton(

                                onPressed: (){

                                  showDialog(
                                      context: context,
                                      builder: (BuildContext context)=> AlertDialog(
                                        title: Text("Select an icon"),
                                        content: Container(
                                          width: 400,
                                          height: 600,
                                          alignment: Alignment.center,
                                          child:
                                          GridView.builder(gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                                              maxCrossAxisExtent: 60,
                                              childAspectRatio: 1/1,
                                              crossAxisSpacing: 10,
                                              mainAxisSpacing: 10
                                          ),
                                              itemCount: MyIcons.allicons.length,
                                              itemBuilder: (_,index)=> Container(
                                                key: ValueKey(MyIcons.allicons[index].codePoint),
                                                padding:EdgeInsets.all(10),
                                                child: IconButton(color: Colors.grey.shade600,
                                                  iconSize: 30,
                                                  icon: Icon(MyIcons.allicons[index]),
                                                  onPressed: (){
                                                    setState(() {
                                                      _selectedIcon=index;
                                                    });
                                                    Navigator.of(context).pop();
                                                  },

                                                ),
                                              )),
                                        ),
                                      ));
                                },
                                child: Icon(MyIcons.allicons[_selectedIcon],color: Colors.grey.shade600,))


                        ),




                      ],
                    ),

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
