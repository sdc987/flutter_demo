import 'package:demo202/pages/details/details_page.dart';
import 'package:demo202/pages/menu/menu_page.dart';
import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage>
    with SingleTickerProviderStateMixin {
  AnimationController _animationController;
  bool _canBeDragged = false;
  static const double maxSlide = 150;
  static const double minDragStartEdge = 60;
  static const double maxDragStartEdge = maxSlide - 16;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 250),
    );
  }

  void close() => _animationController.reverse();

  void open() => _animationController.forward();

  @override
  void dispose() {
    super.dispose();
    _animationController?.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: GestureDetector(
        onHorizontalDragStart: _onDragStart,
        onHorizontalDragUpdate: _onDragUpdate,
        onHorizontalDragEnd: _onDragEnd,
        child: AnimatedBuilder(
          animation: _animationController,
          builder: (context, child) {
            double animValue = _animationController.value;
            final slideAmount = maxSlide * animValue;
            final contentScale = 1.0 - (0.3 * animValue);
            return Stack(
              children: <Widget>[
                MenuPage(
                  onSelect: this.close,
                ),
                Transform(
                  transform: Matrix4.identity()
                    ..translate(slideAmount)
                    ..scale(contentScale, contentScale),
                  alignment: Alignment.centerRight,
                  child: DetailsPage(
                    showMenu: this.open,
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  void _onDragStart(DragStartDetails details) {
    bool isDragOpenFromLeft = _animationController.isDismissed &&
        details.globalPosition.dx < minDragStartEdge;
    bool isDragCloseFromRight = _animationController.isCompleted &&
        details.globalPosition.dx > maxDragStartEdge;

    _canBeDragged = isDragOpenFromLeft || isDragCloseFromRight;
  }

  void _onDragUpdate(DragUpdateDetails details) {
    if (_canBeDragged) {
      double delta = details.primaryDelta / maxSlide;
      _animationController.value += delta;
    }
  }

  void _onDragEnd(DragEndDetails details) {
    if (_animationController.isDismissed || _animationController.isCompleted) {
      return;
    }
    if (_animationController.value < 0.5) {
      close();
      return;
    }
    open();
  }
}
