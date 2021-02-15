import 'package:flutter_permission_using_bloc/feature/allatonce/cubit/permission_cubit.dart';
import 'package:flutter_permission_using_bloc/feature/allatonce/cubit/permission_state.dart';
import 'package:flutter_permission_using_bloc/feature/allatonce/model/permission_repository.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Test the initial state is WaitingForPermission', () {
    test('initial state is waiting', () {
      expect(
          PermissionCubit().state,
          WaitingForPermission(
              permissionRepository: PermissionRepository.waiting()));
    });
  });
}
