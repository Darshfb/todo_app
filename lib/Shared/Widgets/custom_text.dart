import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  String? text;
  Color? color;
  FontWeight? fontWeight;
  double? fontSize;
  FontStyle? fontStyle;
  TextOverflow? overflow;
  int? maxLines;
  TextAlign? textAlign;
  TextDecoration? textDecoration;

  CustomText({
    this.text,
    this.maxLines,
    this.textDecoration,
    this.textAlign,
    this.color,
    this.fontWeight,
    this.fontSize,
    this.fontStyle,
    this.overflow,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text!,
      style: TextStyle(
        color: color,
        fontWeight: fontWeight,
        fontSize: fontSize,
        fontStyle: fontStyle,
        overflow: overflow,
        decoration: textDecoration,
      ),
      maxLines: maxLines,
      textAlign: textAlign,
    );
  }
}
