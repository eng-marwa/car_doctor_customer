import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@module
abstract class SharedPrefsModule {
  @preResolve
  Future<SharedPreferences> get sharedPreferences async => await SharedPreferences.getInstance();
}