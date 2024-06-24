import 'package:car_doctor/data/model/orders/OrderServiceStatus.dart';
import 'package:car_doctor/presentation/resources/ColorManager.dart';
import 'package:flutter/material.dart';

import '../../data/model/orders/CarService.dart';
import '../../gen/assets.gen.dart';
import '../../gen/colors.gen.dart';
import '../resources/RouteManager.dart';
import '../widgets/CustomContainer.dart';

class CarCareScreen extends StatefulWidget {
  const CarCareScreen({super.key});

  @override
  State<CarCareScreen> createState() => _CarCareScreenState();
}

class _CarCareScreenState extends State<CarCareScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: ColorsManager.bg_gradient,
              ),
            ),
            child: CustomContainer(
                margin:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
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
                          IconButton(
                            onPressed: () => Navigator.pop(context),
                            icon: Icon(Icons.arrow_forward),
                            color: ColorName.blackColor,
                          ),
                        ],
                      ),
                      const Text(
                        "العناية بالسيارة",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: ColorName.blueColor,
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          height: 0.2,
                        ),
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      const Divider(
                        color: ColorName.lightGreyColor,
                        thickness: 2,
                        indent: 1,
                        endIndent: 8,
                        height: 1,
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      Column(children: [
                        Container(
                            child: SizedBox(
                          height: 180,
                          child: Column(
                            children: [
                              Expanded(
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    SizedBox(
                                      width: 170,
                                      height: 170,
                                      child: Container(
                                        decoration: const BoxDecoration(
                                          color: ColorName.secondBeigeF0Color,
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(20)),
                                        ),
                                        child: Stack(children: [
                                          Positioned(
                                            right: 70,
                                            top: 4,
                                            child: RotationTransition(
                                              turns:
                                                  const AlwaysStoppedAnimation(
                                                      340 / 360),
                                              child: Assets.images.soon.image(),
                                            ),
                                          ),
                                          const Center(
                                            child: Text(
                                              'تظليل السيارة',
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                color: ColorName.whiteColor,
                                                fontSize: 20,
                                                height: 0.2,
                                              ),
                                            ),
                                          ),
                                        ]),
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap: () => Navigator.pushNamed(
                                          context, RouteManager.request,
                                          arguments: CarService(
                                              serviceName: 'غسيل السيارة',
                                              servicePrice: 100)),
                                      child: SizedBox(
                                        width: 170,
                                        height: 170,
                                        child: Container(
                                          decoration: const BoxDecoration(
                                            color: ColorName.blueColor,
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(20)),
                                          ),
                                          child: Stack(children: [
                                            Center(
                                              child: Text(
                                                'غسيل السيارة',
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                  color: ColorName.whiteColor,
                                                  fontSize: 20,
                                                  height: 0.2,
                                                ),
                                              ),
                                            ),
                                          ]),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        )),
                        const SizedBox(
                          height: 10,
                        ),
                        Container(
                            child: SizedBox(
                          height: 200,
                          width: double.infinity,
                          child: Column(
                            children: [
                              Expanded(
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    SizedBox(
                                      width: 170,
                                      height: 170,
                                      child: Container(
                                        decoration: const BoxDecoration(
                                          color: ColorName.secondBeigeF0Color,
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(20)),
                                        ),
                                        child: Stack(children: [
                                          Positioned(
                                            child: RotationTransition(
                                              turns: AlwaysStoppedAnimation(
                                                  340 / 360),
                                              child: Assets.images.soon.image(),
                                            ),
                                            right: 70,
                                            top: 4,
                                          ),
                                          const Center(
                                            child: Text(
                                              'تنجيد المقاعد',
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                color: ColorName.whiteColor,
                                                fontSize: 20,
                                                height: 0.2,
                                              ),
                                            ),
                                          ),
                                        ]),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 170,
                                      height: 170,
                                      child: Container(
                                        decoration: const BoxDecoration(
                                          color: ColorName.secondBeigeF0Color,
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(20)),
                                        ),
                                        child: Stack(children: [
                                          Positioned(
                                            right: 70,
                                            top: 4,
                                            child: RotationTransition(
                                              turns:
                                                  const AlwaysStoppedAnimation(
                                                      340 / 360),
                                              child: Assets.images.soon.image(),
                                            ),
                                          ),
                                          Center(
                                            child: Text(
                                              'تلميع السيارة',
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 20,
                                                height: 0.2,
                                              ),
                                            ),
                                          ),
                                        ]),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ))
                      ])
                    ]))));

    // This trailing comma makes auto-formatting nicer for build methods.
  }
}
