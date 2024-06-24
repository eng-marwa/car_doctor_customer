import 'package:injectable/injectable.dart';

import '../../../app/BaseUseCase.dart';
import '../../../data/model/car/Car.dart';
import '../../../di/AppModule.dart';
import '../../repository/car_repository/CarRepository.dart';

@injectable
class DeleteCar implements BaseUseCase<Car, String> {
  @override
  Future<String> execute(Car? input) {
   return getIt<CarRepository>().deleteCars(input!);
  }

}
