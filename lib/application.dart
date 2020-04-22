import 'package:demo202/routes.dart';
import 'package:flutter/material.dart';

class Application extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        appBarTheme: AppBarTheme(color: Colors.blue),
      ),
      initialRoute: '/',
      routes: routes,
    );
  }
}
