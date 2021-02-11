import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_permission_using_bloc/router/router.dart';
import 'helper/bloc_observer.dart';
import 'model/permission_repository.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = AppBlocObserver();
  runApp(MyApp(
    appRouter: AppRouter(),
    permissionRepository: PermissionRepository.unknown(),));
}

class MyApp extends StatelessWidget {
  final AppRouter appRouter;
  final PermissionRepository permissionRepository;

  const MyApp({Key key, @required this.appRouter, @required this.permissionRepository}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Permission Demo',
      theme: ThemeData(
        primarySwatch: Colors.green,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      debugShowCheckedModeBanner: false,
      onGenerateRoute: appRouter.onGenerateRoute,
    );
  }
}