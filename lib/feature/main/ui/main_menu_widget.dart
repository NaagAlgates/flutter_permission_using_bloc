import 'package:flutter/material.dart';
import 'package:flutter_permission_using_bloc/router/router_path.dart';
import 'package:flutter_permission_using_bloc/widgets/custom_button_widget.dart';

class MainmenuWidget extends StatelessWidget {
  const MainmenuWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          CustomMaterialButton(
            buttonText: "All at once",
            onButtonPressed: () {
              Navigator.of(context).pushNamed(RouterPath.PERMISSION_ALL_AT_ONCE);
            },
          ),
          CustomMaterialButton(
            buttonText: "One by one",
            onButtonPressed: () {
              Navigator.of(context).pushNamed(RouterPath.PERMISSION_ONE_BY_ONE);
            },
          ),
          CustomMaterialButton(
            buttonText: "Only one",
            onButtonPressed: () {
              Navigator.of(context).pushNamed(RouterPath.PERMISSION_ALL_AT_ONCE);
            },
          ),
        ],
      ),
    );
  }
}
