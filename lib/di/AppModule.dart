import 'package:car_doctor/di/AppModule.config.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';


GetIt getIt = GetIt.instance;

@InjectableInit(
    initializerName: 'init', preferRelativeImports: true, asExtension: true)
void configureDependencies() {
  getIt.init(environment: 'dev');
}