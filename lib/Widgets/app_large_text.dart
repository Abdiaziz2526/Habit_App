import 'package:flutter/material.dart';

class AppLargeText extends StatelessWidget {
  final String text;
  final Color? color;
  final double size;
  final TextAlign textAlign;

  const AppLargeText({
    Key? key,
    required this.text,
    this.color,
    this.size = 24.0, // Default size
    this.textAlign = TextAlign.left, // Default alignment
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      style: TextStyle(
        fontSize: size,
        color: color ?? Theme.of(context).primaryColor, // Use provided color or default to theme color
        fontWeight: FontWeight.bold, // Example weight
      ),
    );
  }
}
