import 'package:flutter/material.dart';

class ProgressBarIndicator extends StatelessWidget {
  const ProgressBarIndicator({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(),
    );
  }
}
