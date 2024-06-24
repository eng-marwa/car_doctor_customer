
import 'package:car_doctor/data/model/Workshop.dart';
import 'package:injectable/injectable.dart';

import '../../../data/datasource/repository_impl/WorkshopRepositoryImpl.dart';

@injectable
abstract class WorkshopRepository {
  @factoryMethod
  factory WorkshopRepository() => WorkshopRepositoryImpl();
  Future<List<Workshop>> getWorkshop();
}