import 'package:demo202/models/painting.dart';
import 'package:flutter/material.dart';
import 'package:demo202/utils/string_extension.dart';

class SliverPage extends StatelessWidget {
  const SliverPage({
    Key key,
    @required this.painting,
    @required this.showMenu,
  }) : super(key: key);

  final Painting painting;
  final Function showMenu;

  @override
  Widget build(BuildContext context) {
    return Container(
      key: ValueKey(painting.imageName),
      color: Colors.white,
      child: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            floating: false,
            pinned: true,
            leading: IconButton(
              icon: Icon(
                Icons.menu,
                color: Colors.white,
              ),
              onPressed: showMenu,
            ),
            title: Text(painting.name),
            expandedHeight: 600.0,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.asset(
                painting.imageName.assetPath(),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate([
              Container(
                padding: EdgeInsets.all(10),
                child: Text(
                  painting.bio,
                  textDirection: TextDirection.ltr,
                ),
              ),
            ]),
          )
        ],
      ),
    );
  }
}
