import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String title;
  Color textColor;
  Color bgColor;
  double? elevation;
  double? fontSize;
  final Function()? onClick;

  CustomButton(
      {Key? key,
      this.elevation = 20,
      required this.textColor,
      required this.title,
      required this.bgColor, this.fontSize = 24,
      this.onClick})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 2),
      child: Material(
        elevation: 5.0,
        color: bgColor,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(13.0)),
        child: MaterialButton(
          onPressed: onClick,
          minWidth: double.infinity,
          height: 50.0,
          child: Text(title,
              style: TextStyle(
                  fontWeight: FontWeight.bold, fontSize: fontSize, color: textColor)),
        ),
      ),
    );
  }
}
