import 'package:book_store/core/utils/app_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'app_colors.dart';
import 'navigation.dart';

class Functions {
  //! show dialog error message
  static void showErrorDialog(BuildContext context,
      {required String message, Color color = AppColors.black}) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            content: Text(
              message,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: color,
                fontSize: 18.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
            actions: [
              TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: AppColors.grey,
                ),
                onPressed: () {
                  Navigation.pop(context);
                },
                child: Text(
                  AppStrings.ok,
                  style: TextStyle(
                    fontSize: 16.sp,
                    color: AppColors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          );
        });
  }

  static void showToast({
    required String message,
    Color? color,
    ToastGravity? gravity,
  }) {
    Fluttertoast.showToast(
      msg: message,
      fontSize: 18.sp,
      textColor: AppColors.black,
      
      backgroundColor: color ?? AppColors.primaryColor,
      toastLength: Toast.LENGTH_LONG,
      gravity: gravity ?? ToastGravity.BOTTOM,
    );
  }
}
