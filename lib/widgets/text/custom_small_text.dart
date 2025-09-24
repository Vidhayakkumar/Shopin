import 'package:flutter/material.dart';


class CustomSmallText extends StatelessWidget {
  final String text;
  final double fontSize;
  final Color?  textColor;
  final TextOverflow? overflow;
  final FontWeight? fontFamily;
  const CustomSmallText({
    super.key,
    required this.text,
    required this.fontSize,
    this.overflow,
    this.fontFamily,
    this.textColor
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: TextAlign.center,
      style: TextStyle(
          fontSize: fontSize,
          color: textColor != null? textColor: Colors.black,
          overflow: overflow,
          fontWeight: fontFamily
      ),
    );
  }
}
