import 'package:car_doctor/data/model/car/CarData.dart';

abstract class CarsTypesState {}

class CarsTypesInitial extends CarsTypesState {}

class CarsTypesLoaded extends CarsTypesState {
  final List<CarData> carsTypes;

  CarsTypesLoaded(this.carsTypes);
}

class CarTypeSelected extends CarsTypesState {
  final String selectedCarType;

  CarTypeSelected(this.selectedCarType);
}

class CarModelSelected extends CarsTypesState {
  final String selectedCarModel;

  CarModelSelected(this.selectedCarModel);
}

class CarsYearSelected extends CarsTypesState {
  final String selectedCarYear;

  CarsYearSelected(this.selectedCarYear);
}

class CarsTypesLoading extends CarsTypesState {}

class CarsTypesError extends CarsTypesState {
  final String message;

  CarsTypesError(this.message);
}

class CarModelsLoaded extends CarsTypesState {
  final List<String> models;

  CarModelsLoaded(this.models);
}
