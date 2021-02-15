import 'package:permission_handler/permission_handler.dart';

class ResourceConstants {
  static String appName = "Flutter Permissions";
  static String buttonTextDefault = "Allow";
  static String buttonTextSuccess = "Continue";
  static String buttonTextPermanentlyDenied = "Settings";
  static String titleDefault = "Permission Needed";
  static String displayMessageDefault =
      "To serve you the best user experience we need few permission. Please allow it.";
  static String displayMessageSuccess =
      "Success, all permissions are granted. Please click the below button to continue.";
  static String displayMessageDenied =
      "To serve you the best user experience we need few permission but it seems like you denied.";
  static String displayMessagePermanentlydenied =
      "To serve you the best user experience we need few permission but it seems like you permanently denied it. Please goto settings and enable it manually to proceed further.";

  static List<Permission> permissionList = [
    Permission.storage,
    Permission.camera,
    Permission.locationWhenInUse
  ];
}
