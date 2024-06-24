import 'package:car_doctor/data/model/UserData.dart';
import 'package:injectable/injectable.dart';

import '../../../app/BaseUseCase.dart';
import '../../../di/AppModule.dart';
import '../../repository/client/ClientRepository.dart';

@injectable
class ViewClientData implements BaseUseCase<void,UserData> {
  @override
  Future<UserData> execute(input) async {
    return getIt<ClientRepository>().viewClientData();
  }}





