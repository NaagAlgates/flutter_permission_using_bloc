import 'package:flutter_bloc/flutter_bloc.dart';

class AppBlocObserver extends BlocObserver {
  @override
  void onChange(Cubit cubit, Change change) {
    print(cubit);
    print(change);
    super.onChange(cubit, change);
  }

  @override
  void onClose(Cubit cubit) {
    print(cubit);
    super.onClose(cubit);
  }

  @override
  void onCreate(Cubit cubit) {
    print(cubit);
    super.onCreate(cubit);
  }

  @override
  void onError(Cubit cubit, Object error, StackTrace stackTrace) {
    print(cubit);
    print(error);
    print(stackTrace);
    super.onError(cubit, error, stackTrace);
  }

  @override
  void onEvent(Bloc bloc, Object event) {
    print(bloc);
    print(event);
    super.onEvent(bloc, event);
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    print(bloc);
    print(transition);
    super.onTransition(bloc, transition);
  }
}
