import 'package:car_doctor/presentation/resources/ColorManager.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  String label;
  Alignment? alignment;
  TextAlign? textAlign;
  Color? textColor;
  double? fontSize;
  TextInputType? type;
  String? fieldLabel;
  final String? Function(String?) checkValidation;
  final TextEditingController? controller;

  CustomTextField(
      {required this.label,
      this.alignment,
      this.textAlign,
      this.textColor,
      this.fontSize,
      required this.controller,
      required this.checkValidation,
      this.type = TextInputType.text,
      this.fieldLabel = ''});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: alignment ?? Alignment.center,
          child: Padding(
            padding: EdgeInsets.all(8.0),
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
          keyboardType: type,
          controller: controller,
          validator: checkValidation,
          maxLines: 1,
          decoration: InputDecoration(
            hintText: fieldLabel,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            filled: true,
            fillColor: ColorsManager.bgTextField,
          ),
        ),
      ],
    );
  }
}
