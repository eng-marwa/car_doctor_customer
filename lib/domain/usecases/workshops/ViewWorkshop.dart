
import 'package:injectable/injectable.dart';
import '../../../app/BaseUseCase.dart';
import '../../../data/model/Workshop.dart';
import '../../../di/AppModule.dart';
import '../../repository/workshops_repository/WorkshopRepository.dart';

@injectable
class ViewWorkshop implements BaseUseCase<void,List<Workshop>>{
  @override
  Future<List<Workshop>> execute(input) async {
    print('execute workshop');
    return await getIt<WorkshopRepository>().getWorkshop();
  }
}