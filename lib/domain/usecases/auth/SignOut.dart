import 'package:injectable/injectable.dart';

import '../../../app/BaseUseCase.dart';
import '../../../di/AppModule.dart';
import '../../repository/auth/LoginRepository.dart';

@injectable
class SignOut extends BaseUseCase<void, bool> {
  final LoginRepository loginRepository = getIt<LoginRepository>();

  @override
  Future<bool> execute(input) async {
    return loginRepository.signout();
  }
}
