import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

import '../../data/model/car/Car.dart';
import '../../di/AppModule.dart';
import 'CarState.dart';

@injectable
class UserCarCubit extends Cubit<CarState> {
  String value = 'سيدان';

  UserCarCubit() : super(CarInitial());
  bool isEmpty = true;

  void loadCars() async {
    try {
      emit(CarLoading());
      if (!isEmpty) {
        emit(CarInitial());
      } else {
        emit(CarLoaded());
      }
    } catch (e) {
      emit(CarError(e.toString()));
    }
  }

  void selectCar(String value) {
    this.value = value;
  }
}
