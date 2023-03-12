import 'package:bloc/bloc.dart';
import 'package:tbib_bloc_extensions/extensions/tbib_bloc_ext.dart';

part 'my_bloc_event.dart';
part 'my_bloc_state.dart';

class MyBlocBloc extends Bloc<MyBlocEvent, MyBlocState> {
  static MyBlocBloc get() => BlocExt.getBloc<MyBlocBloc>();
  String alert = "Bloc is worked";
  MyBlocBloc() : super(MyBlocInitial());
}
