import 'package:flutter_bloc/flutter_bloc.dart';
import 'custom_log.dart';

class MyBlocObserver extends BlocObserver {
  @override
  void onCreate(BlocBase bloc) {
    super.onCreate(bloc);
    Log.p('onCreate -- ${bloc.runtimeType}', tag: 'BlocObserver',);
  }

  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    Log.p('onChange -- ${bloc.runtimeType}, $change', tag: 'BlocObserver',);
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    super.onError(bloc, error, stackTrace);
    Log.p('onError -- ${bloc.runtimeType}, $error', tag: 'BlocObserver',);
  }

  @override
  void onClose(BlocBase bloc) {
    super.onClose(bloc);
    Log.p('onClose -- ${bloc.runtimeType}', tag: 'BlocObserver',);
  }
}