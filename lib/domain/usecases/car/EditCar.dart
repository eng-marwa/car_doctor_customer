import 'package:injectable/injectable.dart';

import '../../../app/BaseUseCase.dart';
import '../../../data/model/car/Car.dart';
import '../../../di/AppModule.dart';
import '../../repository/car_repository/CarRepository.dart';

@injectable
class EditCar implements BaseUseCase<Car, String> {
  @override
  Future<String> execute(Car? input) async {
    return await getIt<CarRepository>().editCars(input!);

  }
}
