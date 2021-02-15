import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_permission_using_bloc/feature/allatonce/cubit/permission_cubit.dart';
import 'package:flutter_permission_using_bloc/feature/allatonce/ui/request_permission_all_at_once.dart';
import 'package:flutter_permission_using_bloc/feature/common/home/ui/first_screen.dart';
import 'package:flutter_permission_using_bloc/feature/common/second/ui/second_screen.dart';
import 'package:flutter_permission_using_bloc/feature/main/ui/main_menu_screen.dart';
import 'package:flutter_permission_using_bloc/feature/onebyone/cubit/onebyone_permission_cubit.dart';
import 'package:flutter_permission_using_bloc/feature/onebyone/ui/request_permission_one_by_one.dart';
import 'package:flutter_permission_using_bloc/feature/splash/ui/splash_screen.dart';
import 'package:flutter_permission_using_bloc/router/router_path.dart';

class AppRouter {
  Route onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case RouterPath.LANDING_SCREEN:
        return MaterialPageRoute(builder: (_) => SplashScreen());
        break;
      case RouterPath.PERMISSION_ALL_AT_ONCE:
        return MaterialPageRoute(
            builder: (_) => BlocProvider<PermissionCubit>(
                create: (_) => PermissionCubit(),
                child: RequestPermissionScreen()));
        break;
      case RouterPath.PERMISSION_ONE_BY_ONE:
        return MaterialPageRoute(
            builder: (_) => BlocProvider<OnebyonePermissionCubit>(
                create: (_) => OnebyonePermissionCubit(),
                child: RequestPermissionOneByOne()));
        break;
      case RouterPath.FIRST_SCREEN:
        return MaterialPageRoute(builder: (_) => FirstScreen());
        break;
      case RouterPath.SECOND_SCREEN:
        return MaterialPageRoute(builder: (_) => SecondScreen());
        break;
      case RouterPath.MAINMENU_SCREEN:
        return MaterialPageRoute(builder: (_) => MainmenuScreen());
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
