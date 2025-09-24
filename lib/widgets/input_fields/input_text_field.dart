import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../res/color.dart';


class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final String suffixImage;
  final String? prefixImage;
  final String? Function(String?) validator;

  CustomTextField({
    super.key,
    required this.controller,
    required this.hintText,
    required this.suffixImage,
    this.prefixImage, required this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: validator,
      keyboardType: TextInputType.emailAddress,
      style: TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.w600,
      ),
      cursorColor: Colors.black,
      decoration: InputDecoration(
        fillColor: Colors.white,
        hintText: hintText,
        hintStyle: TextStyle(
          fontWeight: FontWeight.w500,
          color: Colors.black,
        ),
        suffixIcon: Image.asset(suffixImage),
        prefixIcon: prefixImage != null ? Image.asset(prefixImage!) : null,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.r),
          borderSide: BorderSide(
            color: AppColors.borderColor
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.r),
          borderSide: BorderSide(
              color: AppColors.borderColor
          ),
        ),
      ),
    );
  }
}
