import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_permission_using_bloc/feature/permission/cubit/permission_cubit.dart';
import 'package:flutter_permission_using_bloc/feature/permission/cubit/permission_file.dart';
import 'package:flutter_permission_using_bloc/router/router_path.dart';
import 'package:flutter_permission_using_bloc/widgets/custom_button_widget.dart';
import 'package:flutter_permission_using_bloc/widgets/custom_text_property.dart';
import 'package:flutter_permission_using_bloc/widgets/custom_text_widget.dart';

class RequestPermissionScreen extends StatefulWidget {
  RequestPermissionScreen({Key key}) : super(key: key);

  @override
  _RequestPermissionScreenState createState() =>
      _RequestPermissionScreenState();
}

class _RequestPermissionScreenState extends State<RequestPermissionScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(20.0),
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: BlocConsumer<PermissionCubit, PermissionState>(
              listener: (context, state) {
            if (state is AllPermissionsGranted) {
              Navigator.of(context).pushNamed(
                RouterPath.FIRST_SCREEN,
              );
            }
          }, listenWhen: (previous, current) {
            return (current is AllPermissionsGranted);
          }, builder: (context, state) {
            var permissionCubit = context.watch<PermissionCubit>();
            permissionCubit.checkIfPermissionNeeded();
            if (state is AllPermissionsGranted || state is WaitingForPermission) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  Icons.lock,
                  color: Colors.green,
                  size: MediaQuery.of(context).size.height * 0.2,
                ),
                CustomTextView(
                    displayText:
                    state?.permissionRepository?.displayTitle ??
                            "Permission Needed",
                    customTextProperty: CustomTextProperty.header1(context)),
                CustomTextView(
                    displayText: state
                            ?.permissionRepository?.displayMessage ??
                        "To serve you the best user experience we need few permission. Please allow it.",
                    customTextProperty: CustomTextProperty.header3(context)),
                CustomMaterialButton(
                    buttonText:
                    state?.permissionRepository?.buttonText ??
                            "Allow",
                    onButtonPressed: () {
                      if (state.permissionRepository.isGranted) {
                        Navigator.of(context).pushNamed(
                          RouterPath.FIRST_SCREEN,
                        );
                      } else {
                        return permissionCubit.onRequestAllPermission();
                      }
                    }),
              ],
            );
          }),
        ),
      ),
    );
  }
}
