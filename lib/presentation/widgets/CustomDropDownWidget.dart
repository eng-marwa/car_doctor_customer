import 'package:flutter/material.dart';

import '../../gen/colors.gen.dart';

class CustomDropDownWidget<T> extends StatelessWidget {
  String label;
  Alignment? alignment;
  TextAlign? textAlign;
  Color? textColor;
  double? fontSize;
  List<T> items = [];
  T? value;
  final Function(T value)? onItemSelected;

  CustomDropDownWidget(
      {required this.label,
      this.alignment,
      this.textAlign,
      this.textColor,
      this.fontSize = 14,
      this.items = const [],
      this.value,
      this.onItemSelected});

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
        Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: ColorName.bgTextField,
            ),
            child: DropdownButtonFormField(
                dropdownColor: Colors.grey.shade300,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                )),
                value: value,
                items: items
                    .map((e) => DropdownMenuItem(value: e, child: Text('$e')))
                    .toList(),
                onChanged: (value) {
                  onItemSelected!(value as T);})),
      ],
    );
  }
}
