import 'package:car_doctor/data/datasource/remote/Failure.dart';
import 'package:car_doctor/data/model/car/CarData.dart';
import 'package:car_doctor/di/AppModule.dart';
import 'package:car_doctor/domain/usecases/car/ViewCars.dart';
import 'package:car_doctor/presentation/car/CarsTypesState.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class CarsTypesCubit extends Cubit<CarsTypesState> {
  CarsTypesCubit() : super(CarsTypesInitial());
  final ViewCars viewCars = getIt<ViewCars>();

  void fetchCars() async {
    try {
      emit(CarsTypesLoading());
      Either<Failure, List<CarData>> data = await viewCars.execute(null);
      data.fold((l) => emit(CarsTypesError(l.message!)),
          (r) => emit(CarsTypesLoaded(r)));
    } catch (e) {
      //emit(CarsTypesError(e.toString()));
    }
  }

  String selectedCarType = 'select car type';
  String selectedCarModel = 'select car model';
  String selectedYear = '';

  void selectCarType(String type) {
    selectedCarType = type;
    print('selected car type: $type');
    emit(CarTypeSelected(type));
  }

  void selectCarModel(String model) {
    selectedCarModel = model;
    emit(CarModelSelected(model));
  }

  void selectCarYear(String value) {
    selectedYear = value;
    emit(CarsYearSelected(value));
  }

  void setModels(List<String> models) {
    emit(CarModelsLoaded(models.toSet().toList()));
  }
}
