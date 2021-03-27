import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'Helper/Router.dart';
import 'Helper/ThemeType.dart';

void main() => runApp(
    ChangeNotifierProvider<ThemeModel>(
        create: (BuildContext context){
          ThemeModel presentTheme=ThemeModel();
          return presentTheme;},
        child: MyApp()));

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: Provider.of<ThemeModel>(context).currentTheme,
      onGenerateRoute: RouterModule.generateRoute,
      initialRoute: '/',
    );
  }
}

