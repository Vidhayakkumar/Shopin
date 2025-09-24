import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../res/color.dart';


class DoubleText extends StatelessWidget {
  final String fstText;
  final String lstText;
  final Color? fstColor;
  final Color? lstColor;
  final VoidCallback? onTap;
  const DoubleText({
    super.key,
    required this.fstText,
    required this.lstText,
    this.lstColor,
    this.fstColor,
    this.onTap
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(fstText,style: TextStyle(
          color: fstColor?? Colors.black,
          fontSize: 15.sp

        ),),
        InkWell(
          onTap: onTap,
          child: Text(lstText,style: TextStyle(
            color: fstColor?? AppColors.btnColor,
            fontWeight: FontWeight.bold,
              fontSize: 15.sp

          ),),
        )
      ],
    );
  }
}
