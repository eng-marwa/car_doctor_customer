// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:cloud_firestore/cloud_firestore.dart' as _i18;
import 'package:dio/dio.dart' as _i14;
import 'package:firebase_auth/firebase_auth.dart' as _i17;
import 'package:firebase_core/firebase_core.dart' as _i16;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:shared_preferences/shared_preferences.dart' as _i34;

import '../data/datasource/remote/ApiServices.dart' as _i48;
import '../data/datasource/remote/remote_repository/CarsTypeRemoteDSImpl.dart'
    as _i50;
import '../data/datasource/remote/remote_repository/CarTypesRemoteDataSource.dart'
    as _i49;
import '../data/datasource/repository_impl/CarRepositoryImpl.dart' as _i7;
import '../data/datasource/repository_impl/ClientRepositoryImpl.dart' as _i11;
import '../data/datasource/repository_impl/LoginRepositoryImpl.dart' as _i23;
import '../data/datasource/repository_impl/OfferRepositoryImpl.dart' as _i28;
import '../data/datasource/repository_impl/OrderRepositoryImpl.dart' as _i30;
import '../data/datasource/repository_impl/WorkshopRepositoryImpl.dart' as _i47;
import '../domain/repository/auth/LoginRepository.dart' as _i22;
import '../domain/repository/car_repository/CarRepository.dart' as _i6;
import '../domain/repository/client/ClientRepository.dart' as _i10;
import '../domain/repository/offer_repository/OfferRepository.dart' as _i27;
import '../domain/repository/order_repository/OrderRepository.dart' as _i29;
import '../domain/repository/workshops_repository/WorkshopRepository.dart'
    as _i46;
