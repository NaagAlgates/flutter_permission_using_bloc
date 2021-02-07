import 'package:flutter/material.dart';

import 'custom_text_property.dart';

class CustomTextView extends StatelessWidget {
  final String displayText;
  final CustomTextProperty customTextProperty;

  const CustomTextView(
      {Key key, @required this.customTextProperty, @required this.displayText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Text(
        displayText,
        textAlign: TextAlign.center,
        style: TextStyle(
            fontSize: customTextProperty.textSize,
            color: customTextProperty.color,
            fontWeight: customTextProperty.fontWeight),
        maxLines: 2,
      ),
    );
  }
}
