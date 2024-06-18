import 'package:flame/game.dart';
import 'package:flutter/material.dart';

OverlayWidgetBuilder pauseBuilder = (BuildContext context, Game game) {
  return Center(
    child: Container(
      width: 200,
      height: 200,
      color: const Color(0x88FFFFFF),
      child: const Center(
        child: Text(
          'PAUSED',
          style: TextStyle(
            color: Color(0xFF000000),
            fontSize: 48,
          ),
        ),
      ),
    ),
  );
};

OverlayWidgetBuilder heartsBuilder = (BuildContext context, Game game) {
  return const Positioned(
    top: 0,
    right: 0,
    child: SizedBox(
      width: 200,
      height: 75,
      child: Center(
          child: Row(
        children: [
          Icon(Icons.favorite, color: Color.fromARGB(255, 255, 0, 0)),
          Icon(Icons.favorite, color: Color.fromARGB(255, 255, 0, 0)),
          Icon(Icons.favorite, color: Color.fromARGB(255, 255, 0, 0)),
          Icon(Icons.favorite, color: Color.fromARGB(255, 255, 0, 0)),
          Icon(Icons.favorite, color: Color.fromARGB(255, 255, 0, 0)),
        ],
      )),
    ),
  );
};
