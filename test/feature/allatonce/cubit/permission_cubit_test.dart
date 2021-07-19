import 'package:flutter_permission_using_bloc/feature/allatonce/cubit/permission_cubit.dart';
import 'package:flutter_permission_using_bloc/feature/allatonce/cubit/permission_state.dart';
import 'package:flutter_permission_using_bloc/feature/allatonce/model/permission_repository.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:mockito/mockito.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:permission_handler_platform_interface/permission_handler_platform_interface.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

void main() {
  group('Test the PermissionCubit states', () {
    PermissionCubit permissionCubit;
    setUp(() {
      permissionCubit = PermissionCubit();
      PermissionHandlerPlatform.instance = MockPermissionHandlerPlatform();
    });
    tearDown(() {
      permissionCubit?.close();
    });
    test('Test the initial state', () {
      expect(
          permissionCubit.state,
          WaitingForPermission(
              permissionRepository: PermissionRepository.waiting()));
    });

    /*final mockPermissionHandlerPlatform = PermissionHandlerPlatform.instance;
    when(mockPermissionHandlerPlatform
            .shouldShowRequestPermissionRationale(Permission.calendar))
        .thenAnswer((_) => Future.value(true));*/
    /*test('Test the all permission granted state', () {
      permissionCubit.checkIfPermissionNeeded();
      expect(
          PermissionCubit().state,
          WaitingForPermission(
              permissionRepository: PermissionRepository.granted()));
    });*/
  });
}

class MockPermissionHandlerPlatform extends Mock
    with
        // ignore: prefer_mixin
        MockPlatformInterfaceMixin
    implements
        PermissionHandlerPlatform {
  @override
  Future<PermissionStatus> checkPermissionStatus(Permission permission) =>
      Future.value(PermissionStatus.granted);

  @override
  Future<ServiceStatus> checkServiceStatus(Permission permission) =>
      Future.value(ServiceStatus.enabled);

  @override
  Future<bool> openAppSettings() => Future.value(true);

  @override
  Future<Map<Permission, PermissionStatus>> requestPermissions(
      List<Permission> permissions) {
    var permissionsMap = <Permission, PermissionStatus>{};
    return Future.value(permissionsMap);
  }

  @override
  Future<bool> shouldShowRequestPermissionRationale(Permission permission) {
    return super.noSuchMethod(
      Invocation.method(
        #shouldShowPermissionRationale,
        [permission],
      ),
      returnValue: Future.value(true),
    );
  }
}
