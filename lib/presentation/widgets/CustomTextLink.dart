import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextLink extends StatelessWidget {
  final String text;
  bool isMultiline = false;
  final int? maxLines;
  Color textColor;
  double? fontSize = 20;
  TextStyle? textStyle;
  TextAlign? textAlign;
  Alignment? alignment;
  TextDirection? textDirection;
  final Function()? onClick;

  CustomTextLink(
      {Key? key,
      required this.text,
      this.isMultiline = false,
      this.maxLines,
      this.fontSize,
      this.textAlign,
      required this.textColor,
      this.alignment,
      this.onClick,
      this.textStyle, this.textDirection})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: alignment ?? Alignment.center,
      child: TextButton(
        onPressed: onClick,
        child: Text(text,textDirection: textDirection,
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: fontSize,
                color: textColor,
                decoration: TextDecoration.underline , decorationColor: textColor)),
      ),
    );
  }
}
