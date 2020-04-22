import 'package:demo202/blocs/painting_bloc.dart';
import 'package:demo202/models/painting.dart';
import 'package:demo202/pages/menu/widgets/message.dart';
import 'package:demo202/pages/menu/widgets/painting_container.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MenuPage extends StatelessWidget {
  const MenuPage({
    Key key,
    this.onSelect,
  }) : super(key: key);

  final Function onSelect;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Material(
      child: Container(
        height: size.height,
        width: size.width,
        alignment: Alignment.topLeft,
        child: Consumer<PaintingBloc>(
          builder: (_, bloc, child) {
            return StreamBuilder<List<Painting>>(
              stream: bloc.paintings,
              builder: (context, snapshot) {
                if (snapshot.hasError)
                  return MessageWidget(message: 'Error Loading Records');

                if (!snapshot.hasData)
                  return MessageWidget(message: 'No Records');

                var paintings = snapshot.data;
                return SizedBox(
                  width: 200,
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(top: 40),
                        child:
                            Text('Paintings', style: TextStyle(fontSize: 20)),
                      ),
                      Expanded(
                        child: ListView(
                          padding: EdgeInsets.all(0),
                          children: paintings
                              .map(
                                (painting) => GestureDetector(
                                  onTap: () {
                                    bloc.setPainting(painting);
                                    this.onSelect();
                                  },
                                  child: PaintingContainer(
                                    painting: painting,
                                  ),
                                ),
                              )
                              .toList(),
                        ),
                      ),
                    ],
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
