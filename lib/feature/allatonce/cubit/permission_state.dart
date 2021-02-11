
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_permission_using_bloc/model/permission_repository.dart';
import 'package:permission_handler/permission_handler.dart';

abstract class PermissionState extends Equatable {
  final Permission currentPermission;
  const PermissionState({@required this.currentPermission, @required this.permissionRepository});
  final PermissionRepository permissionRepository;

  @override
  List<Object> get props => [currentPermission, permissionRepository];
}

class WaitingForPermission extends PermissionState {
  final PermissionRepository permissionRepository;
  WaitingForPermission({@required this.permissionRepository});
}

class AllPermissionsGranted extends PermissionState {
  final PermissionRepository permissionRepository;
  AllPermissionsGranted({@required this.permissionRepository});
}

class PermissionDenied extends PermissionState {
  final PermissionRepository permissionRepository;
  PermissionDenied({@required this.permissionRepository,
    @required Permission currentPermission});
}

class PermissionPermanentlyDenied extends PermissionState {
  final PermissionRepository permissionRepository;
  PermissionPermanentlyDenied({@required this.permissionRepository,
    @required Permission currentPermission});
}

class PermissionRestricted extends PermissionState {
  final PermissionRepository permissionRepository;
  PermissionRestricted({@required this.permissionRepository,
    @required Permission currentPermission});
}



class PermissionNeeded extends PermissionState {
  final PermissionRepository permissionRepository;
  PermissionNeeded({@required this.permissionRepository});
}
