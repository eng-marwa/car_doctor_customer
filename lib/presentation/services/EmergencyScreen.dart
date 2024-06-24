import 'package:car_doctor/gen/colors.gen.dart';
import 'package:car_doctor/presentation/resources/ColorManager.dart';
import 'package:flutter/material.dart';

import '../../data/model/orders/CarService.dart';
import '../../gen/assets.gen.dart';
import '../resources/RouteManager.dart';



class EmergencyScreen extends StatefulWidget {
  const EmergencyScreen({super.key});

  @override
  State<EmergencyScreen> createState() => _EmergencyScreenState();
}

class _EmergencyScreenState extends State<EmergencyScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: ColorsManager.bg_gradient,
          ),
        ),
        child: Container(
            padding: EdgeInsets.symmetric(horizontal: 5),
            decoration: const BoxDecoration(
              color: ColorName.whiteColor,
              borderRadius: BorderRadius.all(Radius.circular(90)),
              boxShadow: [
                BoxShadow(
                  color: Colors.white,
                )
              ],
            ),
            margin: const EdgeInsets.symmetric(vertical: 40, horizontal: 10),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.arrow_forward),
                        color: Colors.black,
                      ),
                    ],
                  ),
                  const Text(
                    "خدمات الطوارئ",
                    style: TextStyle(
                      color: ColorName.blueColor,
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Divider(
                    color: ColorName.lightGreyColor,
                    thickness: 3,
                    indent: 10,
                    endIndent: 8,
                  ),
                  const SizedBox(
                    height: 60,
                  ),
                  Column(children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                          width: 90,
                          margin: const EdgeInsets.all(0),
                          child: ClipRRect(
                            child: Assets.images.emergency
                                .image(width: 40, height: 40),
                          ),
                        ),
                        SizedBox(
                          width: 90,
                          child: ClipRRect(
                            child: Assets.images.emergency
                                .image(width: 40, height: 40),
                          ),
                        ),
                      ],
                    ),
                  ]),
                  SizedBox(
                    height: 180,
                    width: double.infinity,
                    child: Column(
                      children: [
                        Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              SizedBox(
                                width: 180,
                                height: 180,
                                child: Container(
                                  decoration: const BoxDecoration(
                                    color: ColorName.secondBeigeF0Color,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(20)),
                                  ),
                                  child: Stack(children: [
                                    Positioned(
                                      right: 70,
                                      top: 4,
                                      child: RotationTransition(
                                        turns: const AlwaysStoppedAnimation(
                                            340 / 360),
                                        child: Assets.images.soon.image(),
                                      ),
                                    ),
                                    const Center(
                                      child: Text(
                                        'اشتراك السيارة',
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
                                width: 180,
                                height: 180,
                                child: Container(
                                  decoration: const BoxDecoration(
                                    color: ColorName.secondBeigeF0Color,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(20)),
                                  ),
                                  child: Stack(children: [
                                    Positioned(
                                      right: 70,
                                      top: 4,
                                      child: RotationTransition(
                                        turns: const AlwaysStoppedAnimation(
                                            340 / 360),
                                        child: Assets.images.soon.image(),
                                      ),
                                    ),
                                    const Center(
                                      child: Text(
                                        'خلص عليك البنزين',
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
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Column(children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                          width: 90,
                          margin: const EdgeInsets.all(0),
                          child: ClipRRect(
                            child: Assets.images.emergency
                                .image(width: 40, height: 40),
                          ),
                        ),
                        Container(
                          width: 90,
                          child: ClipRRect(
                            child: Assets.images.emergency
                                .image(width: 40, height: 40),
                          ),
                        ),
                      ],
                    ),
                  ]),
                  SizedBox(
                    height: 200,
                    width: double.infinity,
                    child: Column(
                      children: [
                        Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              SizedBox(
                                width: 180,
                                height: 180,
                                child: Container(
                                  decoration: const BoxDecoration(
                                    color: ColorName.secondBeigeF0Color,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(20)),
                                  ),
                                  child: Stack(children: [
                                    Positioned(
                                      right: 70,
                                      top: 4,
                                      child: RotationTransition(
                                        turns: const AlwaysStoppedAnimation(
                                            340 / 360),
                                        child: Assets.images.soon.image(),
                                      ),
                                    ),
                                    const Center(
                                      child: Text(
                                        'بنشر كفر وتبغا نساعدك',
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
                                    arguments:CarService(serviceName: 'نقل السيارة بسطحة',servicePrice: 500)),
                                child: SizedBox(
                                  width: 180,
                                  height: 180,
                                  child: Container(
                                    decoration: const BoxDecoration(
                                      color: ColorName.blueColor,
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(20)),
                                    ),
                                    child: const Stack(children: [
                                      Center(
                                        child: Text(
                                          'نقل السيارة بسطحة',
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
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                      ],
                    ),
                  ),
                ])),
      ),
    ); // This trailing comma makes auto-formatting nicer for build methods.
  }
}
