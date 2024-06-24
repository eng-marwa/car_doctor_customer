import 'package:car_doctor/data/datasource/remote/Failure.dart';
import 'package:car_doctor/data/model/CarTypes.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../model/car/CarData.dart';
import '../ApiServices.dart';
import 'CarTypesRemoteDataSource.dart';
@Injectable(as: CarTypesRemoteDataSource)
class CarsTypeRemoteDSImpl implements CarTypesRemoteDataSource {
  final ApiServices _apiServices;

  CarsTypeRemoteDSImpl(this._apiServices);

  @override
  Future<Either<Failure, List<CarData>>> fetchCarsTypes() {
    return _apiServices.fetchCars();
  }
}
