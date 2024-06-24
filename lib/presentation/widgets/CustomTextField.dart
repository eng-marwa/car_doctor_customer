import 'package:flutter/material.dart';

import '../../gen/colors.gen.dart';

class CustomTextField extends StatelessWidget {
  String label;
  Alignment? alignment;
  TextAlign? textAlign;
  Color? textColor;
  double? fontSize;
  TextInputType? type;
  String? fieldLabel;
  int? maxLines;
  int? minLines;
  final bool enabled;

  final String? Function(String?)? checkValidation;
  final Function(String)? onValueChanged;
  final TextEditingController? controller;
  String errorText = '';

  CustomTextField({
    required this.label,
    this.alignment,
    this.textAlign,
    this.textColor,
    this.fontSize,
    required this.controller,
    this.checkValidation,
    this.onValueChanged,
    this.errorText = '',
    this.type = TextInputType.text,
    this.fieldLabel = '',
    this.maxLines,
    this.minLines,
    this.enabled = true, // Default to true for editable
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: alignment ?? Alignment.center,
          child: Padding(
            padding: EdgeInsets.all(5.0),
            child: Text(
              label,
              textAlign: textAlign,
              style: TextStyle(
                color: textColor,
                fontSize: fontSize,
              ),
            ),
          ),
        ),
        TextFormField(
          enabled: enabled,
          keyboardType: type,
          controller: controller,
          // validator: checkValidation,
          maxLines: maxLines ?? 1,
          minLines: minLines,
          onChanged: onValueChanged,
          decoration: InputDecoration(
            hintText: fieldLabel,
            errorText: errorText,
            hintTextDirection: TextDirection.rtl,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            filled: true,
            fillColor: ColorName.bgTextField,
          ),
        ),
      ],
    );
  }
}
