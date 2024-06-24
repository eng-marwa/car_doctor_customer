import 'package:car_doctor/data/model/car/Car.dart';
import 'package:flutter/material.dart';

import '../../data/model/car/ProducTypeEnum.dart';
import 'MyCarState.dart';

@immutable
abstract class MyCarState {}

class MyCarInitial extends MyCarState {}

class MyCarAdded extends MyCarState {}

class MyCarDeleted extends MyCarState {}

class MyCarEdited extends MyCarState {}

class MyCarLoaded extends MyCarState {
  final List<Car> cars;

  MyCarLoaded(this.cars);
}

class MyCarLoading extends MyCarState {}

class ProductTypeSelected extends MyCarState {
  final ProductTypeEnum type;

  ProductTypeSelected(this.type);
}

class MyCarSelected extends MyCarState {
  final Car selectedCar;

  MyCarSelected(this.selectedCar);
}

class MyCarError extends MyCarState {
  final String message;

  MyCarError(this.message);
}
