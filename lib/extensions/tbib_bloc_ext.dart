import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TBIBBlocExt {}

// ignore: non_constant_identifier_names
var BlocExt = TBIBBlocExt();

extension ExtBlocExt on TBIBBlocExt {
  static late BuildContext blocContext;
  set setBlocContext(context) => blocContext = context;
  //BuildContext get getBlocContext => blocContext;
  T getBloc<T extends StateStreamableSource<Object?>>() =>
      BlocProvider.of<T>(blocContext);
}
