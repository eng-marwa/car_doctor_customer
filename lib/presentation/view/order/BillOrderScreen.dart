import 'package:car_doctor/data/model/orders/CustomerOrder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../gen/colors.gen.dart';
import '../../resources/ColorManager.dart';
import '../../widgets/CustomContainer.dart';


class BillOrderScreen extends StatefulWidget {
  @override
  State<BillOrderScreen> createState() => _BillState();
}

class _BillState extends State<BillOrderScreen> {
  @override
  Widget build(BuildContext context) {
    CustomerOrder order =
    ModalRoute.of(context)?.settings.arguments as CustomerOrder;
    return Scaffold(
      body: Container(
          constraints: const BoxConstraints.expand(),
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: ColorsManager.bg_gradient)),
          child: CustomContainer(
            width: double.infinity,
            height: MediaQuery.of(context).size.height / 2,
            bgColor: ColorName.whiteColor,
            allBorder: true,
            circularRadius: const Radius.circular(60),
            padding: const EdgeInsets.all(16),
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(left: 120),
                        child: Text(
                          'الفاتورة',
                          textAlign: TextAlign.right,
                          style: TextStyle(
                              fontSize: 30, fontWeight: FontWeight.bold),
                        ),
                      ),
                      IconButton(
                        icon: const Icon(Icons.arrow_forward),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  Padding(
                    padding: EdgeInsets.all(2),
                    child: CustomContainer(
                      bgColor: ColorName.bgTextField,
                      width: double.infinity,
                      height: 500,
                      allBorder: true,
                      circularRadius: const Radius.circular(60),
                      padding: const EdgeInsets.all(16),
                      child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: ListView(
                          children: <Widget>[
                            Text(
                              'Order ID: ${order.orderId??''}',
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(height: 20),
                            Text('Client Name: ${order.client?.clientName}'),
                            SizedBox(height: 20),
                            Text(
                                'Service Status: ${order.carService?.status?.name}'),
                            SizedBox(height: 20),
                            Text(
                              'Total Cost',
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                            Text('Total: ${order.orderCost}'),
                            const SizedBox(height: 20),
                            const Divider(),
                            const SizedBox(height: 20),
                            Text(
                              'Notes: ',
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(height: 20),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )),

      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
