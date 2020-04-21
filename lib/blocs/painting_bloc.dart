import 'package:demo202/apis/painting_apis.dart';
import 'package:demo202/models/painting.dart';
import 'package:rxdart/rxdart.dart';

class PaintingBloc {
  PaintingApis _api = PaintingApis();
  BehaviorSubject<List<Painting>> _paintingsSubject =
      BehaviorSubject<List<Painting>>();

  PaintingBloc() {
    loadPaintings();
  }

  Stream<List<Painting>> get paintings => _paintingsSubject.stream;

  void loadPaintings() async {
    try {
      var paintings = await _api.loadPaintings();
      _paintingsSubject.add(paintings);
    } catch (e) {
      _paintingsSubject.addError(e);
    }
  }

  void dispose() {
    _paintingsSubject?.close();
  }
}
