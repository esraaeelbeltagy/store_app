
import 'package:flutter/material.dart';


class CustomButton extends StatelessWidget {
  final double width;
  final double height;
  final void Function()? onTap;
  final String text;
  final Color backGroundColor;
  final Color textColor;
  final double fontSize;
  final double borderRadius;
  final FontWeight fontWeight;
  const CustomButton({
    Key? key,
    required this.width,
    required this.height,
    required this.onTap,
    required this.text,
    required this.backGroundColor,
    required this.textColor,
    required this.fontSize,
    required this.borderRadius,
    required this.fontWeight,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: backGroundColor,
      borderRadius: BorderRadius.circular(borderRadius),
      child: InkWell(
        borderRadius: BorderRadius.circular(borderRadius),
        onTap: onTap,
        child: Container(
          width: width,
          height: height,
          decoration: BoxDecoration(
            color: backGroundColor,
            borderRadius: BorderRadius.all(
              Radius.circular(borderRadius),
            ),
          ),
          child: Center(
            child: Text(
              text,
              style: TextStyle(
                color: textColor,
                fontSize: fontSize,
                fontWeight: fontWeight,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
