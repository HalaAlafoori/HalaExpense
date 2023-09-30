import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'package:halaexpenses/intro_pages/three_dots.dart';



class IntroThree extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {

    return _IntroThree();
  }

}
class _IntroThree extends State<IntroThree>{

  //bool btnIsActive=true;
  int chosenNum=0;
  bool btnIsActive=false;
  List catergories=[
    {'name':"Food",'isChecked':false,},
    {'name':"Transportation",'isChecked':false,},
    {'name':"Bills",'isChecked':false,},
    {'name':"Clothes",'isChecked':false,},
    {'name':"Grocery",'isChecked':false,},
    {'name':"Snacks",'isChecked':false,},
    {'name':"Health",'isChecked':false,},
    {'name':"Education",'isChecked':false,},
    {'name':"Food",'isChecked':false,},
    {'name':"Transportation",'isChecked':false,},
    {'name':"Bills",'isChecked':false,},
    {'name':"Clothes",'isChecked':false,},
    {'name':"Grocery",'isChecked':false,},
    {'name':"Snacks",'isChecked':false,},
    {'name':"Health",'isChecked':false,},
    {'name':"Education",'isChecked':false,},




  ];
  List chosenCategories=[];


  @override
  Widget build(BuildContext context) {

    return  Scaffold(

      body: Container(
        height: MediaQuery.of(context).size.height,
        padding: EdgeInsets.all(26.0),
        width:MediaQuery.of(context).size.width ,
        child: 
        SingleChildScrollView(
          child: Column(
            children: [
              Container(//color: Colors.teal,
                // height: MediaQuery.of(context).size.height *.7,
              child: Column(children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 50),
                  child: Text(
                    'Choose 3 categories to start with :',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.green.shade900,
                    ),
                  ),
                ),
                Container(
                  height: (MediaQuery.of(context).size.height) * .55,
                  child: ListView(
                    children:
                    catergories.map((item){
                      return
                        CheckboxListTile(

                          side: BorderSide(color: Colors.green.shade900),
                          checkColor: Colors.white,


                          // tileColor: Colors.white,
                          activeColor: Colors.green,
                          checkboxShape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                          title: Text(item['name'],style: TextStyle(color: Colors.green.shade900),),
                          value: item['isChecked'],onChanged: (val){
                          if(val!){
                            chosenNum++;

                          }
                          else{
                            chosenNum--;
                          }
                          print(chosenNum);
                          //setting value
                          setState(() {
                            item['isChecked']=val;
                          });
                        },);

                    }).toList(),





                  ),
                ),
             

              ],),),
              Container(//color: Colors.blueGrey ,
                 height: MediaQuery.of(context).size.height *.23,
              child:
              Column(
                children: [



                  Padding(
                  padding: const EdgeInsets.all(50.0),
                  child:

                  ElevatedButton(
                    child:
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Text("Get Started",style: TextStyle(fontSize: 20,color: Colors.black)),
                    ),

                    style: ButtonStyle(
                     // backgroundColor: MaterialStatePropertyAll(darkgreen)  ,
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0))),
                    ),
                    onPressed: chosenNum>=3
                        ?
                        (){
                      setState(() {

                        Navigator.pushReplacementNamed(context, "/");
                      });
                    } :
                    null,


                  ),
                ),
                  threeDots(3),],
              ),)

            ],
          ),
        ),
      ),



    );
  }
}
