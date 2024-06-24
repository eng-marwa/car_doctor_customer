import 'package:car_doctor/data/model/UserData.dart';

abstract class ClientRepository {
  Future<UserData> viewClientData();


  Future<bool> updateUserData(UserData userData);

  Future<bool> updatePassword(String password) ;
}