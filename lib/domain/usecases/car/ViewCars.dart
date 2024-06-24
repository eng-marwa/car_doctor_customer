import 'package:car_doctor/data/datasource/remote/Failure.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../app/BaseUseCase.dart';
import '../../../data/model/car/Car.dart';
import '../../../data/model/car/CarData.dart';
import '../../../di/AppModule.dart';
import '../../repository/car_repository/CarRepository.dart';

@injectable
class ViewCars implements BaseUseCase<void, Either<Failure, List<CarData>>> {
  @override
  Future<Either<Failure, List<CarData>>> execute(void input) {
    print('ViewCars.execute()');
    return getIt<CarRepository>().getCars();
  }
}
