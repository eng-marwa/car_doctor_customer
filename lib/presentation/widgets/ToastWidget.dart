import 'package:flutter/material.dart';

import '../../gen/colors.gen.dart';
import '../../utils/ToastType.dart';
import 'CustomContainer.dart';

class ToastWidget extends StatelessWidget {
  String text='';
  ToastType? type;

  ToastWidget({required this.text,type = ToastType.info});
  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      bgColor: toastTypeColors[type] ?? ColorName.transparent,
      allBorder: true,
      circularRadius: const Radius.circular(20),
      width: 370,
      height: 40,
      padding: const EdgeInsets.all(8.0),
      margin: const EdgeInsets.all(10.0),
      alignment: Alignment.center,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.close),
            color: ColorName.whiteColor,
            padding: EdgeInsets.only(top: 1),
          ),
          Expanded(
            child: Text(text,
                style: TextStyle(color: ColorName.whiteColor, fontSize: 13)),
          ),
        ],
      ),
    );
  }
}
