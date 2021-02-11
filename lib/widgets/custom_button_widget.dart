import 'package:flutter/material.dart';

class CustomMaterialButton extends StatelessWidget {
  final onButtonPressed;
  final buttonText;

  const CustomMaterialButton(
      {Key key, @required this.onButtonPressed, @required this.buttonText})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      disabledColor: Colors.grey,
      onPressed: onButtonPressed,
      splashColor: Colors.greenAccent,
      color: Colors.green,
      minWidth: MediaQuery.of(context).size.width * 0.8,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(MediaQuery.of(context).size.width*0.05),
      ),
      animationDuration: Duration(seconds: 1),
      child: Padding(
        padding: EdgeInsets.all(MediaQuery.of(context).size.width*0.03),
        child: Text(buttonText?.toString()?.toUpperCase() ?? "DEFAULT",
            textAlign: TextAlign.center,
            style: TextStyle(
                color: Colors.white,
                fontSize: MediaQuery.of(context).size.height * 0.025,
                fontWeight: FontWeight.bold)),
      ),
    );
  }
}
