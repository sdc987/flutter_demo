import 'package:demo202/application.dart';
import 'package:demo202/blocs/painting_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitDown,
    DeviceOrientation.portraitUp,
  ]);

  runApp(
    Provider<PaintingBloc>(
      create: (_) => PaintingBloc(),
      dispose: (_, value) => value.dispose(),
      child: Application(),
    ),
  );
}
