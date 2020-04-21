import 'package:demo202/blocs/painting_bloc.dart';
import 'package:demo202/models/painting.dart';
import 'package:demo202/utils/string_extension.dart';
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
                  return _MessageWidget(message: 'Error Loading Records');

                if (!snapshot.hasData)
                  return _MessageWidget(message: 'No Records');

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
                                  child: _PaintingContainer(
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

class _PaintingContainer extends StatelessWidget {
  const _PaintingContainer({
    Key key,
    this.painting,
  }) : super(key: key);
  final Painting painting;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(5),
      padding: EdgeInsets.all(10),
      height: 150,
      width: 150,
      child: ClipOval(
        child: Image.asset(
          painting.imageName.assetPath(),
        ),
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey, width: 1.0),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.grey,
            offset: Offset(5, 5),
          ),
        ],
      ),
    );
  }
}

class _MessageWidget extends StatelessWidget {
  const _MessageWidget({
    Key key,
    this.message,
  }) : super(key: key);

  final String message;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        message,
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}
