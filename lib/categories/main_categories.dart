import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:halaexpenses/categories/category_card.dart';
import 'package:halaexpenses/color.dart';


import '../home/transaction_card.dart';

class MainCategories extends StatefulWidget {
  const MainCategories({Key? key}) : super(key: key);

  @override
  State<MainCategories> createState() => _MainCategoriesState();
}

class _MainCategoriesState extends State<MainCategories> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView.count(crossAxisCount: 2,childAspectRatio: 1,
      children: List.generate(11, (index) =>CategoryCard(context,index%2==0? darkred:darkgreen) ),
      ) ,
    );
      






  }
}
