import 'dart:async';
import 'dart:developer';

import 'package:designers_app_ui/data/constants/constants.dart';
import 'package:designers_app_ui/providers/providers.dart';
import 'package:designers_app_ui/routes/dashboard.dart';
import 'package:designers_app_ui/routes/error.dart';
import 'package:designers_app_ui/routes/home.dart';
import 'package:extensionresoft/helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fontresoft/fontresoft.dart';
import 'package:go_router/go_router.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
    DeviceOrientation.landscapeRight,
    DeviceOrientation.landscapeLeft,
  ]).then(appCallback);
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (BuildContext context, WidgetRef ref, Widget? child) {
        var state = ref.watch(themeProvider.select((value) => value));
        log(state.toString());
        return MaterialApp.router(
          debugShowCheckedModeBanner: false,
          title: Constants.appName,
          themeMode: condition(state, ThemeMode.light, ThemeMode.dark),
          theme: ThemeData(
            useMaterial3: true,
            brightness: Brightness.light,
            colorSchemeSeed: Colors.purpleAccent,
            fontFamily: FontResoft.sansPro,
            package: FontResoft.package,
            highlightColor: Colors.transparent,
            splashColor: Colors.transparent,
            typography: Typography.material2021(englishLike: Typography.dense2021),
            textTheme: const TextTheme(bodyMedium: TextStyle(color: Colors.white)),
          ),
          darkTheme: ThemeData(
            useMaterial3: true,
            brightness: Brightness.dark,
            colorSchemeSeed: Colors.purple,
            fontFamily: FontResoft.inter,
            package: FontResoft.package,
            highlightColor: Colors.transparent,
            splashColor: Colors.transparent,
            textTheme: const TextTheme(bodyMedium: TextStyle()),
          ),
          routeInformationProvider: _router.routeInformationProvider,
          routeInformationParser: _router.routeInformationParser,
          routerDelegate: _router.routerDelegate,
          shortcuts: {
            ...WidgetsApp.defaultShortcuts,
            const SingleActivator(LogicalKeyboardKey.select): const ActivateIntent(),
          },
          localizationsDelegates: const [],
        );
      },
    );
  }

  final GoRouter _router = GoRouter(
    routes: <GoRoute>[
      route(Constants.root, const Dashboard()),
      route(Constants.dashboard, const Dashboard()),
      route(Constants.home, const Home()),
      route(Constants.error, const ErrorPage()),
    ],
    errorBuilder: (context, state) => const ErrorPage(),
  );
}

GoRoute route(String path, Widget route) {
  return routeTransition(path, route);
  /*return GoRoute(
    path: path,
    builder: (BuildContext context, GoRouterState state) => route,
  );*/
}

GoRoute routeTransition(String path, Widget route) {
  return GoRoute(
    path: path,
    pageBuilder: (context, state) => CustomTransitionPage(
      child: route,
      transitionsBuilder: (context, animation, _, child) => FadeTransition(
        opacity: CurvedAnimation(parent: animation, curve: Curves.easeInOutBack),
        child: child,
      ),
      transitionDuration: const Duration(seconds: 1),
    ),
  );
}

launch(BuildContext context, String route, [Object? extra]) {
  GoRouter.of(context).push(route, extra: extra);
}

FutureOr appCallback(void value) {
  runApp(
    ProviderScope(
      child: MyApp(),
    ),
  );
}
