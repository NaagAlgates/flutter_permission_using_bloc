import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_permission_using_bloc/feature/allatonce/cubit/permission_state.dart';
import 'package:flutter_permission_using_bloc/model/permission_repository.dart';
import 'package:permission_handler/permission_handler.dart';

class PermissionCubit extends Cubit<PermissionState> {
  List<Permission> permissionList = [
    Permission.storage,
    Permission.camera,
    Permission.locationWhenInUse
  ];

  PermissionCubit()
      : super(WaitingForPermission(
            permissionRepository: PermissionRepository.waiting()));
  Permission currentPermission;

  void onAllPermissionGranted() {
    emit(AllPermissionsGranted(
        permissionRepository: PermissionRepository.granted()));
  }

  Future<void> checkIfPermissionNeeded() async {
    for (var _currentPermission in permissionList) {
      currentPermission = _currentPermission;
      var status = await _currentPermission.status;
      if (!status.isGranted) {
        emit(PermissionNeeded(
            permissionRepository: PermissionRepository.waiting()));
        return;
      }
    }
    onAllPermissionGranted();
  }

  Future<void> onRequestAllPermission() async {
    for (var _currentPermission in permissionList) {
      currentPermission = _currentPermission;
      var status = await _currentPermission.status;

      if (status.isUndetermined || status.isDenied) {
        status = await _currentPermission.request();
        if (status.isDenied) {
          onPermissionDenied();
          return;
        }
      } else if (status.isPermanentlyDenied) {
        onPermissionPermanentlyDenied();
        return;
      } else if (status.isRestricted) {
        onPermissionRestricted();
        return;
      }
      print("Permission granted: ${currentPermission.toString()}");
    }
    for (var _currentPermission in permissionList) {
      var status = await _currentPermission.status;
      if (!status.isGranted) {
        return;
      }
    }
    onAllPermissionGranted();
  }

  void onPermissionDenied() {
    emit(PermissionDenied(
        currentPermission: currentPermission,
        permissionRepository: PermissionRepository.denied()));
  }

  void onPermissionPermanentlyDenied() {
    emit(PermissionPermanentlyDenied(
        currentPermission: currentPermission,
        permissionRepository: PermissionRepository.permanentlyDenied()));
  }

  void onPermissionRestricted() {
    emit(PermissionRestricted(
        currentPermission: currentPermission,
        permissionRepository: PermissionRepository.permanentlyDenied()));
  }

  @override
  String toString() => 'PermissionCubit(permissionList: $permissionList)';
}
