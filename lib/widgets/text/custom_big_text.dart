import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class CustomBigText extends StatelessWidget {
  final String text;
  final double fontSize;
  final TextOverflow? overflow;
  const CustomBigText({
    super.key,
    required this.text,
    required this.fontSize,
    this.overflow
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: TextAlign.center,
      style: TextStyle(
          height: 0,
          fontSize: fontSize,
          color: Colors.black,
          fontWeight: FontWeight.bold,
          overflow: overflow
      ),
    );
  }
}
