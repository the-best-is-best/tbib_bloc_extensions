import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// ignore: non_constant_identifier_names
var BlocExt = TBIBBlocExt();

class TBIBBlocExt {
  static GlobalKey<NavigatorState>? _navigationKey;

  static GlobalKey<NavigatorState>? get navigationKey => _navigationKey;

  static void init(GlobalKey<NavigatorState> sendNavigationKey) {
    _navigationKey = sendNavigationKey;
  }
}

extension ExtBlocExt on TBIBBlocExt {
  static late BuildContext _blocContext;

  set setBlocContext(BuildContext context) => _blocContext = context;

  T getBloc<T extends StateStreamableSource<Object?>>({
    BuildContext? context,
    bool listen = false,
  }) {
    try {
      // محاولة الحصول على الـ Bloc باستخدام السياق الحالي
      return BlocProvider.of<T>(_blocContext, listen: listen);
    } catch (_) {
      // في حال حدوث خطأ، استخدام السياق المرسل (إن وجد)
      if (context != null) {
        try {
          return BlocProvider.of<T>(context, listen: listen);
        } catch (_) {
          // إذا فشل، يتم استخدام navigationKey (إذا كانت متوفرة)
          if (TBIBBlocExt.navigationKey?.currentState?.context != null) {
            return BlocProvider.of<T>(
              TBIBBlocExt.navigationKey!.currentState!.context,
              listen: listen,
            );
          } else {
            throw FlutterError(
                'Navigation key or valid context is required to retrieve the Bloc.');
          }
        }
      }

      // في حال عدم وجود سياق وعدم توفر navigationKey
      throw FlutterError(
          'A valid BuildContext or NavigationKey is required to retrieve the Bloc.');
    }
  }
}
