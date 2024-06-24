import 'package:flutter/cupertino.dart';

import '../../data/model/UserData.dart';


@immutable
sealed class ChangePasswordState {}

final class ChangePasswordInitial extends ChangePasswordState {}

final class ChangePasswordLoading extends ChangePasswordState {}

final class ChangePasswordLoaded extends ChangePasswordState {
  final UserData userData;

  ChangePasswordLoaded(this.userData);
}

final class ChangePasswordError extends ChangePasswordState {
  final String message;

  ChangePasswordError(this.message);
}

final class ChangePasswordOrderStatusUpdated extends ChangePasswordState {

}
