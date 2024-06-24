import 'package:car_doctor/data/model/orders/CustomerOrder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:injectable/injectable.dart';

import '../../gen/colors.gen.dart';
import '../resources/ColorManager.dart';
import '../resources/RouteManager.dart';
import '../widgets/CustomButton.dart';
import '../widgets/CustomContainer.dart';
import '../widgets/CustomTextField.dart';
import '../widgets/CustomTextLink.dart';
import 'RepresentativeInfo.dart';

class OrderDetailsScreen extends StatefulWidget {
  const OrderDetailsScreen({super.key});

  @override
  State<OrderDetailsScreen> createState() => _OrderDetailsState();
}

class _OrderDetailsState extends State<OrderDetailsScreen> {
  late CustomerOrder customerOrder;

  @override
  Widget build(BuildContext context) {
    customerOrder = ModalRoute.of(context)?.settings.arguments as CustomerOrder;

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: ColorsManager.bg_gradient)),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                CustomContainer(
                  height: MediaQuery.of(context).size.height,
                  bgColor: ColorName.whiteColor,
                  allBorder: true,
                  circularRadius: Radius.circular(60),
                  padding: EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Expanded(
                            child: Text(
                              customerOrder.carService?.serviceName ??
                                  'تفاصيل الطلب',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold,
                                  color: ColorName.blueColor),
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
                      const Divider(
                        color: Colors.grey,
                        // color:ColorManager.errorColor,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const Padding(
                        padding: EdgeInsets.only(left: 200),
                        child: Text(
                          "معلومات الورشة",
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
                                flex: 2,
                                child: Text(
                                    customerOrder.client!.clientName ?? '',
                                    textAlign: TextAlign.right,
                                    style: TextStyle(fontSize: 16))),
                            Expanded(
                                flex: 1,
                                child: Text(
                                  'اسم الورشة',
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
                                flex: 2,
                                child: Text(
                                    customerOrder.client!.clientPhone ?? '',
                                    textAlign: TextAlign.right,
                                    style: TextStyle(fontSize: 16))),
                            Expanded(
                                flex: 1,
                                child: Text(
                                  'رقم  الورشة',
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
                                flex: 2,
                                child: Text(
                                    customerOrder.client!.clientAddress ?? '',
                                    textAlign: TextAlign.right,
                                    style: TextStyle(fontSize: 16))),
                            Expanded(
                                flex: 1,
                                child: Text(
                                  ' عنوان الورشة',
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
                      Visibility(
                        visible: customerOrder.representative != null,
                        child: RepresentativeInfo(
                          customerOrder: customerOrder,
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(left: 200),
                        child: Text(
                          "معلومات السيارة",
                          textAlign: TextAlign.right,
                          style: TextStyle(
                              fontSize: 20,
                              color: ColorName.blueColor,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      CustomButton(
                        onClick: () {
                          Navigator.pushNamed(context, RouteManager.carInfo,
                              arguments: customerOrder);
                        },
                        textColor: ColorName.whiteColor,
                        title: 'عرض',
                        bgColor: ColorName.blueColor,
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      const Divider(
                        color: Colors.grey,
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      const Padding(
                        padding: EdgeInsets.only(left: 200),
                        child: Text(
                          "الفاتورة",
                          textAlign: TextAlign.right,
                          style: TextStyle(
                              fontSize: 20,
                              color: ColorName.blueColor,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      CustomTextLink(
                        text: 'لعرض الفاتورة اضغط هنا',
                        fontSize: 20,
                        textColor: ColorName.primaryAssentColor,
                        onClick: () {
                          Navigator.pushNamed(context, RouteManager.bill,
                              arguments: customerOrder);
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
