import 'package:car_doctor/data/model/orders/CustomerOrder.dart';
import 'package:flutter/material.dart';


class MyCarPlateNumberWidget extends StatelessWidget {
  final CustomerOrder customerOrder;

  const MyCarPlateNumberWidget({required this.customerOrder, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              customerOrder.car!.plateNumber!.plateNumber ?? '',
              style: TextStyle(fontSize: 20),
            ),
            Text(
              customerOrder.car!.plateNumber!.plateCode ?? '',
              style: TextStyle(fontSize: 20),
            )
          ],
        ),
      ],
    );
  }
}
