import 'package:car_doctor/data/model/orders/CustomerOrder.dart';
import 'package:car_doctor/data/model/orders/OrderStatus.dart';
import 'package:car_doctor/domain/entity/ReviewData.dart';
import 'package:injectable/injectable.dart';

import '../../../data/datasource/repository_impl/OrderRepositoryImpl.dart';
import '../../../data/model/MyOrder.dart';

@injectable
abstract class OrderRepository {
  @factoryMethod
  factory OrderRepository() => OrderRepositoryImpl();

  Future<List<CustomerOrder>> getOrders();
  Future<List<CustomerOrder>> getRecentOrders();

  Future<String> addOrder(CustomerOrder order);

  Future<String> deleteOrder(MyOrder order);

  Future<CustomerOrder> updateServiceStatus(CustomerOrder customerOrder);

  Future<CustomerOrder> updateOrderStatus(OrderStatus orderStatus, CustomerOrder order);

  Future<String> review(ReviewData reviewData);

}
