import 'package:car_doctor/presentation/resources/ColorManager.dart';
import 'package:flutter/material.dart';

import '../../gen/assets.gen.dart';
import '../../gen/colors.gen.dart';
import '../widgets/CustomContainer.dart';

class ContactUsScreen extends StatefulWidget {
  const ContactUsScreen({super.key});

  @override
  State<ContactUsScreen> createState() => _ContactUsScreenState();
}

class _ContactUsScreenState extends State<ContactUsScreen> {
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
                circularRadius: const Radius.circular(60),
                padding: const EdgeInsets.all(16),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                        IconButton(
                          icon: const Icon(Icons.arrow_forward),
                          onPressed: () => Navigator.pop(context),
                        ),
                      ]),
                      Assets.images.conect.image(height: 100, width: 150),
                      const Text(
                        " تواصل معنا ",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: ColorName.blackColor,
                          fontSize: 40,
                          height: 0.2,
                        ),
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                      Container(
                          decoration: const BoxDecoration(
                            color: ColorName.primaryAssentColor,
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            boxShadow: [
                              BoxShadow(
                                color: ColorName.whiteColor,
                              )
                            ],
                          ),
                          child: SizedBox(
                            height: 400,
                            width: double.infinity,
                            child: Column(children: [
                              const SizedBox(
                                height: 40,
                              ),
                              const Text(
                                " نحن في خدمتكم على مدار 24/7",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: ColorName.blackColor,
                                  fontSize: 20,
                                  height: 0.2,
                                ),
                              ),
                              Expanded(
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    SizedBox(
                                      width: 90,
                                      height: 90,
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(20),
                                        //child: Image.asset('image/whatsapp.png'),
                                        child: Assets.images.whatsapp.image(),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 90,
                                      height: 90,
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(20),
                                        // child: Image.asset('image/call.png'),
                                        child: Assets.images.call2.image(),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 90,
                                      height: 90,
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(20),
                                        //  child: Image.asset('image/email.png'),
                                        child: Assets.images.email.image(),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Expanded(
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    const SizedBox(
                                      height: 60,
                                    ),
                                    SizedBox(
                                      width: 90,
                                      height: 90,
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(20),
                                        // child: Image.asset('image/support.png'),
                                        child: Assets.images.support.image(),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 90,
                                      height: 90,
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(20),
                                        // child: Image.asset( 'image/instagram.png'),
                                        child: Assets.images.instagram.image(),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 40,
                                    ),
                                  ],
                                ),
                              )
                            ]),
                          )),
                    ]))));
  }
}
