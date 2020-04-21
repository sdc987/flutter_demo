import 'package:demo202/blocs/painting_bloc.dart';
import 'package:demo202/models/painting.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<PaintingBloc>(
      builder: (_, bloc, child) {
        return StreamBuilder<Painting>(
            stream: bloc.painting,
            builder: (context, snapshot) {
              var name = 'No record';

              if (snapshot.hasData) {
                var painting = snapshot.data;
                name = painting.name;
              }

              return Scaffold(
                appBar: AppBar(title: Text(name)),
                body: Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey, width: 1.0),
                    ),
                    child: Column(
                      children: <Widget>[],
                    )),
              );
            });
      },
    );
  }
}
