import 'package:flutter/material.dart';

import 'CarState.dart';
@immutable
abstract class CarState {}

class CarInitial extends CarState {}

class CarAdded extends CarState {}

class CarDeleted extends CarState {}

class CarEdited extends CarState {}

class CarLoaded extends CarState {}

class CarLoading extends CarState {}

class CarSelected extends CarState {
  final String value;

  CarSelected(this.value);
}

class CarError extends CarState {
  final String message;

  CarError(this.message);
}
