import 'package:injectable/injectable.dart';

import '../../../app/BaseUseCase.dart';
import '../../../data/model/car/Car.dart';
import '../../../di/AppModule.dart';
import '../../repository/car_repository/CarRepository.dart';

@injectable
class ViewUsersCars implements BaseUseCase<void, List<Car>> {
  @override
  Future<List<Car>> execute(input) async {
    print('ViewCars.execute()${getIt<CarRepository>().getUserCars()}');
    return getIt<CarRepository>().getUserCars();
  }
}
