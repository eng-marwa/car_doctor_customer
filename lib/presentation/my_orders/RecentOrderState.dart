import 'package:car_doctor/data/model/orders/CustomerOrder.dart';
import 'package:flutter/material.dart';


@immutable
abstract class RecentOrderState {}

class RecentOrderInitial extends RecentOrderState {}

class RecentOrderLoading extends RecentOrderState {}

class RecentOrderLoaded extends RecentOrderState {
  final List<CustomerOrder> orders;

  RecentOrderLoaded(this.orders);
}

class RecentOrderAdded extends RecentOrderState {
  final String id;

  RecentOrderAdded(this.id);
}

class RecentOrderCancelled extends RecentOrderState {
}

class RecentOrderDeleted extends RecentOrderState {
  final String id;

  RecentOrderDeleted(this.id);
}

class RecentOrderError extends RecentOrderState {
  final String message;

  RecentOrderError(this.message);
}
