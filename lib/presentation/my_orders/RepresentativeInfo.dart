import 'package:car_doctor/data/model/orders/CustomerOrder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../gen/colors.gen.dart';

class RepresentativeInfo extends StatelessWidget {
  final CustomerOrder customerOrder;

  RepresentativeInfo({required this.customerOrder});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.only(left: 200),
          child: Text(
            "معلومات المندوب",
            textAlign: TextAlign.right,
            style: TextStyle(
                fontSize: 20,
                color: ColorName.blueColor,
                fontWeight: FontWeight.bold),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Padding(
          padding: const EdgeInsets.all(5.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Expanded(
                  flex: 1,
                  child: Text(customerOrder.representative!.repName ?? '',
                      textAlign: TextAlign.right,
                      style: TextStyle(fontSize: 16))),
              Expanded(
                  flex: 1,
                  child: Text(
                    'اسم المندوب',
                    style: TextStyle(
                        fontSize: 16,
                        color: ColorName.greyLinkColor,
                        fontWeight: FontWeight.bold),
                    textAlign: TextAlign.right,
                  )),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(5.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Expanded(
                  flex: 1,
                  child: Text(customerOrder.representative!.repPhone ?? '',
                      textAlign: TextAlign.right,
                      style: TextStyle(fontSize: 16))),
              Expanded(
                  flex: 1,
                  child: Text(
                    'رقم جوال المندوب',
                    style: TextStyle(
                        fontSize: 16,
                        color: ColorName.greyLinkColor,
                        fontWeight: FontWeight.bold),
                    textAlign: TextAlign.right,
                  )),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.grey.shade300,
              borderRadius: BorderRadius.circular(16),
            ),
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        const Divider(
          color: Colors.grey,
        ),
        const SizedBox(
          height: 5,
        ),
      ],
    );
  }
}
