import 'package:flutter/material.dart';

class defaultTextButton extends StatelessWidget {
  Function()? onPressed;
  String? text;
  FontWeight? fontWeight;
  double? fontSize;
  FontStyle? fontStyle;
  TextOverflow? overflow;
  Color? color;
  defaultTextButton({
    this.text,
    this.onPressed,
    this.color,
    this.fontSize,
    this.fontStyle,
    this.fontWeight,
    this.overflow,
  });
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Text(
        '$text'.toUpperCase(),
        style: TextStyle(
          color: color,
          fontWeight: fontWeight,
          fontSize: fontSize,
          fontStyle: fontStyle,
          overflow: overflow,
        ),
      ),
    );
  }
}
