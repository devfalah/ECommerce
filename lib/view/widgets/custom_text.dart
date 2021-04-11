import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final String text;
  final double fontSize;
  final double height;
  final Color color;
  final Alignment alignment;
  final int maxLine;

  const CustomText({
    this.text: '',
    this.height: 1,
    this.fontSize: 16,
    this.color: Colors.black,
    this.alignment: Alignment.topLeft,
    this.maxLine,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: alignment,
      child: Text(
        text,
        maxLines: maxLine,
        style: TextStyle(
          fontSize: fontSize,
          color: color,
          height: height,
        ),
      ),
    );
  }
}
