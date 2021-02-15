import 'package:flutter/material.dart';

import 'main_menu_widget.dart';

class MainmenuScreen extends StatefulWidget {
  MainmenuScreen({Key key}) : super(key: key);

  @override
  _MainmenuScreenState createState() => _MainmenuScreenState();
}

class _MainmenuScreenState extends State<MainmenuScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Mainmenu"),
        ),
        body: MainmenuWidget());
  }
}
