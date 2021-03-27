
import 'package:flutter/material.dart';
import 'package:theme_boilerplate_code/src/HomePage.dart';
import 'package:theme_boilerplate_code/src/ThemeSelector.dart';

class RouterModule {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => HomePage());
      case '/ThemeSelector':
        return MaterialPageRoute(builder: (_) => ThemeSelector());
      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
              body: Center(
                  child: Text('No route defined for ${settings.name}')),
            ));
    }
  }
}
