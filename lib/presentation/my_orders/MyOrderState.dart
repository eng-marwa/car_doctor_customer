part of 'MyOrderCubit.dart';

@immutable
abstract class MyOrderState {}

class MyOrderInitial extends MyOrderState {}

class MyOrderLoading extends MyOrderState {}

class MyOrderLoaded extends MyOrderState {
  final List<CustomerOrder> orders;

  MyOrderLoaded(this.orders);
}

class MyOrderAdded extends MyOrderState {
  final CustomerOrder customerOrder;
  MyOrderAdded(this. customerOrder);
}

class MyOrderDeleted extends MyOrderState {
  final String id;

  MyOrderDeleted(this.id);
}

class MyOrderError extends MyOrderState {
  final String message;

  MyOrderError(this.message);
}

class MyOrderStatusUpdated extends MyOrderState {
  final CustomerOrder customerOrder;

  MyOrderStatusUpdated(this.customerOrder);
}

class OrderLocationUpdated extends MyOrderState {
  final double latitude;
  final double longitude;
  final String address;


  OrderLocationUpdated(this.latitude, this.longitude, this.address,);
}
class SetRepState extends MyOrderState{
  final bool useRep;
  SetRepState(this.useRep);
}