import 'package:car_doctor/data/model/orders/CustomerOrder.dart';
import 'package:car_doctor/data/model/orders/OrderServiceStatus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../gen/colors.gen.dart';

import '../resources/RouteManager.dart';
import '../widgets/CustomTextLink.dart';

class RecentRepOrderListItem extends StatelessWidget {
  final CustomerOrder order;

  const RecentRepOrderListItem(this.order, {super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Order ID: ${order.orderId}',
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: ColorName.blueColor),
            ),
            SizedBox(height: 8),
            Text(
              'Order Date: ${order.orderDate}',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              'Client Name: ${order.client?.clientName}',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 8),
            Text(
              'Representative Name: ${order.representative?.repName}',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 8),
            Text(
              'Service Name: ${order.carService?.serviceName}',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 8),
            Text(
              'Service Status: ${order.carService?.status?.name}',
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
