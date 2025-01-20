import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// ignore: non_constant_identifier_names
var BlocExt = TBIBBlocExt();

class TBIBBlocExt {
  static GlobalKey<NavigatorState>? _navigationKey;

  static GlobalKey<NavigatorState>? get navigationKey => _navigationKey;

  @Deprecated("Not need use it")
  static void init(GlobalKey<NavigatorState> sendNavigationKey) {
    _navigationKey = sendNavigationKey;
  }
}

extension ExtBlocExt on TBIBBlocExt {
  static late BuildContext _blocContext;
  set setBlocContext(context) => _blocContext = context;
  //BuildContext get getBlocContext => blocContext;
  T getBloc<T extends StateStreamableSource<Object?>>(BuildContext? context,
      {bool? listen}) {
    try {
      return BlocProvider.of<T>(context ?? _blocContext,
          listen: listen ?? false);
    } catch (_) {
      return BlocProvider.of<T>(
          TBIBBlocExt.navigationKey!.currentState!.context,
          listen: listen ?? false);
    }
  }
}
