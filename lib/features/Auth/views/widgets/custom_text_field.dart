import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/app_colors.dart';

// ignore: must_be_immutable
class CustomTextFeild extends StatelessWidget {
  final String hintText;
  final double hintTextSize;
  final IconData suffixIcon;
  final Color suffixIconColor;
  final double suffixIconSize;
  final TextInputType keyboardType;
  final bool visible ;
   TextEditingController? controller;
   String? Function(String?)? validator;
  CustomTextFeild({
    Key? key,
    required this.hintText,
    required this.hintTextSize,
    required this.suffixIcon,
    required this.suffixIconColor,
    required this.suffixIconSize,
    required this.keyboardType,
     this.visible = false,
    this.controller,
    this.validator,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: visible,
      keyboardType: keyboardType,
      controller: controller,
      validator: validator,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(10.r),
          ),
          borderSide: BorderSide.none,
        ),
        fillColor: AppColors.grey,
        filled: true,
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(10.r),
          ),
        ),
        suffixIcon: Icon(
          suffixIcon,
          size: suffixIconSize,
        ),
        suffixIconColor: suffixIconColor,
        hintText: hintText,
        
        hintStyle: TextStyle(
          color: AppColors.black2,
          fontSize: hintTextSize,
          fontWeight: FontWeight.w400,
        ),
      ),
    );
  }
}
