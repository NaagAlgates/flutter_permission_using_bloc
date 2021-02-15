import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_permission_using_bloc/feature/onebyone/model/permision_requesting_model.dart';
import 'package:flutter_permission_using_bloc/helper/app_resource_constants.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:flutter/services.dart' show rootBundle;

part 'onebyone_permission_state.dart';

const PATH_TO_PERMISSION_RESOURCE = 'assets/resources/permision_resources.json';

class OnebyonePermissionCubit extends Cubit<OnebyonePermissionState> {
  OnebyonePermissionCubit() : super(OnebyonePermissionInitialState());
  static Map<String, dynamic> permissionResource;

  Future<void> checkIfPermissionNeeded() async {
    for (var _currentPermission in ResourceConstants.permissionList) {
      var status = await _currentPermission.status;
      if (!status.isGranted) {
        if (permissionResource == null || permissionResource.isEmpty) {
          permissionResource = json.decode(await readPermissionResourceData());
        }
        emit(PermissionNotFullyGranted());
        return;
      }
    }
    emit(AllPermissionAlreadyGranted());
  }

  void onRequestInitialPermission() {
    if (ResourceConstants.permissionList != null &&
        ResourceConstants.permissionList.length > 0) {
      var _currentPermissionString =
          ResourceConstants.permissionList.first.toString().split('.');
      fetchPermission(_currentPermissionString);
      // var isPermissionAvailable =
      //     permissionResource.containsKey(_currentPermissionString.last);
      // if (isPermissionAvailable) {
      //   var value = permissionResource[_currentPermissionString.last];
      //   if (value == null || value.isEmpty) {
      //     throw Exception("Null detected in the permission resource");
      //   }
      //   emit(RequestingPermission(
      //       permissionData: PermissionRequestingModel.fromMap(value)));
      // }
    }
  }

  fetchPermission(currentPermissionString) {
    var isPermissionAvailable =
        permissionResource.containsKey(currentPermissionString.last);
    if (isPermissionAvailable) {
      var value = permissionResource[currentPermissionString.last];
      if (value == null || value.isEmpty) {
        throw Exception("Null detected in the permission resource");
      }
      emit(RequestingPermission(
          permissionData: PermissionRequestingModel.fromMap(value)));
      return value;
    }
  }

  void onRequestPermisionOneByOne() async {
    for (var _currentPermission in ResourceConstants.permissionList) {
      var status = await _currentPermission.status;
      if (status.isUndetermined || status.isDenied) {
        var _currentPermissionString = _currentPermission.toString().split('.');
        var tempMapdata = fetchPermission(_currentPermissionString);
        // var isPermissionAvailable =
        //     permissionResource.containsKey(_currentPermissionString.last);
        // if (isPermissionAvailable) {
        //   var value = permissionResource[_currentPermissionString.last];
        //   if (value == null || value.isEmpty) {
        //     throw Exception("Null detected in the permission resource");
        //   }
        //   emit(RequestingPermission(
        //       permissionData: PermissionRequestingModel.fromMap(value)));
        status = await _currentPermission.request();
        if (status.isDenied) {
          emit(CurrentPermissionDenied(
              permissionData: PermissionRequestingModel.fromMap(
                 tempMapdata )));
          return;
        } else if (status.isPermanentlyDenied) {
          onPermissionPermanentlyDenied();
          return;
        } else if (status.isRestricted) {
          onPermissionRestricted();
          return;
        } else {
          ResourceConstants.permissionList.remove(_currentPermission);
          emit(CurrentPermissionGranted(
              permissionData: PermissionRequestingModel.fromMap(tempMapdata)));
          return;
        }
      }
      print("Permission granted: ${_currentPermission.toString()}");

      return;
    }
    onPermissionGranted();
  }

  void onPermissionPermanentlyDenied() {
    emit(PermissionPermanentlyDenied());
  }

  void onPermissionRestricted() {
    emit(PermissionRestricted());
  }

  void onPermissionGranted() {
    emit(AllPermissionRecentlyGranted());
  }

  @override
  String toString() =>
      'PermissionCubit(permissionList: ${ResourceConstants.permissionList})';

  Future<String> readPermissionResourceData() {
    return rootBundle.loadString(PATH_TO_PERMISSION_RESOURCE);
  }
}
