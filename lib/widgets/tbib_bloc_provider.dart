import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:tbib_bloc_extensions/extensions/tbib_bloc_ext.dart';

class BlocProviderContext<T extends StateStreamableSource<Object?>>
    extends StatelessWidget {
  final Create<T> create;
  final Widget child;

  const BlocProviderContext({
    Key? key,
    required this.create,
    required this.child,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: create,
      child: Builder(builder: (context) {
        BlocExt.setBlocContext = context;
        return child;
      }),
    );
  }
}

class MultiBlocProviderContext extends StatelessWidget {
  final List<SingleChildWidget> providers;
  final Widget child;

  const MultiBlocProviderContext({
    Key? key,
    required this.providers,
    required this.child,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: providers,
      child: Builder(builder: (context) {
        BlocExt.setBlocContext = context;
        return child;
      }),
    );
  }
}

class RepositoryProviderContext<T> extends StatelessWidget {
  final Create<T> create;
  final Widget child;

  const RepositoryProviderContext({
    Key? key,
    required this.create,
    required this.child,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: create,
      child: Builder(builder: (context) {
        BlocExt.setBlocContext = context;
        return child;
      }),
    );
  }
}

class MultiRepositoryProviderContext extends StatelessWidget {
  final List<SingleChildWidget> providers;
  final Widget child;

  const MultiRepositoryProviderContext({
    Key? key,
    required this.providers,
    required this.child,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: providers,
      child: Builder(builder: (context) {
        BlocExt.setBlocContext = context;
        return child;
      }),
    );
  }
}
