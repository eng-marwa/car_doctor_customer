import 'package:flutter/material.dart';

import '../../gen/assets.gen.dart';
import '../../gen/colors.gen.dart';
import '../widgets/CustomContainer.dart';

class CommonQuestionScreen extends StatefulWidget {
  const CommonQuestionScreen({
    super.key,
  });

  @override
  State<CommonQuestionScreen> createState() => _CommonQuestionScreenState();
}

class _CommonQuestionScreenState extends State<CommonQuestionScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            decoration: const BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                    colors: [
                  // ColorName.bg_gradient,
                  ColorName.blackColor,
                  ColorName.blueColor,
                ])),
            child: SingleChildScrollView(
                padding: const EdgeInsets.only(top: 60),
                child: CustomContainer(
                    bgColor: ColorName.whiteColor,
                    allBorder: true,
                    circularRadius: Radius.circular(90),
                    height: 830,
                    width: 500,
                    // decoration:const BoxDecoration(
                    // color: Colors.white,
                    // borderRadius: BorderRadius.all(Radius.circular(90)),
                    // ),

                    child: Column(children: [
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Padding(padding: EdgeInsets.only(top: 100)),
                          Assets.images.question.image(),
                          const Text(
                            "الاسئلة الشائعة",
                            style: TextStyle(
                                color: ColorName.blackColor,
                                fontSize: 33,
                                fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          IconButton(
                              onPressed: () {},
                              icon: const Icon(Icons.arrow_forward),
                              color: ColorName.blackColor),
                        ],
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                      CustomContainer(
                        bgColor: ColorName.lightGreyColor,
                        allBorder: true,
                        circularRadius: Radius.circular(10),
                        width: 370,
                        height: 100,
                        padding: const EdgeInsets.all(1.0),
                        margin: const EdgeInsets.all(10.0),
                        alignment: Alignment.topRight,
                        child: Column(children: [
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              IconButton(
                                  onPressed: () {},
                                  icon: Icon(Icons.arrow_downward_sharp),
                                  color: ColorName.blackColor),
                              const SizedBox(
                                width: 4,
                              ),
                              const Text(
                                "ماهي المدن التي تتوفر فيها خدماتنا ؟",
                                style: TextStyle(
                                  color: ColorName.blackColor,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(
                                width: 18,
                              ),
                            ],
                          ),
                          const Row(
                            children: [
                              Padding(padding: EdgeInsets.only(left: 24)),
                              Text(
                                "تتوفر خدماتنا حالياً في المدينة المنورة فقط",
                                style: TextStyle(
                                  color: ColorName.errorColor,
                                  fontSize: 20,
                                ),
                              ),
                            ],
                          )
                        ]),
                      ),
                      CustomContainer(
                        bgColor: ColorName.lightGreyColor,
                        allBorder: true,
                        circularRadius: Radius.circular(10),
                        width: 370,
                        height: 100,
                        padding: const EdgeInsets.all(1.0),
                        margin: const EdgeInsets.all(10.0),
                        alignment: Alignment.topRight,
                        child: Column(children: [
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              IconButton(
                                  onPressed: () {},
                                  icon: Icon(Icons.arrow_downward_sharp),
                                  color: ColorName.blackColor),
                              const SizedBox(
                                width: 100,
                              ),
                              const Text(
                                "ماذا تشمل رسوم الخدمة ؟",
                                style: TextStyle(
                                  color: ColorName.blackColor,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          const Row(
                            children: [
                              Padding(padding: EdgeInsets.only(left: 30)),
                              Text(
                                "رسوم الخدمة تشمل نقل السيارة من والى موقعك",
                                style: TextStyle(
                                  color: ColorName.errorColor,
                                  fontSize: 18,
                                ),
                              ),
                            ],
                          )
                        ]),
                      ),
                      CustomContainer(
                        bgColor: ColorName.lightGreyColor,
                        allBorder: true,
                        circularRadius: Radius.circular(10),
                        width: 370,
                        height: 100,
                        padding: const EdgeInsets.all(1.0),
                        margin: const EdgeInsets.all(10.0),
                        alignment: Alignment.topRight,
                        child: Column(children: [
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              IconButton(
                                  onPressed: () {},
                                  icon: Icon(Icons.arrow_downward_sharp),
                                  color: ColorName.blackColor),
                              const SizedBox(
                                width: 170,
                              ),
                              const Text(
                                "كم مدة الفحص ؟",
                                style: TextStyle(
                                  color: ColorName.blackColor,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          const Row(
                            children: [
                              Padding(padding: EdgeInsets.only(left: 5)),
                              Text(
                                "تختلف مدة الفحص حسب نوع العطل من 24 ساعة الى 28 ساعة كحد اقصى ",
                                style: TextStyle(
                                  color: ColorName.errorColor,
                                  fontSize: 12.5,
                                ),
                              ),
                            ],
                          ),
                        ]),
                      ),
                      CustomContainer(
                        bgColor: ColorName.lightGreyColor,
                        allBorder: true,
                        circularRadius: Radius.circular(10),
                        width: 370,
                        height: 100,
                        padding: const EdgeInsets.all(1.0),
                        margin: const EdgeInsets.all(10.0),
                        alignment: Alignment.topRight,
                        child: Column(children: [
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              IconButton(
                                  onPressed: () {},
                                  icon: Icon(Icons.arrow_downward_sharp),
                                  color: ColorName.blackColor),
                              const SizedBox(
                                width: 38,
                              ),
                              const Text(
                                "كم تكلفة خدمة إصلاحات السيارة ؟",
                                style: TextStyle(
                                  color: ColorName.blackColor,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          const Row(
                            children: [
                              Padding(padding: EdgeInsets.only(left: 80)),
                              Text(
                                "بعد الاستلام والفحص يتم الافادة بالتكلفة",
                                style: TextStyle(
                                  color: ColorName.errorColor,
                                  fontSize: 18,
                                ),
                              ),
                            ],
                          ),
                        ]),
                      ),
                      CustomContainer(
                        bgColor: ColorName.lightGreyColor,
                        allBorder: true,
                        circularRadius: Radius.circular(10),
                        width: 370,
                        height: 100,
                        padding: const EdgeInsets.all(1.0),
                        margin: const EdgeInsets.all(10.0),
                        alignment: Alignment.topRight,
                        child: Column(children: [
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              IconButton(
                                  onPressed: () {},
                                  icon: Icon(Icons.arrow_downward_sharp),
                                  color: ColorName.blackColor),
                              const SizedBox(
                                width: 175,
                              ),
                              const Text(
                                "كم مدة الضمان ؟",
                                style: TextStyle(
                                  color: ColorName.blackColor,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          const Row(
                            children: [
                              Padding(padding: EdgeInsets.only(left: 80)),
                              Text(
                                "نوفر ضمان 30 يوم على جميع الاصلاحات",
                                style: TextStyle(
                                  color: ColorName.errorColor,
                                  fontSize: 18,
                                ),
                              ),
                            ],
                          ),
                        ]),
                      ),
                    ])))));
  }
}
