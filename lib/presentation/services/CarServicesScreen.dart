import 'package:car_doctor/data/model/orders/CarService.dart';
import 'package:car_doctor/presentation/resources/RouteManager.dart';
import 'package:flutter/material.dart';

import '../../gen/assets.gen.dart';
import '../../gen/colors.gen.dart';
import '../resources/ColorManager.dart';
import '../widgets/CustomContainer.dart';

class CarServicesScreen extends StatefulWidget {
  const CarServicesScreen({super.key});

  @override
  State<CarServicesScreen> createState() => _CarServicesScreenState();
}

class _CarServicesScreenState extends State<CarServicesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(
            decoration: const BoxDecoration(
                gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: ColorsManager.bg_gradient,
            )),
            child: Column(children: [
              SizedBox(
                height: 120,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    IconButton(
                        onPressed: () => Navigator.pop(context),
                        icon: const Icon(Icons.arrow_forward),
                        color: ColorName.whiteColor),
                  ],
                ),
              ),
              CustomContainer(
                  padding: const EdgeInsets.all(10.0),
                  height: 670,
                  circularRadius: const Radius.circular(90),
                  bgColor: ColorName.whiteColor,
                  allBorder: true,
                  child: Column(children: [
                    const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "خدمات السيارة",
                            style: TextStyle(
                              color: ColorName.blueColor,
                              fontSize: 35,
                              fontWeight: FontWeight.bold,
                            ),
                          )
                        ]),
                    Row(
                      children: [
                        Container(
                          width: 180,
                          height: 30,
                          margin: const EdgeInsets.only(left: 20),
                          child: const TextField(
                            //CustomTextField(
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              prefixIcon: Icon(Icons.search),
                              labelText: 'ابحث عن خدمة',
                            ),
                            //   label: 'ابحث عن خدمة ', controller: null, checkValidation: (String) {
                            //},
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 18,
                    ),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text("خدمات الصيانة",
                            style: TextStyle(
                              color: ColorName.primaryColor,
                              fontSize: 25,
                            ))
                      ],
                    ),
                    const SizedBox(
                      height: 18,
                    ),
                    SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        reverse: true,
                        child: Column(children: [
                          Row(
                            children: [
                              //بداية الدوائر
                              Container(
                                  child: Assets.images.bett.image(
                                width: 140,
                                height: 140,
                              )),
                              Container(
                                  child: Assets.images.dis.image(
                                width: 140,
                                height: 140,
                              )),
                              Container(
                                child: Assets.images.changeCover.image(
                                  width: 140,
                                  height: 140,
                                ),
                              ),

                              GestureDetector(
                                onTap: () => Navigator.pushNamed(
                                    context, RouteManager.changeOil),
                                child: CustomContainer(
                                    bgColor: ColorName.lightGreyColor,
                                    allBorder: true,
                                    height: 120,
                                    width: 120,
                                    circularRadius: Radius.circular(100),
                                    child: Column(children: [
                                      const Row(
                                        children: [
                                          Padding(
                                              padding: EdgeInsets.only(
                                                  top: 60, left: 32)),
                                          Text(
                                            'تغيير زيت',
                                            style: TextStyle(
                                              color: ColorName.whiteColor,
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ],
                                      ),
                                      Row(children: [
                                        const Padding(
                                            padding:
                                                EdgeInsets.only(right: 25)),
                                        Assets.images.petrol.image(
                                          width: 50,
                                          height: 50,
                                        )
                                      ]),
                                    ])),
                              )
                            ],
                          ),
                        ])),
                    const SizedBox(
                      height: 18,
                    ),
                    const Divider(
                      color: ColorName.lightGreyColor,
                      thickness: 3,
                      indent: 10,
                      endIndent: 8,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text("خدمات اخرى",
                            style: TextStyle(
                              color: ColorName.blackColor,
                              fontSize: 25,
                            ))
                      ],
                    ),
                    const SizedBox(
                      height: 18,
                    ),
                    Row(
                      children: [
                        Container(
                            margin: const EdgeInsets.only(left: 90, bottom: 50),
                            child: Assets.images.moreService.image(
                              width: 140,
                              height: 140,
                            )),
                        GestureDetector(
                          onTap: () => Navigator.pushNamed(
                              context, RouteManager.request,
                              arguments: CarService(
                                  serviceName: 'فحص دوري', servicePrice: 330)),
                          child: CustomContainer(
                              bgColor: ColorName.lightGreyColor,
                              allBorder: true,
                              circularRadius: const Radius.circular(100),
                              height: 120,
                              width: 120,
                              margin:
                                  const EdgeInsets.only(left: 30, bottom: 50),
                              child: Column(children: [
                                const Row(
                                  children: [
                                    Padding(
                                        padding:
                                            EdgeInsets.only(top: 60, left: 15)),
                                    Text(
                                      'فحص دوري',
                                      style: TextStyle(
                                        color: ColorName.whiteColor,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                                Row(children: [
                                  const Padding(
                                      padding: EdgeInsets.only(right: 25)),
                                  Assets.images.examine.image(
                                    width: 50,
                                    height: 50,
                                  )
                                ]),
                              ])),
                        )
                      ],
                    )
                  ]))
            ])));
  }
}
