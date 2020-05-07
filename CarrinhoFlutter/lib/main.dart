import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'codes/defines.dart';
import 'codes/routes.dart';

void main() =>
    runApp(
      MultiProvider(
          providers: Routes.getProviders(),
          child: MyApp()),
    );

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      onGenerateRoute:(settings)=>Routes.getRoute(settings) ,
      onGenerateTitle: (BuildContext context) =>'titulo',
      //initialRoute: Routes.test,// '/',
      initialRoute: '/',
      //routes: Routes.getRoutes(),
      theme: Defines.currentTheme.theme,
    );
  }

}