import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_permission_using_bloc/feature/onebyone/cubit/onebyone_permission_cubit.dart';
import 'package:flutter_permission_using_bloc/feature/onebyone/widget/progress_bar.dart';
import 'package:flutter_permission_using_bloc/router/router_path.dart';
import 'package:flutter_permission_using_bloc/widgets/custom_button_widget.dart';
import 'package:flutter_permission_using_bloc/widgets/custom_text_property.dart';
import 'package:flutter_permission_using_bloc/widgets/custom_text_widget.dart';

class PermissionRequestingScreen extends StatelessWidget {
  const PermissionRequestingScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<OnebyonePermissionCubit, OnebyonePermissionState>(
            listener: (context, state) {
              if (state is AllPermissionAlreadyGranted) {
                naviagteToNextScreen(context);
              }
            },
            builder: (_, state) {
              var permissionCubit = context.watch<OnebyonePermissionCubit>();
              var permissionState =
                  context.watch<OnebyonePermissionCubit>().state;
              if (state is OnebyonePermissionInitialState) {
                permissionCubit.checkIfPermissionNeeded();
                return ProgressBarIndicator();
              }
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CustomTextView(
                        displayText: getTitle(permissionState),
                        customTextProperty:
                            CustomTextProperty.header1(context)),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Icon(
                      IconData(loadIcon(permissionState),
                          fontFamily: 'MaterialIcons'),
                      color: Colors.green,
                      size: MediaQuery.of(context).size.height * 0.2,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CustomTextView(
                        displayText: getMesage(permissionState),
                        customTextProperty:
                            CustomTextProperty.header3(context)),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CustomMaterialButton(
                        buttonText: getButtonText(permissionState),
                        onButtonPressed: () {
                          if (state is PermissionNotFullyGranted) {
                            permissionCubit.onRequestInitialPermission();
                          } else if (permissionState
                              is AllPermissionRecentlyGranted) {
                            naviagteToNextScreen(context);
                          } else {
                            permissionCubit.onRequestPermisionOneByOne();
                          }
                        }),
                  )
                ],
              );
            },
          );
  }

  getTitle(permissionState) {
    String displayText = "Permission Needed";

    if (permissionState is RequestingPermission) {
      displayText = permissionState.permissionData.title;
    } else if (permissionState is CurrentPermissionGranted) {
      displayText = "Permission Granted";
    } else if (permissionState is CurrentPermissionDenied) {
      displayText = "Permission Granted";
    } else if (permissionState is AllPermissionRecentlyGranted) {
      displayText = "That's all folks";
    }
    return displayText;
  }

  getMesage(permissionState) {
    String message =
        "To serve you the best user experience we need few permission. Please allow it.";
    if (permissionState is RequestingPermission) {
      message = permissionState.permissionData.message;
    } else if (permissionState is CurrentPermissionGranted) {
      message = permissionState.permissionData.onSuccess;
    } else if (permissionState is CurrentPermissionDenied) {
      message = permissionState.permissionData.onFailure;
    } else if (permissionState is AllPermissionRecentlyGranted) {
      message = "Wondeful. You have granted all permissions.";
    }
    return message;
  }

  getButtonText(permissionState) {
    String text = "Understood";
    if (permissionState is RequestingPermission) {
      text = "Allow";
    } else if (permissionState is CurrentPermissionGranted) {
      text = "Next";
    } else if (permissionState is CurrentPermissionDenied) {
      text = "Retry";
    } else if (permissionState is AllPermissionRecentlyGranted) {
      text = "Continue";
    }
    return text;
  }

  int loadIcon(permissionState) {
    var icon = 0xe843;
    if (permissionState is RequestingPermission) {
      icon = permissionState.permissionData.icon;
    } else if (permissionState is CurrentPermissionGranted) {
      icon = 0xe845;
    } else if (permissionState is CurrentPermissionDenied) {
      icon = 0xe843;
    } else if (permissionState is AllPermissionRecentlyGranted) {
      icon = 0xe845;
    }
    return icon;
  }

  

  void naviagteToNextScreen(context) {
    Navigator.of(context).pushNamedAndRemoveUntil(
        RouterPath.FIRST_SCREEN, (Route<dynamic> route) => false);
  }
}