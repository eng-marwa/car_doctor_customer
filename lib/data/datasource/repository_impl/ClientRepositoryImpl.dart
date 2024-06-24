import 'package:car_doctor/data/model/UserData.dart';
import 'package:car_doctor/domain/repository/client/ClientRepository.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../di/AppModule.dart';
import '../local/SharedPreferencesService.dart';

@Injectable(as: ClientRepository)
class ClientRepositoryImpl implements ClientRepository {
  final FirebaseAuth _auth = getIt<FirebaseAuth>();
  final FirebaseFirestore _firebaseFirestore = getIt<FirebaseFirestore>();
  final sharedPreferences = getIt<SharedPreferences>();

  @override
  Future<bool> updatePassword(String password) async {
    final sharedPreferencesService =
        SharedPreferencesService<UserData>(sharedPreferences);
    var userData =
        sharedPreferencesService.getObject('user', UserData.fromJson);
    if (userData != null) {
      try {
        final user = await _auth.currentUser;
        print('User: ${userData.password}');
        final cred = EmailAuthProvider.credential(
            email: user!.email!, password: userData.password);
        UserCredential credential =
            await user.reauthenticateWithCredential(cred);
        print('credential ${credential.credential}');
        var updatePassword = await user.updatePassword(password);
        userData.password = password;
        await _firebaseFirestore
            .collection('users')
            .doc('customers')
            .collection('customerData')
            .doc(_auth.currentUser!.uid)
            .update(userData.toJson());
        await sharedPreferencesService.saveObject('user', userData);
        print('Password updated successfully');
        return true;
      } catch (e) {
        print('Error: $e');
        return false;
      }
    }
    return false;
  }

  @override
  Future<bool> updateUserData(UserData userData) async {
    final sharedPreferencesService =
        SharedPreferencesService<UserData>(sharedPreferences);
    if(_auth.currentUser == null) {
      print('User is null');
      return false;
    }else {
      userData.uid = _auth.currentUser!.uid;
      await sharedPreferencesService.saveObject('user', userData);
      await _firebaseFirestore
          .collection('users')
          .doc('customers')
          .collection('customerData')
          .doc(_auth.currentUser!.uid)
          .update(userData.toJson());
      return true;
    }
  }

  @override
  Future<UserData> viewClientData() async {
    QuerySnapshot<Map<String, dynamic>> res = await _firebaseFirestore
        .collection('users')
        .doc('customers')
        .collection('customerData')
        .where("uid", isEqualTo: _auth.currentUser!.uid)
        .get();
    return UserData.fromJson(res.docs.first.data());
  }
}
