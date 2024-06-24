import 'package:injectable/injectable.dart';

import '../../../app/BaseUseCase.dart';
import '../../../data/model/UserData.dart';
import '../../../di/AppModule.dart';
import '../../repository/client/ClientRepository.dart';

@injectable
class UpdateClientData implements BaseUseCase<UserData,bool > {
  @override
  Future<bool> execute(input) async {
    return getIt<ClientRepository>().updateUserData(input!);
  }}
