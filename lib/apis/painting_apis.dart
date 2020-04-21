import 'package:demo202/models/painting.dart';

import 'data.dart';

class PaintingApis {
  Future<List<Painting>> loadPaintings() async {
    await Future.delayed(
      Duration(seconds: 2),
    );
    return Data.getPaintings();
  }
}
