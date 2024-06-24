import 'package:injectable/injectable.dart';

import '../../../app/BaseUseCase.dart';
import '../../../data/model/car/Car.dart';
import '../../../di/AppModule.dart';
import '../../repository/car_repository/CarRepository.dart';

@injectable
class AddCar implements BaseUseCase<Car, void> {
  @override
  Future<String> execute(Car? input) {
    return getIt<CarRepository>().addCars(input!);
  }

}
