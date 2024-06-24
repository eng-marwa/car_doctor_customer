import 'package:car_doctor/data/model/orders/CarService.dart';
import 'package:car_doctor/presentation/resources/ColorManager.dart';
import 'package:car_doctor/presentation/resources/RouteManager.dart';
import 'package:flutter/material.dart';

import '../../gen/colors.gen.dart';
import '../widgets/CustomContainer.dart';



class ChangeOilScreen extends StatefulWidget {
  const ChangeOilScreen({
    super.key,
  });

  @override
  State<ChangeOilScreen> createState() => _ChangeOilScreenState();
}

class _ChangeOilScreenState extends State<ChangeOilScreen> {
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
            margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
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
                    "تغير زيت",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: ColorName.blueColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                      height: 0.2,
                    ),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  const Align(
                    alignment: Alignment.center,
                    child: Divider(
                      color: ColorName.lightGreyColor,
                      thickness: 2,
                      indent: 1,
                      endIndent: 8,
                      height: 1,
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'الخطوة الثالثة',
                        style:
                            TextStyle(fontSize: 16, color: ColorName.greyColor),
                      ),
                      Icon(
                        Icons.circle,
                        color: ColorName.errorColor,
                        size: 24.0,
                      ),
                      Divider(
                        color: Colors.red,
                        // color:ColorManager.errorColor,
                      ),
                      Text(
                        'الخطوة الثانية',
                        style:
                            TextStyle(fontSize: 16, color: ColorName.greyColor),
                      ),
                      Icon(
                        Icons.circle,
                        color: ColorName.errorColor,
                        size: 24.0,
                      ),
                      Divider(
                        color: ColorName.blueColor,
                      ),
                      Text(
                        'الخطوة الاولى',
                        style:
                            TextStyle(fontSize: 16, color: ColorName.greyColor),
                      ),
                      Icon(
                        Icons.circle,
                        size: 24.0,
                        color: ColorName.blueColor,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(onTap: () => Navigator.pushNamed(context, RouteManager.request,arguments:CarService(serviceName: 'زيت محرك معدني',servicePrice: 90)),
                          child: Container(
                              height: 100,
                              padding: const EdgeInsets.all(8),
                              alignment: Alignment.topRight,
                              decoration: const BoxDecoration(
                                  shape: BoxShape.rectangle,
                                  color: ColorName.primaryAssentColor,
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(10),
                                  )),
                              child: const Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Text(
                                    "+90 ",
                                    style: TextStyle(
                                      color: ColorName.blackColor,
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 50,
                                  ),
                                  Column(
                                    children: [
                                      Text(
                                        "زيت محرك معدني",
                                        style: TextStyle(
                                          color: ColorName.blackColor,
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(right: 30.0),
                                        child: Text(
                                          "خدمة تغير الزيت غير شامل الضريبة",
                                          style: TextStyle(
                                            color: ColorName.blackColor,
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                               ],
                              )),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        GestureDetector(onTap: () => Navigator.pushNamed(context, RouteManager.request,arguments: CarService(serviceName: 'زيت محرك التخليقي',servicePrice: 200)),
                          child: Container(
                              height: 100,
                              padding: const EdgeInsets.all(8),
                              alignment: Alignment.topRight,
                              decoration: const BoxDecoration(
                                  shape: BoxShape.rectangle,
                                  color: ColorName.primaryAssentColor,
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(10),
                                  )), child: const Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                "+200 ",
                                style: TextStyle(
                                  color: ColorName.blackColor,
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(
                                width: 50,
                              ),
                              Column(
                                children: [
                                  Text(
                                    "زيت محرك التخليقي",
                                    style: TextStyle(
                                      color: ColorName.blackColor,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(right: 30.0),
                                    child: Text(
                                      "خدمة تغير الزيت غير شامل الضريبة",
                                      style: TextStyle(
                                        color: ColorName.blackColor,
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          )),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        GestureDetector(onTap: () => Navigator.pushNamed(context, RouteManager.request , arguments: CarService(serviceName: 'زيت محرك شبه التخليقي',servicePrice: 130)),
                          child: Container(
                              height: 100,
                              padding: const EdgeInsets.all(8),
                              alignment: Alignment.topRight,
                              decoration: const BoxDecoration(
                                  shape: BoxShape.rectangle,
                                  color: ColorName.primaryAssentColor,
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(10),
                                  )), child: const Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                "+130 ",
                                style: TextStyle(
                                  color: ColorName.blackColor,
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(
                                width: 50,
                              ),
                              Column(
                                children: [
                                  Text(
                                    "زيت محرك شبه التخليقي",
                                    style: TextStyle(
                                      color: ColorName.blackColor,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(right: 30.0),
                                    child: Text(
                                      "خدمة تغير الزيت غير شامل الضريبة",
                                      style: TextStyle(
                                        color: ColorName.blackColor,
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),),
                        ),
                      ],
                    ),
                  )
                ])
            // child: Container(
            //
            //  color: Colors.red,
            //   height: 10,
            //   width: 10,
            ),
      ),
    );
    // child: Row(
    //
    // ),
  }
}
