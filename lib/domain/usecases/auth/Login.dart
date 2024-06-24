import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';

import '../../../app/BaseUseCase.dart';
import '../../../di/AppModule.dart';
import '../../repository/auth/LoginRepository.dart';

@injectable
class Login extends BaseUseCase<UserCredential, void> {
  final LoginRepository loginRepository = getIt<LoginRepository>();

  @override
  Future<String> execute(input) async {
    return loginRepository.login(input!);
  }
}
