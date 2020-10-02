import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class AnimatedMoreInfo extends StatefulWidget {
  @override
  _AnimatedMoreInfoState createState() => _AnimatedMoreInfoState();
}

class _AnimatedMoreInfoState extends State<AnimatedMoreInfo>
    with SingleTickerProviderStateMixin {
  AnimationController _animationController;
  double _heightContainer = 0.07;
  double _opacity = 0.0;
  bool _isVisible = false;
  Color _iconColor = Colors.white70;

  @override
  void initState() {
    _animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 500));
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _animationController.dispose();
  }

  showMoreInformation() {
    setState(() {
      _isVisible = !_isVisible;
      if (_isVisible) {
        _animationController.forward();
        _heightContainer = 0.3;
        _opacity = 0.9;
        _iconColor = Colors.indigo[900];
      } else {
        _animationController.reverse();
        _heightContainer = 0.07;
        _opacity = 0.0;
        _iconColor = Colors.white70;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      dragStartBehavior: DragStartBehavior.start,
      onVerticalDragEnd: (_) => showMoreInformation(),
      child: AnimatedContainer(
        duration: Duration(milliseconds: 500),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * _heightContainer,
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(_opacity),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
        ),
        child: Column(
          children: [
            RotationTransition(
              turns: Tween(begin: 0.0, end: 0.5).animate(
                CurvedAnimation(
                  parent: _animationController,
                  curve: Curves.fastLinearToSlowEaseIn,
                ),
              ),
              child: IconButton(
                onPressed: showMoreInformation,
                icon: Icon(
                  Icons.keyboard_arrow_up,
                  size: 40,
                  color: _iconColor,
                ),
              ),
              //listview horizontal
            )
          ],
        ),
      ),
    );
  }
}
