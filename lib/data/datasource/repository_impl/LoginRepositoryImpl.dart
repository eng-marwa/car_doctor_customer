import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../di/AppModule.dart';
import '../../../domain/repository/auth/LoginRepository.dart';
import '../../model/UserData.dart';
import '../local/SharedPreferencesService.dart';

@Injectable(as: LoginRepository)
class LoginRepositoryImpl implements LoginRepository {
  final FirebaseFirestore _firebaseFirestore = getIt<FirebaseFirestore>();
  final sharedPreferences = getIt<SharedPreferences>();
  final FirebaseAuth _auth = getIt<FirebaseAuth>();

  @override
  Future<String> register(UserData userData) async {
    try {
      if (userData != null) {
        final sharedPreferencesService =
            SharedPreferencesService<UserData>(sharedPreferences);
        await sharedPreferencesService.saveObject('user', userData);
        await _firebaseFirestore
            .collection('users')
            .doc('customers')
            .collection('customerData')
            .doc(userData!.uid)
            .set(userData.toJson())
            .then((value) => 'Successfully Created',
                onError: (e) => e.toString());
      }
    } on FirebaseAuthException catch (e) {
      print('Error: ${e.message}');
      return e.message!;
    }
    return '';
  }

  @override
  Future<bool> signout() async {
    final sharedPreferencesService =
        SharedPreferencesService<UserData>(sharedPreferences);
    await sharedPreferencesService.saveObject('user', null);
    _auth.signOut();
    return true;
  }

  @override
  Future<String> login(UserCredential credential) async {
    try {
      if (credential.user != null) {
        DocumentSnapshot documentSnapshot = await _firebaseFirestore
            .collection('users')
            .doc('customers')
            .collection('customerData')
            .doc(credential.user!.uid).get();
        UserData userData =  UserData.fromJson(documentSnapshot.data() as Map<String, dynamic>);
        SharedPreferencesService sharedPreferencesService = SharedPreferencesService<UserData>(sharedPreferences);
        sharedPreferencesService.saveObject('user', userData);
        print('userData $userData');
      }
    } on FirebaseAuthException catch (e) {
      print('Error: ${e.message}');
      return e.message!;
    }
    return '';

  }
}
