import '../../data/model/UserData.dart';

abstract class ClientInfoState{}
final class ClientInfoInitial extends ClientInfoState {}

final class ClientInfoLoading extends ClientInfoState {}

final class ClientInfoLoaded extends ClientInfoState {
  final UserData userData;

  ClientInfoLoaded(this.userData);
}

final class ClientInfoError extends ClientInfoState {
  final String message;

  ClientInfoError(this.message);
}

class SignOutSuccess extends ClientInfoState{

}
final class ClientInfoOrderStatusUpdated extends ClientInfoState {
  final UserData userData;

  ClientInfoOrderStatusUpdated(this.userData);
}


