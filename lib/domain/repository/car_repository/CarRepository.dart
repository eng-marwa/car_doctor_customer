import 'package:car_doctor/data/datasource/remote/Failure.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../data/model/car/Car.dart';
import '../../../data/model/car/CarData.dart';


abstract class CarRepository {
  Future<Either<Failure,List<CarData>>> getCars();

  Future<String> addCars(Car car);

  Future<String> deleteCars(Car car);

  Future<String> editCars(Car car);

  Future<List<Car>> getUserCars();
}
