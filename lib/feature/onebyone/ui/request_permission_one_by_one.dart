import 'package:flutter/material.dart';
import 'package:flutter_permission_using_bloc/feature/onebyone/widget/permission_screen_widget.dart';

class RequestPermissionOneByOne extends StatefulWidget {
  RequestPermissionOneByOne({Key key}) : super(key: key);

  @override
  _RequestPermissionOneByOneState createState() =>
      _RequestPermissionOneByOneState();
}

class _RequestPermissionOneByOneState extends State<RequestPermissionOneByOne> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
            child: Container(
                padding: EdgeInsets.all(20.0),
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                child: PermissionRequestingScreen())));
  }
}
