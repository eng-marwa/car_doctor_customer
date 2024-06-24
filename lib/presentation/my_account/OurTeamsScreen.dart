import 'package:car_doctor/gen/colors.gen.dart';
import 'package:flutter/material.dart';

import '../../gen/assets.gen.dart';
import '../resources/ColorManager.dart';
import '../widgets/CustomContainer.dart';

class OurTeamsScreen extends StatefulWidget {
  const OurTeamsScreen({
    super.key,
  });

  @override
  State<OurTeamsScreen> createState() => _OurTeamsScreenState();
}

class _OurTeamsScreenState extends State<OurTeamsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          colors: ColorsManager.bg_gradient,
        ),
      ),
      child: SingleChildScrollView(
        child: Padding(
            padding: EdgeInsets.all(30),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  CustomContainer(
                    height: 750,
                    width: 550,
                    circularRadius: const Radius.circular(30),
                    alignment: Alignment.center,
                    allBorder: true,
                    bgColor: ColorName.whiteColor,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 15, horizontal: 15),
                      //padding: EdgeInsets.only(left:50,right: 50 ),
                      child: Column(
                        //mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                                  IconButton(
                                    icon: const Icon(Icons.arrow_forward),
                                    onPressed: () => Navigator.pop(context),
                                  ),
                                ]),
                                const SizedBox(width: 10),
                                Assets.images.ourTeam.image(
                                  alignment: Alignment.center,
                                  fit: BoxFit.cover,
                                ),
                              ]),
                          const Row(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                'من نحن ؟',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: ColorName.blackColor,
                                    fontSize: 30,
                                    fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                          Column(
                            //mainAxisSize: MainAxisSize.min,
                            children: [
                              CustomContainer(
                                  margin: EdgeInsets.symmetric(vertical: 10),
                                  width: 600,
                                  height: 450,
                                  circularRadius: Radius.circular(20),
                                  alignment: Alignment.center,
                                  allBorder: true,
                                  bgColor: ColorName.lightGreyColor,
                                  child: RichText(
                                    text: const TextSpan(
                                        style: TextStyle(
                                            fontSize: 25,
                                            color: ColorName.blackColor,
                                            fontWeight: FontWeight.bold),
                                        children: [
                                          TextSpan(
                                              text:
                                                  ' - (CarDoctor)  نحن فريق - '),
                                          TextSpan(
                                              text: '                    '),
                                          TextSpan(
                                              text:
                                                  ' مؤسسة تقنية سعودية نتميز بوجود '),
                                          TextSpan(
                                              text:
                                                  'مطورين ومصممين ذو خبرات عالية '),
                                          TextSpan(
                                              text:
                                                  'نقوم بتقديم عدة خدمات التي تخص '),
                                          TextSpan(
                                              text:
                                                  'السيارة ولدينا ايضا خدمة استلام '),
                                          TextSpan(
                                              text:
                                                  'السيارة من العميل وتسليمها له اذا أراد ذلك, '),
                                          TextSpan(
                                              text:
                                                  'وغاياتنا هي خدمة شعبنا العزيز وتوفير لهم الجهد والوقت. '),
                                        ]),
                                  )),
                            ],
                          ),
                        ],
                      ),
                    ),
                  )
                ])),
      ),
    ));
  }
}
