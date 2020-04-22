import 'package:demo202/utils/string_extension.dart';
import 'package:demo202/models/painting.dart';
import 'package:flutter/material.dart';

class PaintingContainer extends StatelessWidget {
  const PaintingContainer({
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
