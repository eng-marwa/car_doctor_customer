import 'package:car_doctor/gen/colors.gen.dart';
import 'package:flutter/material.dart';

class CustomStep extends StatelessWidget {
  bool isActive = false;
  int number = 1;
  Color fontColor = ColorName.whiteColor;

  CustomStep(
      {required this.isActive,
      required this.number,
      this.fontColor = ColorName.whiteColor});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Row(
        children: [
          Container(
            alignment: Alignment.center,
            height: 30,
            width: 30,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: isActive
                    ? ColorName.blueColor
                    : ColorName.secondBeigeF0Color),
            child: Text(
              '$number',
              style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: ColorName.whiteColor),
            ),
          ),
        ],
      ),
    );
  }
}
