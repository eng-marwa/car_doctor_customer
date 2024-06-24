import 'package:bloc/bloc.dart';
import 'package:car_doctor/data/model/orders/CustomerOrder.dart';
import 'package:car_doctor/domain/usecases/orders/AddOrder.dart';
import 'package:car_doctor/domain/usecases/orders/ViewOrder.dart';
import 'package:car_doctor/domain/usecases/orders/ViewRecentOrders.dart';
import 'package:car_doctor/presentation/my_orders/MyOrderStatus.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

import '../../data/model/MyOrder.dart';
import '../../di/AppModule.dart';
import '../../domain/repository/order_repository/OrderRepository.dart';
import '../../domain/usecases/orders/GetUpdatedOrderStatus.dart';

part 'MyOrderState.dart';

@injectable
class MyOrderCubit extends Cubit<MyOrderState> {
  bool isPressed = false;
  bool useRep = false;
  final OrderRepository orderRepository;

  MyOrderCubit(this.orderRepository) : super(MyOrderInitial());

  Future<void> loadPreviousOrders() async {
    try {
      emit(MyOrderLoading());
      final orders = await getIt<ViewOrders>().execute(null);
      emit(MyOrderLoaded(orders));
    } catch (e) {
      emit(MyOrderError(e.toString()));
    }
  }

  Future<void> loadRecentOrders() async {
    try {
      emit(MyOrderLoading());
      final orders = await getIt<ViewRecentOrders>().execute(null);
      print('orders $orders');
      emit(MyOrderLoaded(orders));
    } catch (e) {
      emit(MyOrderError(e.toString()));
    }
  }

  void toggleOrderType(OrdersStatus status) async {
    if (!this.isClosed) {
      print('status: $status');
      if (status == OrdersStatus.previous) {
        isPressed = false;
        emit(MyOrderLoaded([]));
      } else {
        isPressed = true;
        emit(MyOrderLoaded([]));
      }
    }
  }

  Future<bool> createOrder(CustomerOrder customerOrder) async {
    print('customerOrder ${customerOrder.workshop?.workshopId}');
    await getIt<AddOrder>().execute(customerOrder);
    emit(MyOrderAdded(customerOrder));
    return true;
  }

  Future<void> updateOrderStatus(CustomerOrder customerOrder) async {
    CustomerOrder newStatusCustomerOrder =
        await getIt<GetUpdatedOrderStatus>().execute(customerOrder);
    emit(MyOrderStatusUpdated(newStatusCustomerOrder));
  }

  void orderLocation(double latitude, double longitude, String? street,
      String? locality, String? administrativeArea, String? country) {
    emit(OrderLocationUpdated(latitude, longitude,
        '$street - $locality - $administrativeArea $country'));
  }

  void setRep(bool b) {
    useRep = b;
    emit(SetRepState(b));
  }
}
