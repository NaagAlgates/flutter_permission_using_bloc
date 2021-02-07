import 'package:flutter/material.dart';

class CustomTextProperty {
  Color color = Colors.black;
  double textSize=15.0;
  FontWeight fontWeight = FontWeight.normal;

  CustomTextProperty({
    this.color,
    this.textSize,
    this.fontWeight,
  });

  CustomTextProperty.header1(BuildContext context):
      this.fontWeight = FontWeight.bold,
        this.textSize = MediaQuery.of(context).size.height * 0.05;

  CustomTextProperty.header2(BuildContext context):
        this.fontWeight = FontWeight.bold,
        this.textSize = MediaQuery.of(context).size.height * 0.04;

  CustomTextProperty.header3(BuildContext context):
        this.fontWeight = FontWeight.bold,
        this.textSize = MediaQuery.of(context).size.height * 0.02;

  CustomTextProperty copyWith({
    String displayText,
    Color color,
    double textSize,
  }) {
    return CustomTextProperty(
      color: color ?? this.color,
      textSize: textSize ?? this.textSize,
      fontWeight: fontWeight ?? this.fontWeight,
    );
  }

}
