
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../res/color.dart';

class CustomRoundedButton extends StatelessWidget {
  final String btnName;
  final VoidCallback onPress;
  final bool isLoading;
  final double? width;

  const CustomRoundedButton({
    super.key,
    required this.btnName,
    required this.onPress,
    this.isLoading = false,
    this.width,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: isLoading ? null : onPress,
      child: Container(
        width: width == 0? double.infinity: width,
        height: 45.h,
        decoration: BoxDecoration(
          color: AppColors.btnColor,
          borderRadius: BorderRadius.circular(15.r),
        ),
        child: Center(
          child: isLoading
              ? SizedBox(
            height: 20,
            width: 20,
            child: CircularProgressIndicator(
              color: Colors.white,
              strokeWidth: 2,
            ),
          )
              : Text(
            btnName,
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
