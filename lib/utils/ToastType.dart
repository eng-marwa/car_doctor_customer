import 'package:flutter/material.dart';

enum  ToastType {
  success,
  error,
  warning,
  info,
  none
}
 final Map<ToastType, Color> toastTypeColors = {
  ToastType.success: Colors.green,
  ToastType.error: Colors.red,
  ToastType.warning: Colors.orange,
  ToastType.info: Colors.blue,
  ToastType.none: Colors.transparent, // Or any other default color
};
