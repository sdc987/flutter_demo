import 'package:demo202/blocs/painting_bloc.dart';
import 'package:demo202/routes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Application extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provider<PaintingBloc>(
      create: (_) => PaintingBloc(),
      dispose: (_, value) => value.dispose(),
      child: MaterialApp(
        theme: ThemeData(
          appBarTheme: AppBarTheme(color: Colors.blue),
        ),
        initialRoute: '/',
        routes: routes,
      ),
    );
  }
}
