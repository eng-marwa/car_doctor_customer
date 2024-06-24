
import 'package:flutter/material.dart';

import '../../gen/colors.gen.dart';
import '../ToastType.dart';

extension Toast on Widget{
  void showToast(BuildContext context, String message, {required Duration duration, required ToastType type}) {
    final scaffold = ScaffoldMessenger.of(context);
    scaffold.showSnackBar(
      SnackBar(
        content: Text(message,style: const TextStyle(color: ColorName.whiteColor),),duration: duration,backgroundColor: type == ToastType.success ? Colors.green : Colors.red,
      ),
    );
  }
}