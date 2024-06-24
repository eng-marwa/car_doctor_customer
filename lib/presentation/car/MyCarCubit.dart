import 'package:bloc/bloc.dart';
import 'package:car_doctor/data/model/Client.dart';
import 'package:car_doctor/data/model/car/Car.dart';
import 'package:car_doctor/data/model/car/ProducTypeEnum.dart';
import 'package:car_doctor/domain/usecases/car/AddCar.dart';
import 'package:car_doctor/domain/usecases/car/DeleteCar.dart';
import 'package:car_doctor/domain/usecases/car/EditCar.dart';
import 'package:car_doctor/domain/usecases/car/ViewCars.dart';
import 'package:car_doctor/domain/usecases/car/ViewUserCars.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

import '../../di/AppModule.dart';
import 'MyCarState.dart';

@injectable
class MyCarCubit extends Cubit<MyCarState> {
  String value = 'Select Car Type';
  Car? selectedCar ;
  final AddCar addCarUseCase = getIt<AddCar>();

  MyCarCubit() : super(MyCarInitial());
  bool isEmpty = true;

  void deleteCar(Car car) async {
    await getIt<DeleteCar>().execute(car);
    emit(MyCarDeleted());
  }

  void addCar(Car car) async {
    await addCarUseCase.execute(car);
    emit(MyCarAdded());
  }

  void editCar(Car car) async {
    await getIt<EditCar>().execute(car);
    emit(MyCarEdited());
  }

  void loadCars() async {
    try {
      emit(MyCarLoading());
      List<Car> cars = await getIt<ViewUsersCars>().execute(null);
      if (cars.isEmpty) {
        emit(MyCarInitial());
      } else {
        emit(MyCarLoaded(cars));
      }
    } catch (e) {
      emit(MyCarError(e.toString()));
    }
  }

  void selectCar(Car value) {
    this.value =
        '${value.carType} - ${value.carModel} - ${value.carYear} - ${value.carColor}';
    selectedCar = value;
    emit(MyCarSelected(value));
  }

  ProductTypeEnum? selectedType;

  void selectProductType(ProductTypeEnum type) {
    selectedType = type;
    emit(ProductTypeSelected(type));
  }


}
