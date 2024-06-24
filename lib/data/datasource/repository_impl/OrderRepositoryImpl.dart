import 'package:car_doctor/data/model/Client.dart';
import 'package:car_doctor/data/model/orders/CustomerOrder.dart';
import 'package:car_doctor/data/model/orders/OrderServiceStatus.dart';
import 'package:car_doctor/data/model/orders/OrderStatus.dart';
import 'package:car_doctor/data/model/orders/TempOrder.dart';
import 'package:car_doctor/domain/entity/ReviewData.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../di/AppModule.dart';
import '../../../domain/repository/order_repository/OrderRepository.dart';
import '../../model/MyOrder.dart';
import '../../model/UserData.dart';
import '../local/SharedPreferencesService.dart';

@injectable
class OrderRepositoryImpl implements OrderRepository {
  OrderRepositoryImpl();

  final FirebaseFirestore _firebaseFirestore = getIt<FirebaseFirestore>();
  final FirebaseAuth _auth = getIt<FirebaseAuth>();
  final sharedPreferences = getIt<SharedPreferences>();

  @override
  Future<List<CustomerOrder>> getOrders() async {
    QuerySnapshot snapshot = await getIt<FirebaseFirestore>()
        .collection('users')
        .doc('customers')
        .collection('customerData')
        .doc(_auth.currentUser!.uid)
        .collection('orders')
        .where('carService.status',
            isEqualTo: OrderServiceStatus.COMPLETED.name)
        .where('carService.status', isEqualTo: OrderServiceStatus.DELIVER.name)
        .where('orderStatus', isEqualTo: OrderStatus.COMPLETED.name)
        .get();
    return snapshot.docs
        .map((e) => CustomerOrder.fromJson(e.data() as Map<String, dynamic>))
        .toList();
  }

  @override
  Future<String> addOrder(CustomerOrder order) async {
    final sharedPreferencesService =
        SharedPreferencesService<UserData>(sharedPreferences);
    UserData? userData =
        sharedPreferencesService.getObject('user', UserData.fromJson);
    print('userData $userData');
    if (userData != null) {
      order.client = UserData.userDataClientMapper(userData);
      DocumentReference documentReference = await _firebaseFirestore
          .collection('users')
          .doc('customers')
          .collection('customerData')
          .doc(_auth.currentUser!.uid)
          .collection('orders')
          .doc();
      order.orderId = documentReference.id;
      documentReference.set(order.toJson());
      print("order==>${order.orderId}");
      print("order.workshop?.workshopId");
      await _firebaseFirestore
          .collection('users')
          .doc('agents')
          .collection('agentData')
          .doc(order.workshop?.workshopId)
          .collection('orders')
          .doc(order.orderId)
          .set(order.toJson());

      if (order.representative != null) {
        TempOrder tempOrder = TempOrder(customerOrder: order, rejectBy: []);
        await _firebaseFirestore
            .collection('all_orders')
            .doc(order.orderId)
            .set(tempOrder.toJson());
      }
    }

    return 'order added';
  }

  @override
  Future<String> deleteOrder(MyOrder order) async {
    getIt<FirebaseFirestore>()
        .collection('users')
        .doc(_auth.currentUser?.uid)
        .collection('order')
        .doc(order.id)
        .delete()
        .catchError((e) => e.toString())
        .whenComplete(() => 'order deleted');
    return 'order deleted';
  }

  @override
  Future<CustomerOrder> updateOrderStatus(
      OrderStatus orderStatus, CustomerOrder customerOrder) async {
    QuerySnapshot querySnapshot = await _firebaseFirestore
        .collection('users')
        .doc('agents')
        .collection('agentData')
        .doc(_auth.currentUser!.uid)
        .collection('orders')
        .where("orderId", isEqualTo: customerOrder.orderId)
        .get();
    print('querySnapshot ${querySnapshot.docs}');

    customerOrder.orderStatus = orderStatus;
    QuerySnapshot querySnapshot1 = await _firebaseFirestore
        .collection('users')
        .doc('customers')
        .collection('customerData')
        .doc(_auth.currentUser!.uid)
        .collection('orders')
        .where("orderId", isEqualTo: customerOrder.orderId)
        .get();
    await querySnapshot1.docs.first.reference.update(customerOrder.toJson());
    return CustomerOrder(orderCost: 4000);
  }

  @override
  Future<CustomerOrder> updateServiceStatus(CustomerOrder customerOrder) async {
    print(
        'Updating service status for order: ${customerOrder.orderId} to ${customerOrder.carService?.status}');
    QuerySnapshot querySnapshot = await _firebaseFirestore
        .collection('users')
        .doc('agents')
        .collection('agentData')
        .doc(_auth.currentUser!.uid)
        .collection('orders')
        .where("orderId", isEqualTo: customerOrder.orderId)
        .get();
    if (querySnapshot.docs.isEmpty) {
      return CustomerOrder(orderCost: 2000);
    }
    QuerySnapshot querySnapshot1 = await _firebaseFirestore
        .collection('users')
        .doc('customers')
        .collection('customerData')
        .doc(_auth.currentUser!.uid)
        .collection('orders')
        .where("orderId", isEqualTo: customerOrder.orderId)
        .get();
    await querySnapshot1.docs.first.reference.update(customerOrder.toJson());
    return CustomerOrder(orderCost: 2000);
  }

  @override
  Future<List<CustomerOrder>> getRecentOrders() async {
    QuerySnapshot snapshot = await getIt<FirebaseFirestore>()
        .collection('users')
        .doc('customers')
        .collection('customerData')
        .doc(_auth.currentUser!.uid)
        .collection('orders')
        .where('orderStatus', isNotEqualTo: OrderStatus.COMPLETED.name)
        .get();

    return snapshot.docs
        .map((e) => CustomerOrder.fromJson(e.data() as Map<String, dynamic>))
        .toList();
  }

  @override
  Future<String> review(ReviewData reviewData) async {
    await getIt<FirebaseFirestore>()
        .collection('reviews')
        .doc('customersReview')
        .set(reviewData.toMap());
    return "reviewAdded";
  }
}
