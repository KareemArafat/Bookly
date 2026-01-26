import 'package:flutter/material.dart';

class TextAnimation extends StatelessWidget {
  const TextAnimation({super.key, required this.textAnimation});

  final Animation<Offset> textAnimation;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: textAnimation,
      builder: (context, child) {
        return SlideTransition(
          position: textAnimation,
          child: Text('Read Your Favorite Books', textAlign: TextAlign.center),
        );
      },
    );
  }
}
