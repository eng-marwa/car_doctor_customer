import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomContainer extends StatelessWidget {
  Alignment? alignment;
  Color bgColor;
  Radius? circularRadius;
  bool allBorder = false;
  EdgeInsets? margin;

  EdgeInsets? padding;

  Widget? child;
  double? width;
  double? height;
  BoxConstraints? constraints;

  CustomContainer(
      {this.child,
      this.width = double.infinity,
      this.height = double.infinity,
      this.alignment,
      required this.bgColor,
      this.circularRadius,
      required this.allBorder,
      this.margin,
      this.padding,
      this.constraints});

  @override
  Widget build(BuildContext context) {
    return Container(
        child: child,
        height: height,
        width: width,
        padding: padding,
        margin: margin,
        alignment: alignment,
        constraints: constraints,
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: allBorder
              ? BorderRadius.all(circularRadius!)
              : BorderRadius.only(topRight: circularRadius!),
        ));
  }
}
