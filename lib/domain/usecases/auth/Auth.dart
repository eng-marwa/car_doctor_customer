import 'package:car_doctor/data/model/UserData.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';

import '../../../app/BaseUseCase.dart';
import '../../../di/AppModule.dart';
import '../../repository/auth/LoginRepository.dart';

@injectable
class Auth extends BaseUseCase<UserData, void> {
  final LoginRepository loginRepository = getIt<LoginRepository>();

  @override
  Future<String> execute(input) async {
    return loginRepository.register(input!);
  }
}
