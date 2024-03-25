import 'package:flutter/material.dart';



// ignore: must_be_immutable
class CustomText extends StatelessWidget {
  final String text;
   TextAlign? textAlign;
  TextOverflow? overflow;
  final double fontSize;
  final Color fontColor;
  final FontWeight fontWeight;
   CustomText({
    Key? key,
    required this.text,
     this.textAlign,
     this.overflow,
    required this.fontSize,
    required this.fontColor,
    required this.fontWeight,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      overflow: overflow,
      style: TextStyle(
        color: fontColor,
        fontSize: fontSize,
        fontWeight: fontWeight,
      ),
    );
  }
}
