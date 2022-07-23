import 'package:advanced_shop/presentation/resources/routes_manager.dart';
import 'package:advanced_shop/presentation/resources/theme_manager.dart';
import 'package:flutter/material.dart';

class MyApp extends StatefulWidget {
  const MyApp._internal(); // internal constructor.

  static const _instance = MyApp._internal(); // single instance -- Singleton.

  factory MyApp() => _instance; // factory for the class instance.

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: RoutesGenerator.getRoute,
      initialRoute: Routes.splashRoute,
      theme: kAppTheme,
    );
  }
}
