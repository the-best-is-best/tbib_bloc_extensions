import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:tbib_bloc_extensions/extensions/tbib_bloc_ext.dart';

part 'my_bloc_event.dart';
part 'my_bloc_state.dart';

class MyBlocBloc extends Bloc<MyBlocEvent, MyBlocState> {
  String alert = "Bloc is worked";
  MyBlocBloc() : super(MyBlocInitial());
  static MyBlocBloc get(BuildContext context) => BlocExt.getBloc<MyBlocBloc>();
}
