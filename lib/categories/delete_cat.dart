import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../data/repositories/category_repo.dart';

class DeleteCat extends StatefulWidget {
  DeleteCat(this.id);
  int id;

  @override
  State<DeleteCat> createState() => _DeleteCatState();
}

class _DeleteCatState extends State<DeleteCat> {
  String txt="Do u want to delete this item?";
  bool loading=false;
  bool iserror=false;
  bool issuccess=false;
  String error="";
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Icon(Icons.delete),
      content: Container(
        constraints: BoxConstraints(
            maxWidth: 300,
            maxHeight: 250,
            minWidth: 150,
            minHeight: 150
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          mainAxisSize: MainAxisSize.min,
          children: [
            loading?CircularProgressIndicator():Text("$txt"),


            iserror?Text("error:${error}",style: TextStyle(color: Colors.red),):SizedBox(),
            issuccess?Text("Added successfully",style: TextStyle(color: Colors.green),):SizedBox(),
            Row(
              children: [
                TextButton(onPressed: ()async{
                  try{
                    setState(() {
                      loading=true;
                      issuccess=false;
                      iserror=false;

                    });

                    var addRes=await CategoryRepository().deleteFromDb(widget.id);
                    if(addRes ){
                      setState(() {
                        loading=false;
                        issuccess=true;
                        iserror=false;
                        error="";
                        txt="Deleted Successfully";

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

                }, child: Text("Yes")),
                TextButton(onPressed: (){
                  Navigator.of(context).pop(false);
                }, child: Text("No")),

              ],
            )
          ],
        ),
      ),
    );
  }
  }
