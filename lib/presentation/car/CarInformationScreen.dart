import 'package:car_doctor/data/model/orders/CustomerOrder.dart';
import 'package:car_doctor/presentation/car/MyCarPlateNumberWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../di/AppModule.dart';
import '../../gen/assets.gen.dart';
import '../../gen/colors.gen.dart';
import '../resources/ColorManager.dart';
import '../widgets/CustomContainer.dart';
import '../widgets/CustomDropDownWidget.dart';
import '../widgets/CustomTextField.dart';
import 'CarPlateWidget.dart';
import 'CarState.dart';
import 'UserCarCubit.dart';
import 'ViewCarPlateWidget.dart';

class CarInformationScreen extends StatefulWidget {
  const CarInformationScreen({super.key});

  @override
  State<CarInformationScreen> createState() => _CarInformationState();
}

class _CarInformationState extends State<CarInformationScreen> {
  late CustomerOrder customerOrder;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    customerOrder = ModalRoute.of(context)?.settings.arguments as CustomerOrder;

    return Scaffold(
        body: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: ColorsManager.bg_gradient,
              ),
            ),
            child: CustomContainer(
                height: MediaQuery.of(context).size.height,
                bgColor: ColorName.whiteColor,
                allBorder: true,
                circularRadius: Radius.circular(60),
                padding: EdgeInsets.all(16),
                child: SingleChildScrollView(
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            const Expanded(
                              child: Text(
                                'معلومات السيارة',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 30,
                                    fontWeight: FontWeight.bold,
                                    color: ColorName.blueColor),
                              ),
                            ),
                            IconButton(
                              icon: Icon(Icons.arrow_forward),
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
                        Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Expanded(
                                  flex: 2,
                                  child: Text(customerOrder.car!.carType ?? '',
                                      textAlign: TextAlign.right,
                                      style: TextStyle(fontSize: 16))),
                              Expanded(
                                  flex: 1,
                                  child: Text(
                                    'نوع السيارة',
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
                                  child: Text(customerOrder.car!.carModel ?? '',
                                      textAlign: TextAlign.right,
                                      style: TextStyle(fontSize: 16))),
                              Expanded(
                                  flex: 1,
                                  child: Text(
                                    'موديل السيارة',
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
                                  child: Text(customerOrder.car!.carColor ?? '',
                                      textAlign: TextAlign.right,
                                      style: TextStyle(fontSize: 16))),
                              Expanded(
                                  flex: 1,
                                  child: Text(
                                    'لون السيارة',
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
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Align(
                                alignment: Alignment.topRight,
                                child: Text(
                                  'رقم اللوحة',
                                  style: TextStyle(
                                      fontSize: 16,
                                      color: ColorName.greyLinkColor,
                                      fontWeight: FontWeight.bold),
                                  textAlign: TextAlign.right,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 8.0, horizontal: 30),
                                child: Container(
                                  width: 200,
                                  height: 80,
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                          image: AssetImage(Assets
                                              .images
                                              .saudiArabiaLicensePlateTemporary
                                              .path),
                                          fit: BoxFit.fill)),
                                  child: MyCarPlateNumberWidget(
                                      customerOrder: customerOrder),
                                ),
                              ),
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
                                  child: Text(customerOrder.car!.carYear ?? '',
                                      textAlign: TextAlign.right,
                                      style: TextStyle(fontSize: 16))),
                              Expanded(
                                  flex: 1,
                                  child: Text(
                                    'سنة الاصدار',
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
                                  child: Text(customerOrder.car!.carFuel ?? '',
                                      textAlign: TextAlign.right,
                                      style: TextStyle(fontSize: 16))),
                              Expanded(
                                  flex: 1,
                                  child: Text(
                                    'نوع الوقود',
                                    style: TextStyle(
                                        fontSize: 16,
                                        color: ColorName.greyLinkColor,
                                        fontWeight: FontWeight.bold),
                                    textAlign: TextAlign.right,
                                  )),
                            ],
                          ),
                        ),
                      ]),
                ))));
  }
}
