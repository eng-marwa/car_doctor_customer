import 'package:bloc/bloc.dart';
import 'package:car_doctor/data/datasource/local/SharedPreferencesService.dart';
import 'package:car_doctor/data/model/Client.dart';
import 'package:car_doctor/di/AppModule.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../data/model/UserData.dart';
import '../../domain/usecases/auth/SignOut.dart';
import '../../domain/usecases/client/UpdateClientData.dart';
import '../../domain/usecases/client/ViewClientData.dart';
import 'ClientInfoState.dart';

@injectable
class ClientInfoCubit extends Cubit<ClientInfoState> {
  ClientInfoCubit() : super(ClientInfoInitial());
  SharedPreferences sharedPreferences = getIt<SharedPreferences>();

  Future<void> loadUserData() async {
    final userData = await getIt<ViewClientData>().execute(null);
    emit(ClientInfoLoading());
    if (userData == null) {
      emit(ClientInfoError("No data found"));
      return;
    } else {
      emit(ClientInfoLoaded(userData));
    }
  }

  Future<void> updateUserData(UserData userData) async {
    await getIt<UpdateClientData>().execute(userData);
    emit(ClientInfoOrderStatusUpdated(userData));
  }

  Future<void> signOut() async {
    await getIt<SignOut>().execute(null);
    emit(SignOutSuccess());
  }

  Client getClient() {
    final sharedPreferencesService =
        SharedPreferencesService<UserData>(sharedPreferences);
    UserData? user =
        sharedPreferencesService.getObject('user', UserData.fromJson);
    return UserData.userDataClientMapper(user!);
  }

  void saveLateLng(double latitude, double longitude) {
    final sharedPreferencesService =
        SharedPreferencesService<UserData>(sharedPreferences);
    UserData? user =
        sharedPreferencesService.getObject('user', UserData.fromJson);
    user!.lat = latitude;
    user.lon = longitude;
    sharedPreferencesService.saveObject('user', user);
    updateUserData(user);
  }

  void saveAddress(String? street, String? locality, String? administrativeArea,
      String? country) {
    final sharedPreferencesService =
        SharedPreferencesService<UserData>(sharedPreferences);
    UserData? user =
        sharedPreferencesService.getObject('user', UserData.fromJson);
    user!.address = '$street, $locality, $administrativeArea, $country';
    sharedPreferencesService.saveObject('user', user);
    updateUserData(user);
  }
}
