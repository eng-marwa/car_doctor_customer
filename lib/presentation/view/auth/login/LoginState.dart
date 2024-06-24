part of 'LoginCubit.dart';

@immutable
abstract class LoginState {}

class LoginInitial extends LoginState {}

class Loading extends LoginState {}

class LoginSuccess extends LoginState {
  final String phoneNumber;

  LoginSuccess(this.phoneNumber);
}

class LoginVerified extends LoginState {}
class LoginError extends LoginState {
  final String message;

  LoginError(this.message);
}
