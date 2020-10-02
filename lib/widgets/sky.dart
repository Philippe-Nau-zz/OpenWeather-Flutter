import 'package:flutter/material.dart';

class Sky extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Colors.blue[900],
            Colors.blueAccent[700],
            Colors.indigo[400],
          ],
          stops: [0.2, 0.6, 1],
        ),
      ),
    );
  }
}
