import 'package:equatable/equatable.dart';

import '../Client.dart';
import '../Representative.dart';
import '../Workshop.dart';
import '../car/Car.dart';
import 'OrderStatus.dart';
import 'CarService.dart';
import 'OrderType.dart';

class CustomerOrder extends Equatable {
  String? orderId;
  OrderStatus orderStatus = OrderStatus.PENDING;
  String? orderDate;
  String? orderDescription;
  CarService? carService;
  Client? client;
  Car? car;
  Workshop? workshop;
  Representative? representative;
  String? cancellationReason = '';
  double orderCost = 0;
  String? notes = '';
  OrderType? orderType;

  @override
  List<Object?> get props => [
        orderId,
        orderStatus,
        orderDate,
        carService,
        orderDescription,
        client,
        car,
        workshop,
        representative,
        cancellationReason,
        orderCost,
        notes,
        orderType
      ];

  CustomerOrder(
      {this.orderId,
      this.orderStatus = OrderStatus.PENDING,
      this.orderDate,
      this.carService,
      this.orderDescription = '',
      this.client,
      this.car,
      this.workshop,
      this.representative,
      this.cancellationReason = '',
      required this.orderCost,
      this.notes = '',
      this.orderType,});

  factory CustomerOrder.fromJson(Map<String, dynamic> json) {
    return CustomerOrder(
      orderId: json['orderId'],
      orderStatus: OrderStatus.values.firstWhere(
              (element) => element.name.toLowerCase() == json['orderStatus'],
          orElse: () => OrderStatus.PENDING),
      orderDate: json['orderDate'],
      carService: json['carService'] != null
          ? CarService.fromJson(json['carService'])
          : null,
      orderDescription: json['orderDescription'],
      client: json['client'] != null ? Client.fromJson(json['client']) : null,
      car: json['car'] != null ? Car.fromJson(json['car']) : null,
      workshop:
      json['workshop'] != null ? Workshop.fromJson(json['workshop']) : null,
      representative: json['representative'] != null
          ? Representative.fromJson(json['representative'])
          : null,
      cancellationReason: json['cancellationReason'],
      orderCost: json['orderCost']?.toDouble() ?? 0,
      notes: json['notes'] ?? '',
      orderType: OrderType.values.firstWhere(
          (element) => element.name.toLowerCase() == json['orderType']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'orderId': orderId,
      'orderStatus': orderStatus.name.toLowerCase(),
      'orderDate': orderDate,
      'carService': carService!.toJson(),
      'orderDescription': orderDescription,
      'client': client!.toJson(),
      'car': car!.toJson(),
      'workshop': workshop?.toJson(),
      'representative': representative?.toJson(),
      'cancellationReason': cancellationReason,
      'orderCost': orderCost,
      'notes': notes ?? '',
      'orderType': orderType?.name.toLowerCase(),
    };
  }
}
