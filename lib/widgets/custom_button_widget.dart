import 'package:flutter/material.dart';

class CustomMaterialButton extends StatelessWidget {
  final onButtonPressed;
  final buttonText;

  const CustomMaterialButton({Key key, @required this.onButtonPressed, @required this.buttonText}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      disabledColor: Colors.grey,
      onPressed: onButtonPressed,
      splashColor: Colors.green,
      color: Colors.green,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Text(buttonText?.toString()?.toUpperCase()??"DEFAULT",
            textAlign: TextAlign.center,
            style: TextStyle(
                color: Colors.white,
                fontSize: MediaQuery.of(context).size.height*0.025,
                fontWeight: FontWeight.bold)),
      ),
    );
  }
}
