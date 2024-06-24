import 'package:car_doctor/data/model/UserData.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class LoginRepository {
  Future<String> register(UserData phone);

  Future<bool> signout() ;

  Future<String> login(UserCredential phone);
}