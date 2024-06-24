import 'package:car_doctor/di/AppModule.dart';
import 'package:car_doctor/domain/usecases/orders/ViewRecentOrders.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import 'RecentOrderState.dart';

@singleton
class RecentOrderCubit extends Cubit<RecentOrderState> {
  bool isPressed = false;

  RecentOrderCubit() : super(RecentOrderInitial());

  Future<void> loadRecentOrders() async {
    try {
      emit(RecentOrderLoading());
      final orders = await getIt<ViewRecentOrders>().execute(null);
      if (orders.isNotEmpty) {
        emit(RecentOrderLoaded(orders));
      } else {
        emit(RecentOrderLoaded(const []));
      }
    } catch (e) {
      //  emit(RecentOrderError(e.toString()));
    }
  }
}
