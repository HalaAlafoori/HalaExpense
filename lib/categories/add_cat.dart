import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:halaexpenses/color.dart';
import 'package:halaexpenses/models/category_model.dart';
import '../data/repositories/category_repo.dart';
import '../providers/theme_provider.dart';
import '../shared/brunch/title_input.dart';
import 'icons.dart';

class AddCat extends StatefulWidget {
  const AddCat({Key? key}) : super(key: key);

  @override
  State<AddCat> createState() => _AddCat();
}
enum TransactionType{income, spent}

class _AddCat extends State<AddCat> {

  TransactionType _selectedType=TransactionType.income;
  int _selectedIcon=0;

  var formKey=GlobalKey<FormState>();
  var nameCon=TextEditingController();

  //add status:
  bool loading=false;
  bool iserror=false;
  bool issuccess=false;
  String error="";


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
                TitleInput(nameCon,"Name"),
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

                          Text("Category Type",style: TextStyle(fontSize: 18),),),
                        Container(width: MediaQuery.of(context).size.width/2,
                          child: RadioListTile(value: TransactionType.income,

                              groupValue: _selectedType,
                              title: Text(TransactionType.income.name),
                              tileColor:TransactionType.income==_selectedType? Colors.white70:ThemeProvider.getBack(context),

                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20), side: BorderSide(color: Colors.grey)),
                              onChanged: (val){
                                setState(() {
                                  _selectedType=val!;
                                  print("----------------${_selectedType.index}");
                                });
                              }),
                        ),

                        SizedBox(height:15 ),
                        Container(width: MediaQuery.of(context).size.width/2,
                          child: RadioListTile(value: TransactionType.spent,
                              groupValue: _selectedType,
                              title: Text(TransactionType.spent.name),
                              tileColor:TransactionType.spent==_selectedType? Colors.white70:ThemeProvider.getBack(context),


                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20), side: BorderSide(color: Colors.grey)),
                              onChanged: (val){
                                setState(() {
                                  _selectedType=val!;
                                  print("----------------${_selectedType.index}");
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
                                                child: IconButton(color:ThemeProvider.getIcons(context),
                                                  iconSize: 30,
                                                  icon: Icon(MyIcons.allicons[index]),
                                                  onPressed: (){
                                                    setState(() {
                                                      _selectedIcon=index;
                                                      print("------------${_selectedIcon}");
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

                              });
                              var date={
                                "CatName":nameCon.text,
                                "CatIcon":_selectedIcon,
                                "Type":_selectedType.index

                              };
                              print("********************${date}");
                              var addRes=await CategoryRepository().addToDb(CategoryModel.fromJson(date));
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
