import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final String text;
  final Color color;
  final int maxLines;
  final double fontSize;
  final FontWeight fontWeight;
  final TextOverflow overflow;
  final TextAlign textAlign;
  final bool italic;

  const CustomText(
    this.text, {
    this.color = Colors.black,
    this.maxLines,
    this.fontSize,
    this.fontWeight,
    this.overflow,
    this.textAlign,
    this.italic = false,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: maxLines,
      style: TextStyle(
        color: color,
        fontSize: fontSize,
        fontWeight: fontWeight,
        fontStyle: italic ? FontStyle.italic : FontStyle.normal,
      ),
      textAlign: textAlign,
      overflow: overflow,
    );
  }
}
