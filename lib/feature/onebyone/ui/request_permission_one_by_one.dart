import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_permission_using_bloc/feature/allatonce/cubit/permission_cubit.dart';
import 'package:flutter_permission_using_bloc/feature/allatonce/cubit/permission_state.dart';
import 'package:flutter_permission_using_bloc/router/router_path.dart';
import 'package:flutter_permission_using_bloc/widgets/custom_button_widget.dart';
import 'package:flutter_permission_using_bloc/widgets/custom_text_property.dart';
import 'package:flutter_permission_using_bloc/widgets/custom_text_widget.dart';

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
          child: BlocConsumer<PermissionCubit, PermissionState>(
              listener: (context, state) {
            if (state is AllPermissionsGranted) {
              Navigator.of(context).pushNamedAndRemoveUntil(
                  RouterPath.FIRST_SCREEN, (Route<dynamic> route) => false);
            }
          }, listenWhen: (previous, current) {
            return (current is AllPermissionsGranted);
          }, builder: (context, state) {
            var permissionCubit = context.watch<PermissionCubit>();
            permissionCubit.checkIfPermissionNeeded();
            if (state is AllPermissionsGranted ||
                state is WaitingForPermission) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CustomTextView(
                      displayText: state?.permissionRepository?.displayTitle ??
                          "Permission Needed",
                      customTextProperty: CustomTextProperty.header1(context)),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Icon(
                    Icons.lock,
                    color: Colors.green,
                    size: MediaQuery.of(context).size.height * 0.2,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CustomTextView(
                      displayText: state?.permissionRepository?.displayMessage ??
                          "To serve you the best user experience we need few permission. Please allow it.",
                      customTextProperty: CustomTextProperty.header3(context)),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CustomMaterialButton(
                      buttonText:
                          state?.permissionRepository?.buttonText ?? "Allow",
                      onButtonPressed: () {
                        if (state.permissionRepository.isGranted) {
                          Navigator.of(context).pushNamed(
                            RouterPath.FIRST_SCREEN,
                          );
                        } else {
                          return permissionCubit.onRequestAllPermission();
                        }
                      }),
                )
              ],
            );
          }),
        )));
  }
}
