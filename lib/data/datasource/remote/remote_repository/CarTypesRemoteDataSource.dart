import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../model/car/CarData.dart';
import '../Failure.dart';


abstract class CarTypesRemoteDataSource {
  Future<Either<Failure, List<CarData>>> fetchCarsTypes();
}
