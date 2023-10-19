import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../brunch_page.dart';
import '../../color.dart';
import '../../providers/login_provider.dart';
import '../../providers/theme_provider.dart';
import 'change_email.dart';

class MyDrawer extends StatelessWidget {




  @override
  Widget build(BuildContext context) {
    final loginProvider = Provider.of<LoginProvider>(context);
    final currentEmail = loginProvider.email;
    return
      Drawer(

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
                                color:ThemeProvider.getBack(context)

                            ),
                            child: Icon(Icons.person,size: 150,)),
                        Container(
                          margin: EdgeInsets.only(left: 10, top: 25),
                          //color: Colors.redAccent,
                          child: Consumer<LoginProvider>(
                            builder: (context, loginProvider, _) {
                              final String username = loginProvider.username;
                              return Text(
                                username,
                                style: TextStyle(fontSize: 25),
                              );
                            },
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 10, top: 5),
                          //color: Colors.redAccent,
                          child: Consumer<LoginProvider>(
                            builder: (context, loginProvider, _) {
                              final String email = loginProvider.email;
                              return Text(
                                email,
                                style: TextStyle(fontSize: 16),
                              );
                            },
                          ),
                        ),

                      ]),),
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
                                  child:
                                  IconButton(
                                    onPressed: () {
                                      Provider.of<ThemeProvider>(context, listen: false).toggleTheme();
                                    },

                                    icon:
                                    Consumer<ThemeProvider>(
                                    builder: (context, themeProvider, _) {
                                      return Icon(
                                        themeProvider.isDark()
                                            ? Icons.light_mode_rounded // Light mode icon
                                            : Icons.dark_mode_rounded, // Dark mode icon
                                        size: 40,
                                      );
                                    })
                              ),),

                                Container(margin: EdgeInsets.only(left: 0,top: 10),//color: Colors.redAccent,
                                  child:



                                    Consumer<ThemeProvider>(
                                      builder: (context, themeProvider, _) {
                                        return themeProvider.isDark()
                                            ? Text('Light Mode' , style: TextStyle(fontSize: 13),)// Text for dark mode
                                            : Text('Dark Mode', style: TextStyle(fontSize: 13),); // Text for light mode
                                      },

                                    ),
                                  ),


                              ]
                              ,
                            ),
                            GestureDetector(
                              onTap: (){
                                Navigator.of(context).push(MaterialPageRoute(builder: (context){
                                  return BrunchPage(3);
                                }));
                              },
                              child: Column(crossAxisAlignment: CrossAxisAlignment.center,
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
                              children: [
                                Container(
                                  padding: EdgeInsets.all(14),

                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color:darkgreen,
                                  ),
                                  child:

                                  IconButton(onPressed: (){
                                    showDialog(
                                      context: context,
                                      builder: (context) => ChangeEmailDialog(currentEmail),
                                    );
                                  },icon:Icon( Icons.attach_email_sharp,size: 40),
                                   )),

                                Container(margin: EdgeInsets.only(left: 0,top: 10),//color: Colors.redAccent,
                                  child: Text("Change Email",style: TextStyle(fontSize: 13),),
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
                                  child: Icon(Icons.cloud_upload_rounded,size: 40,)),


                                Container(margin: EdgeInsets.only(left: 0,top: 10),//color: Colors.redAccent,
                                  child: Text("Syncronize",style: TextStyle(fontSize: 13),),

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
}
