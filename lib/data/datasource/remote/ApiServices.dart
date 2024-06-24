import 'package:car_doctor/data/model/CarTypes.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../../model/car/CarData.dart';
import 'Failure.dart';

abstract class ApiServices {
  Future<Either<Failure, List<CarData>>> fetchCars();
}

@Injectable(as: ApiServices)
class ApiServicesImpl implements ApiServices {
  final Dio _dio;

  ApiServicesImpl(this._dio);

  @override
  Future<Either<Failure, List<CarData>>> fetchCars() async {
    String endPoint = 'all-vehicles-model/records';
    Response response = await _dio.get(endPoint);
    if (response.statusCode == 200) {
      CarsTypes carsTypes = CarsTypes.fromJson(response.data);
      List<CarData> types = [];
      types.add(CarData(type: 'select car type', model: 'select car model'));
      types.addAll(carsTypes.results!
          .map((e) => CarData(type: e.make, model: e.model))
          .toList());
      return Right(types);
    } else {
      return Left(
          Failure(code: response.statusCode, message: response.statusMessage));
    }
  }
}
