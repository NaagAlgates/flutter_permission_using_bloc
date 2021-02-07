import 'package:flutter/material.dart';
import 'package:flutter_permission_using_bloc/router/router_path.dart';

class FirstScreen extends StatelessWidget {
  const FirstScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("First Screen"),),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text("First screen"),
            RaisedButton(child: Text("Navigate to Second"),onPressed: (){
              Navigator.of(context).pushNamed(
                RouterPath.SECOND_SCREEN
              );
            },)
          ],
        ),
      ),
    );
  }
}