import '../domain/usecases/auth/Auth.dart' as _i5;
import '../domain/usecases/auth/Login.dart' as _i20;
import '../domain/usecases/auth/SignOut.dart' as _i35;
import '../domain/usecases/car/AddCar.dart' as _i3;
import '../domain/usecases/car/DeleteCar.dart' as _i12;
import '../domain/usecases/car/EditCar.dart' as _i15;
import '../domain/usecases/car/ViewCars.dart' as _i38;
import '../domain/usecases/car/ViewUserCars.dart' as _i43;
import '../domain/usecases/client/UpdateClientData.dart' as _i36;
import '../domain/usecases/client/ViewClientData.dart' as _i39;
import '../domain/usecases/offers/ViewOffers.dart' as _i40;
import '../domain/usecases/orders/AddOrder.dart' as _i4;
import '../domain/usecases/orders/DeleteOrder.dart' as _i13;
import '../domain/usecases/orders/GetUpdatedOrderStatus.dart' as _i19;
import '../domain/usecases/orders/Review.dart' as _i32;
import '../domain/usecases/orders/ViewOrder.dart' as _i41;
import '../domain/usecases/orders/ViewRecentOrders.dart' as _i42;
import '../domain/usecases/workshops/ViewWorkshop.dart' as _i44;
import '../presentation/car/CarTypesCubit.dart' as _i8;
import '../presentation/car/MyCarCubit.dart' as _i24;
import '../presentation/car/UserCarCubit.dart' as _i37;
import '../presentation/home/NavBarCubit.dart' as _i25;
import '../presentation/my_account/ChangePasswordCubit.dart' as _i51;
import '../presentation/my_account/ClientInfoCubit.dart' as _i9;
import '../presentation/my_orders/MyOrderCubit.dart' as _i52;
import '../presentation/my_orders/RecentOrderCubit.dart' as _i31;
import '../presentation/offers/OfferCubit.dart' as _i26;
import '../presentation/services/WorkshopCubit.dart' as _i45;
import '../presentation/view/auth/login/LoginCubit.dart' as _i21;
import '../presentation/view/representative/ReviewCubit.dart' as _i33;
import 'DioModule.dart' as _i53;
import 'FirebaseModule.dart' as _i54;
import 'SharedPrefsModule.dart' as _i55;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  Future<_i1.GetIt> init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final dioModule = _$DioModule();
    final firebaseModule = _$FirebaseModule();
    final sharedPrefsModule = _$SharedPrefsModule();
    gh.factory<_i3.AddCar>(() => _i3.AddCar());
    gh.factory<_i4.AddOrder>(() => _i4.AddOrder());
    gh.factory<_i5.Auth>(() => _i5.Auth());
    gh.factory<_i6.CarRepository>(() => _i7.CarRepositoryImpl());
    gh.factory<_i8.CarsTypesCubit>(() => _i8.CarsTypesCubit());
    gh.factory<_i9.ClientInfoCubit>(() => _i9.ClientInfoCubit());
    gh.factory<_i10.ClientRepository>(() => _i11.ClientRepositoryImpl());
    gh.factory<_i12.DeleteCar>(() => _i12.DeleteCar());
    gh.factory<_i13.DeleteOrder>(() => _i13.DeleteOrder());
    gh.factory<_i14.Dio>(() => dioModule.dio);
    gh.factory<_i15.EditCar>(() => _i15.EditCar());
    await gh.factoryAsync<_i16.FirebaseApp>(
      () => firebaseModule.initFirebaseApp,
      preResolve: true,
    );
    gh.factory<_i17.FirebaseAuth>(() => firebaseModule.auth);
    gh.factory<_i18.FirebaseFirestore>(() => firebaseModule.firestore);
    gh.factory<_i19.GetUpdatedOrderStatus>(() => _i19.GetUpdatedOrderStatus());
    gh.factory<_i20.Login>(() => _i20.Login());
    gh.factory<_i21.LoginCubit>(() => _i21.LoginCubit());
    gh.factory<_i22.LoginRepository>(() => _i23.LoginRepositoryImpl());
    gh.factory<_i24.MyCarCubit>(() => _i24.MyCarCubit());
    gh.factory<_i25.NavBarCubit>(() => _i25.NavBarCubit());
    gh.factory<_i26.OfferCubit>(() => _i26.OfferCubit());
    gh.factory<_i27.OfferRepository>(() => _i28.OfferRepositoryImpl());
    gh.factory<_i29.OrderRepository>(() => _i29.OrderRepository());
    gh.factory<_i30.OrderRepositoryImpl>(() => _i30.OrderRepositoryImpl());
    gh.singleton<_i31.RecentOrderCubit>(() => _i31.RecentOrderCubit());
    gh.factory<_i32.Review>(() => _i32.Review());
    gh.factory<_i33.ReviewCubit>(() => _i33.ReviewCubit());
    await gh.factoryAsync<_i34.SharedPreferences>(
      () => sharedPrefsModule.sharedPreferences,
      preResolve: true,
    );
    gh.factory<_i35.SignOut>(() => _i35.SignOut());
    gh.factory<_i36.UpdateClientData>(() => _i36.UpdateClientData());
    gh.factory<_i37.UserCarCubit>(() => _i37.UserCarCubit());
    gh.factory<_i38.ViewCars>(() => _i38.ViewCars());
    gh.factory<_i39.ViewClientData>(() => _i39.ViewClientData());
    gh.factory<_i40.ViewOffers>(() => _i40.ViewOffers());
    gh.factory<_i41.ViewOrders>(() => _i41.ViewOrders());
    gh.factory<_i42.ViewRecentOrders>(() => _i42.ViewRecentOrders());
    gh.factory<_i43.ViewUsersCars>(() => _i43.ViewUsersCars());
    gh.factory<_i44.ViewWorkshop>(() => _i44.ViewWorkshop());
    gh.factory<_i45.WorkshopCubit>(() => _i45.WorkshopCubit());
    gh.factory<_i46.WorkshopRepository>(() => _i46.WorkshopRepository());
    gh.factory<_i47.WorkshopRepositoryImpl>(
        () => _i47.WorkshopRepositoryImpl());
    gh.factory<_i48.ApiServices>(() => _i48.ApiServicesImpl(gh<_i14.Dio>()));
    gh.factory<_i49.CarTypesRemoteDataSource>(
        () => _i50.CarsTypeRemoteDSImpl(gh<_i48.ApiServices>()));
    gh.singleton<_i51.ChangePasswordCubit>(
        () => _i51.ChangePasswordCubit(gh<_i10.ClientRepository>()));
    gh.factory<_i52.MyOrderCubit>(
        () => _i52.MyOrderCubit(gh<_i29.OrderRepository>()));
    return this;
  }
}

class _$DioModule extends _i53.DioModule {}

class _$FirebaseModule extends _i54.FirebaseModule {}

class _$SharedPrefsModule extends _i55.SharedPrefsModule {}
