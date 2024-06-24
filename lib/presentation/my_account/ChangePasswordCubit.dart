import 'package:bloc/bloc.dart';
import 'package:car_doctor/domain/repository/client/ClientRepository.dart';
import 'package:injectable/injectable.dart';

import 'ChangePasswordState.dart';

@singleton
class ChangePasswordCubit extends Cubit<ChangePasswordState> {
  final ClientRepository clientRepository;
  ChangePasswordCubit(this.clientRepository) : super(ChangePasswordInitial());

  Future<void> loadUserData() async {
    emit(ChangePasswordLoading());
    final userData = await clientRepository.viewClientData();
    if (userData == null) {
      emit(ChangePasswordError("No data found"));
      return;
    } else {
      emit(ChangePasswordLoaded(userData));
    }
  }

  void updatePassword(String password) {
    clientRepository.updatePassword(password);
    emit(ChangePasswordOrderStatusUpdated());
  }
}
