import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:halaexpenses/shared/brunch/brunch_app_bar.dart';
import 'package:halaexpenses/shared/brunch/brunch_body.dart';

class EditPage extends StatefulWidget {
  EditPage(this.page);
  int page;

  @override
  State<EditPage> createState() => _EditPage(page);
}

class _EditPage extends State<EditPage> {
  _EditPage(this._page);
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
