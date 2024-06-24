import 'package:bloc/bloc.dart';
import 'package:car_doctor/data/model/Workshop.dart';
import 'package:car_doctor/di/AppModule.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

import '../../domain/usecases/workshops/ViewWorkshop.dart';

part 'WorkshopState.dart';
@injectable
class WorkshopCubit extends Cubit<WorkshopState> {
  String? value = 'Select Workshop';
  Workshop? selectedWorkshop;

  WorkshopCubit() : super(WorkshopInitial());

  void loadWorkshops() async{
    print('loadWorkshops');
    try{
      emit(WorkshopLoading());
      List<Workshop> agents = await getIt<ViewWorkshop>().execute(null);
      print('agents $agents');
      emit(WorkshopLoaded(agents));
    } catch (e) {
      emit(WorkshopError(e.toString()));
    }
  }

  void setWorkshop(Workshop workshop) {
    this.value = workshop.workshopName;
    selectedWorkshop = workshop;
    emit(WorkshopSelected(workshop));
  }
}
