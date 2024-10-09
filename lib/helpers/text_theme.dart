import 'package:flutter/material.dart';
import 'colors.dart';

class CoolText extends StatelessWidget {
  final String text;
  final double fontSize;
  final double letterSpacing;

  CoolText(
    this.text, {
    this.fontSize = 10,
    this.letterSpacing = 2,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: ColorsPalette.color3,
        shadows: [
          Shadow(
            color: ColorsPalette.color3,
            blurRadius: 3,
            offset: Offset(
              0.9,
              0.9,
            ),
          ),
          Shadow(
            color: ColorsPalette.color3,
            blurRadius: 3,
            offset: Offset(
              1.2,
              1.2,
            ),
          ),
        ],
        fontSize: fontSize,
        fontWeight: FontWeight.w300,
        letterSpacing: letterSpacing,
      ),
    );
  }
}
