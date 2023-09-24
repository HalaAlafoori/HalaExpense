import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:halaexpenses/shared/brunch/brunch_app_bar.dart';
import 'package:halaexpenses/shared/brunch/brunch_body.dart';

class BrunchPage extends StatefulWidget {
  BrunchPage(this.page);
  int page;

  @override
  State<BrunchPage> createState() => _BrunchPageState(page);
}

class _BrunchPageState extends State<BrunchPage> {
  _BrunchPageState(this._page);
  int _page;
  List<String> titles=["Add Tansaction","Add Saving Plan","Add Category","Settings"];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyBrunchAppBar(titles[_page]),
      body: MyBrunchBody(_page),

    );

  }
}
