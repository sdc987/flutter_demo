import 'package:flutter/foundation.dart';

class Painting {
  Painting({
    @required this.name,
    @required this.imageName,
    @required this.bio,
  });

  final String name;
  final String imageName;
  final String bio;
}
