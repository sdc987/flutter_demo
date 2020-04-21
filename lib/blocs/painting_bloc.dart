import 'package:demo202/apis/painting_apis.dart';
import 'package:demo202/models/painting.dart';
import 'package:rxdart/rxdart.dart';

class PaintingBloc {
  PaintingApis _api = PaintingApis();
  var _paintingsSubject = BehaviorSubject<List<Painting>>();
  var _paintingSubject = PublishSubject<Painting>();

  PaintingBloc() {
    loadPaintings();
  }

  Stream<List<Painting>> get paintings => _paintingsSubject.stream;
  Stream<Painting> get painting => _paintingSubject.stream;

  setPainting(Painting painting) {
    if (painting != null) {
      _paintingSubject.sink.add(painting);
    }
  }

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
    _paintingSubject?.close();
  }
}
