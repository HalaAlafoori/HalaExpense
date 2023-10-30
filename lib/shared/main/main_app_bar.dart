import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/theme_provider.dart';



class MyMainAppBar extends StatefulWidget implements PreferredSizeWidget {
  final String title;
  final Function(String) onChanged;
  final Function refresh;



  const MyMainAppBar( this.title,  this.onChanged,this.refresh);

  @override
  _MyMainAppBarState createState() => _MyMainAppBarState();

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}

class _MyMainAppBarState extends State<MyMainAppBar> {
  bool _isSearching = false;
  TextEditingController _searchController = TextEditingController();

  void _startSearch() {
    setState(() {
      _isSearching = true;
    });
  }

  void _stopSearch() {
    setState(() {
      _isSearching = false;
      _searchController.clear();
      widget.refresh();


    });
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading:
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 18.0),
        child: IconButton(
          onPressed: () {
           // Provider.of<ThemeProvider>(context, listen: false).toggleTheme();
            context.read<ThemeProvider>().toggleTheme();
          },
          icon: Consumer<ThemeProvider>(
            builder: (context, themeProvider, _) {
              return Icon(
                themeProvider.isDarkMode
                    ? Icons.light_mode // Light mode icon
                    : Icons.dark_mode, // Dark mode icon
                size: 25,
              );
            },
          ),
        ),
      ),
      title: _isSearching
          ? TextField(
        controller: _searchController,
        decoration: InputDecoration(
          hintText: 'Search',
          hintStyle: TextStyle(color:ThemeProvider.getTitle(context)),
        ),
        style: TextStyle(color:ThemeProvider.getTitle(context)),
        autofocus: true,
        onChanged: widget.onChanged,
      )
          : Text(
        widget.title,
        style: TextStyle(
          color:ThemeProvider.getTitle(context),
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
      centerTitle: true,
      actions: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 7.0, horizontal: 20.0),
          child: IconButton(
            icon: _isSearching ? Icon(Icons.close) : Icon(Icons.search),
            onPressed: () {
              if (_isSearching) {
                //search and val=""
                _stopSearch();
              } else {
                _startSearch();
              }
            },
          ),
        ),
      ],
    );
  }
}