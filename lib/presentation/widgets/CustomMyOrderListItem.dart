import 'package:car_doctor/data/model/orders/CustomerOrder.dart';
import 'package:car_doctor/presentation/my_orders/MyOrderCubit.dart';
import 'package:flutter/material.dart';

import '../../data/model/orders/OrderServiceStatus.dart';
import '../../gen/colors.gen.dart';
import '../resources/RouteManager.dart';
import 'CustomTextLink.dart';

class CustomMyOrderListItem extends StatelessWidget {
  CustomerOrder order;
   CustomMyOrderListItem(this.order,{super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: order.carService?.status == OrderServiceStatus.DELIVER
          ? ColorName.redContainerColor
          :  order.carService?.status == OrderServiceStatus.COMPLETED?ColorName.lightGreenColor:Colors.grey[200],
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
            SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Visibility(
                //     visible:
                //     order?.carService?.status != OrderServiceStatus.DELIVERED,
                //     child:
                    TextButton(
                      style: TextButton.styleFrom(
                        backgroundColor: Colors.green,
                      ),
                      onPressed: () => Navigator.pushNamed(
                          context, RouteManager.tracking,
                          arguments: order).then((value){
                        // final workshopOrderCubit = context.read<MyOrderCubit>();
                        // // Call the method to reload the orders
                        // workshopOrderCubit.loadAllOrders();
                      }),
                      child: const Text(
                        'متابعة الطلب',
                        style: TextStyle(color: Colors.white),
                      ),
                    )
    // ),
                ,CustomTextLink(
                  onClick: () => Navigator.of(context)
                      .pushNamed(RouteManager.orderDetails, arguments: order),
                  text: 'تفاصيل الطلب',
                  textColor: ColorName.blueColor,
                )]),
              ],
            ),
        ),
    );
  }
}
