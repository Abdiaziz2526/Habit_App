import 'package:flutter/material.dart';

class AppText extends StatelessWidget {
  final String text;
  final Color? color;
  final double size;
  final TextAlign textAlign;
  final FontWeight fontWeight;

  const AppText({
    Key? key,
    required this.text,
    this.color,
    this.size = 14.0, // Default size
    this.textAlign = TextAlign.left, // Default alignment
    this.fontWeight = FontWeight.normal, // Default weight
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      style: TextStyle(
        fontSize: size,
        color: color,
      
        fontWeight: fontWeight,
      ),
    );
  }
}
