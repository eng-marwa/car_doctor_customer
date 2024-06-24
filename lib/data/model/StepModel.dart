import 'package:flutter/material.dart';

class StepModel {
  final String title;
  final Widget content;
  final bool isActive;
  final StepState state;
  String subtitle;

  StepModel({
    required this.title,
    this.content = const SizedBox.shrink(),
    required this.isActive,
    required this.state,
    required this.subtitle,
  });

  StepModel copyWith({
    String? title,
    Widget? content,
    bool? isActive,
    StepState? state,
    String? subtitle,
  }) {
    return StepModel(
      title: title ?? this.title,
      content: content ?? this.content,
      isActive: isActive ?? this.isActive,
      state: state ?? this.state,
      subtitle: subtitle ?? this.subtitle,
    );
  }
}
