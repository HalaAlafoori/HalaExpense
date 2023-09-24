import 'package:flutter/material.dart';
import 'package:halaexpenses/color.dart';

Drawer MyDrawer(){
  return Drawer(

    child: Container(
      padding: EdgeInsets.only(top: 55),
      child: Column(
        children: [

          Container(//color: Colors.redAccent,


            child: Column(crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  padding: EdgeInsets.all(30),

                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(70),
                    color: Colors.grey.shade200,

                  ),
                  child: Icon(Icons.person,size: 150,)),
                Container(margin: EdgeInsets.only(left: 10,top: 25),//color: Colors.redAccent,
                  child: Text("Hala Alafoori",style: TextStyle(fontSize: 25),),
                ),
                Container(margin: EdgeInsets.only(left: 10,top: 5),//color: Colors.redAccent,
                  child: Text("hala@gmail.com",style: TextStyle(fontSize: 16),),
                ),]),),
          Container(
            padding: EdgeInsets.all(20),

            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              //color:Colors.grey.shade200,
            ),
            margin: EdgeInsets.all(10),
            child:
            Column(
              children: [
                Container(//color:Colors.red,
                  padding: const EdgeInsets.symmetric(vertical: 30.0),
                  child:
                  Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(crossAxisAlignment: CrossAxisAlignment.center,
                        children: [Container(
                            padding: EdgeInsets.all(14),

                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color:darkgreen,
                            ),
                            child: Icon(Icons.dark_mode_rounded,size: 40,)),

                              Container(margin: EdgeInsets.only(left: 0,top: 10),//color: Colors.redAccent,
                                child: Text("Dark Mode",style: TextStyle(fontSize: 13),),
                              ),

                          ]
                        ,
                      ),
                      Column(crossAxisAlignment: CrossAxisAlignment.center,
                        children: [Container(
                            padding: EdgeInsets.all(14),

                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color:darkgreen,
                            ),
                            child: Icon(Icons.settings,size: 40,)),


                              Container(margin: EdgeInsets.only(left: 0,top: 10),//color: Colors.redAccent,
                                child: Text("Settings",style: TextStyle(fontSize: 13),),

                          ),]
                        ,
                      ),
                    ],
                  ),

                ),
                Container(//color:Colors.red,
                  padding: const EdgeInsets.symmetric(vertical: 30.0),
                  child:
                  Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(crossAxisAlignment: CrossAxisAlignment.center,
                        children: [Container(
                            padding: EdgeInsets.all(14),

                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color:darkgreen,
                            ),
                            child: Icon(Icons.lock_clock_rounded,size: 40,)),

                          Container(margin: EdgeInsets.only(left: 0,top: 10),//color: Colors.redAccent,
                            child: Text("Logout",style: TextStyle(fontSize: 13),),
                          ),

                        ]
                        ,
                      ),
                      Column(crossAxisAlignment: CrossAxisAlignment.center,
                        children: [Container(
                            padding: EdgeInsets.all(14),

                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color:darkgreen,
                            ),
                            child: Icon(Icons.share_rounded,size: 40,)),


                          Container(margin: EdgeInsets.only(left: 0,top: 10),//color: Colors.redAccent,
                            child: Text("Share",style: TextStyle(fontSize: 13),),

                          ),]
                        ,
                      ),
                    ],
                  ),

                ),

              ],
            ),











          ),




              ]

            ),
          ),

      );

}