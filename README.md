# TBIB_Bloc_Extensions

Use this extension to get your bloc and access it without context

## note v1.0.2 solve can't get bloc if bloc in runApp see how init package

```dart
// 1- need to create navigation key 
  GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

 // 2 in material app or cupertino app
 MitXMaterialApp(
            navigatorKey: navigatorKey,
            ....
            builder: (context, child) {
              TBIBBlocExt.init(navigatorKey);
              ....
              return child!
            }
 );
```

## Usage

```dart
  // Don't use BlocProvider() but use  BlocProviderContext
  BlocProviderContext(
     create: (context) => YourBloc(),
      child: child
  );

```

- When need to get your bloc

```dart
    // don't use BlocProvider.of<YourBloc>(context) use
     BlocExt.getBloc<YourBloc>();

```

## Come see how library work

```dart

// widget BlocProviderContext
    @override
        Widget build(BuildContext context) {
            return BlocProvider(
                create: create,
                child: Builder(builder: (context) {
                BlocExt.setBlocContext = context; // see i get your context and send it to static variable
                return child;
            }),
        );
   }

   BlocExt.getBloc<YourBloc>() // it use BlocProvider.of<T>(_blocContext)

```

- Thank You.
