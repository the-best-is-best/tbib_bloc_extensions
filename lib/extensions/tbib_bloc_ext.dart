import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TBIBBlocExt {
  static GlobalKey<NavigatorState>? navigationKey;

  static void init(GlobalKey<NavigatorState> sendNavigationKey) {
    navigationKey = sendNavigationKey;
  }
}

// ignore: non_constant_identifier_names
var BlocExt = TBIBBlocExt();

extension ExtBlocExt on TBIBBlocExt {
  static late BuildContext _blocContext;
  set setBlocContext(context) => _blocContext = context;
  //BuildContext get getBlocContext => blocContext;
  T getBloc<T extends StateStreamableSource<Object?>>(
      {bool? listen, BuildContext? context}) {
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
