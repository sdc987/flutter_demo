import 'package:demo202/pages/home/home_page.dart';
import 'package:demo202/pages/menu/menu_page.dart';
import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Stack(
        children: <Widget>[
          MenuPage(),
          HomePage(),
        ],
      ),
    );
  }
}
