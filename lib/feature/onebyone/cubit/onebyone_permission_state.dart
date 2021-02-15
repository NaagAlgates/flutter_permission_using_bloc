part of 'onebyone_permission_cubit.dart';

abstract class OnebyonePermissionState extends Equatable {
  const OnebyonePermissionState();

  @override
  List<Object> get props => [];
}

class OnebyonePermissionInitialState extends OnebyonePermissionState {}

class AllPermissionRecentlyGranted extends OnebyonePermissionState {}

class AllPermissionAlreadyGranted extends OnebyonePermissionState {}

class CurrentPermissionGranted extends OnebyonePermissionState {
  final PermissionRequestingModel permissionData;

  CurrentPermissionGranted({@required this.permissionData});
}

class CurrentPermissionDenied extends OnebyonePermissionState {
  final PermissionRequestingModel permissionData;

  CurrentPermissionDenied({@required this.permissionData});
}

class PermissionPermanentlyDenied extends OnebyonePermissionState {}

class PermissionRestricted extends OnebyonePermissionState {}

class PermissionNotFullyGranted extends OnebyonePermissionState {}

class RequestingPermission extends OnebyonePermissionState {
  final PermissionRequestingModel permissionData;

  RequestingPermission({@required this.permissionData});
}
