import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_permission_using_bloc/feature/permission/cubit/permission_cubit.dart';
import 'package:flutter_permission_using_bloc/feature/permission/ui/request_permission_screen.dart';
import 'package:flutter_permission_using_bloc/feature/splash/ui/splash_screen.dart';
import 'package:flutter_permission_using_bloc/router/router_path.dart';

class AppRouter {
  Route onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case RouterPath.LANDING_SCREEN:
        return MaterialPageRoute(builder: (_) => SplashScreen());
        break;
      case RouterPath.PERMISSION_SCREEN:
        return MaterialPageRoute(builder: (_) => BlocProvider<PermissionCubit>(
          create:(_)=> PermissionCubit(),
          child: RequestPermissionScreen()));
        break;
      default:
        return MaterialPageRoute(
            builder: (_) => Center(
                    child: Container(
                  child: Text("Error screen"),
                )));
        break;
    }
  }
}
