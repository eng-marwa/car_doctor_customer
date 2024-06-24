import 'package:flutter/material.dart';

import '../../gen/colors.gen.dart';

PopupMenuItem buildPopupMenuItem(
    String title, IconData iconData, Function() onTap) {
  return PopupMenuItem(
    child: InkWell(
      onTap: onTap,
      child: Row(
        children: [
          Icon(
            iconData,
            color: ColorName.redColor,
          ),
          const SizedBox(
            width: 40,
          ),
          Text(
            title,
            style: const TextStyle(fontSize: 18),
          ),
        ],
      ),
    ),
  );
}
