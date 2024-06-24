import 'package:bloc/bloc.dart';
import 'package:car_doctor/data/model/UserData.dart';
import 'package:car_doctor/di/AppModule.dart';
import 'package:car_doctor/presentation/my_account/ClientInfoCubit.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:libphonenumber/libphonenumber.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../data/datasource/local/SharedPreferencesService.dart';
import '../../../../domain/usecases/auth/Auth.dart';
import '../../../../domain/usecases/auth/Login.dart';
import '../../../../domain/usecases/client/ViewClientData.dart';
import '../../../my_account/ClientInfoCubit.dart';

part 'LoginState.dart';

@injectable
class LoginCubit extends Cubit<LoginState> {
  String? verificationCode;

  LoginCubit() : super(LoginInitial());

  final _auth = getIt<FirebaseAuth>();
  final sharedPreferences = getIt<SharedPreferences>();
  final _clientInfoCubit = getIt<ClientInfoCubit>();

  String? verifingId;

  Future<void> login(String phoneNumber) async {
    emit(Loading());
    String? formattedPhoneNumber;
    try {
      formattedPhoneNumber = await PhoneNumberUtil.formatAsYouType(
        phoneNumber: phoneNumber,
        isoCode: 'EG', // replace 'SA' with the appropriate ISO country code
      );
      print('formattedPhoneNumber $formattedPhoneNumber');
      emit(LoginSuccess(formattedPhoneNumber!));
      verifyNumber(formattedPhoneNumber);
    } catch (e) {
      emit(LoginError(e.toString()));
      print('Failed to format phone number: $e');
      return;
    }
  }

  Future<void> verifyNumber(String formattedPhoneNumber) async {
    await _auth.verifyPhoneNumber(
      phoneNumber: formattedPhoneNumber,
      verificationCompleted: (PhoneAuthCredential credential) async {
        // ANDROID ONLY!

        // Sign the user in (or link) with the auto-generated credential
        await _auth.signInWithCredential(credential);
      },
      verificationFailed: (FirebaseAuthException e) {
        print('verificationFailed $e');
      },
      codeSent: (String verificationId, int? resendToken) async {
        // Update the UI - wait for the user to enter the SMS code
        print('verificationId $verificationId');
        await sharedPreferences.setString('verificationId', verificationId);
      },
      codeAutoRetrievalTimeout: (String verificationId) async {
        await sharedPreferences.setString('verificationId', verificationId);
        print('codeAutoRetrievalTimeout $verificationId');
      },
    );
  }

  void sendCode(String code, UserData? userData) async {
    print('sendCode');
    emit(Loading());
    verifingId = sharedPreferences.getString("verificationId");
    print(verifingId);
    if (verifingId != null) {
      try {
        print(verifingId);
        PhoneAuthCredential credential = PhoneAuthProvider.credential(
          verificationId: verifingId ?? '',
          smsCode: code,
        );
        print('code $code');
        print('credential ${credential.verificationId}');
        print('credential ${credential.accessToken}');
        UserCredential userCredential =
            await _auth.signInWithCredential(credential);
        userData?.uid = userCredential.user!.uid;
        userData?.phone = userCredential.user!.phoneNumber!;
        await getIt<Auth>().execute(
          userData,
        );
        emit(LoginVerified());
        await sharedPreferences.remove('verificationId');
      } on FirebaseAuthException catch (e) {
        print('Failed to verify SMS code: ${e.message}');
        emit(LoginError(e.toString()));
      }
    }
  }

  void sendLoginCode(String code) async {
    emit(Loading());
    verifingId = sharedPreferences.getString("verificationId");
    print(verifingId);
    if (verifingId != null) {
      try {
        print(verifingId);
        PhoneAuthCredential credential = PhoneAuthProvider.credential(
          verificationId: verifingId ?? '',
          smsCode: code,
        );
        print('code $code');
        print('credential ${credential.verificationId}');
        print('credential ${credential.accessToken}');
        UserCredential userCredential =
            await _auth.signInWithCredential(credential);
        await getIt<Login>().execute(userCredential);
        emit(LoginVerified());
        await sharedPreferences.remove('verificationId');
      } on FirebaseAuthException catch (e) {
        print('Failed to verify SMS code: ${e.message}');
        emit(LoginError(e.toString()));
      }
    }
  }
}
