import 'package:flutter/material.dart';

class NoRecordPage extends StatelessWidget {
  const NoRecordPage({
    Key key,
    this.showMenu,
  }) : super(key: key);

  final Function showMenu;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.menu,
            color: Colors.white,
          ),
          onPressed: showMenu,
        ),
        title: Text('No Records'),
      ),
      body: Container(
        color: Colors.black45,
      ),
    );
  }
}
