import 'package:car_doctor/presentation/my_account/ClientInfoCubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../gen/assets.gen.dart';
import '../../gen/colors.gen.dart';
import '../my_account/ClientInfoState.dart';
import '../resources/ColorManager.dart';
import '../resources/RouteManager.dart';
import '../widgets/CustomContainer.dart';
import '../widgets/CustomTextLink.dart';

class MyHomeScreen extends StatefulWidget {
  const MyHomeScreen({super.key});

  @override
  State<MyHomeScreen> createState() => _MyHomeScreenState();
}

class _MyHomeScreenState extends State<MyHomeScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ClientInfoCubit()..loadUserData(),
      child: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: ColorsManager.bg_gradient)),
          padding: const EdgeInsets.only(top: 30),
          child: SingleChildScrollView(
              child: CustomContainer(
            bgColor: ColorName.whiteColor,
            allBorder: false,
            circularRadius: const Radius.circular(50),
            height: 700,
            width: 500,
            child: Column(children: [
              CustomContainer(
                bgColor: ColorName.redColor,
                allBorder: true,
                circularRadius: const Radius.circular(20),
                width: 370,
                height: 40,
                padding: const EdgeInsets.all(8.0),
                margin: const EdgeInsets.all(10.0),
                alignment: Alignment.center,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.close),
                      color: ColorName.whiteColor,
                      padding: EdgeInsets.only(top: 1),
                    ),
                    const Expanded(
                      child: Text(
                          "تنبيه عزيزنا العميل لا يمكن تعديل او الغاء الطلب قبل موعدك ب12 ساعة . ",
                          style: TextStyle(
                              color: ColorName.whiteColor, fontSize: 13)),
                    ),
                  ],
                ),
              ),
              Row(
                children: [
                  CustomContainer(
                      bgColor: ColorName.whiteColor,
                      allBorder: true,
                      circularRadius: const Radius.circular(90),
                      height: 90,
                      width: 90,
                      child: Assets.images.noti.image()),
                  // Spacer(),
                  GestureDetector(
                    onTap: () =>
                        Navigator.pushNamed(context, RouteManager.contactUs),
                    child: CustomContainer(
                      bgColor: ColorName.whiteColor,
                      allBorder: true,
                      circularRadius: const Radius.circular(90),
                      height: 80,
                      width: 80,
                      child: Assets.images.call.image(),
                    ),
                  ),
                  const Spacer(),
                  BlocBuilder<ClientInfoCubit, ClientInfoState>(
                    builder: (context, state) {
                      if(state is ClientInfoLoading) {
                        return const CircularProgressIndicator();
                      }else if(state is ClientInfoLoaded){
                        return  Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Text(
                            "${state.userData?.displayName ?? ''}مرحبا",
                            style: const TextStyle(
                                color: ColorName.blackColor,
                                fontSize: 30,
                                fontWeight: FontWeight.bold),
                          ),
                        );
                      }else{
                        return Container();
                      }
                    },
                  ),
                ],
              ),
              Padding(
                  padding: const EdgeInsets.only(right: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      CustomContainer(
                          bgColor: ColorName.whiteColor,
                          allBorder: true,
                          circularRadius: const Radius.circular(90),
                          height: 30,
                          width: 30,
                          child: Assets.images.loc.image()),
                      CustomTextLink(
                          textAlign: TextAlign.right,onClick: ()=> Navigator.pushNamed(context, RouteManager.viewMap),
                          text: 'حدد موقعك من هنا',
                          textColor: ColorName.blueColor,
                          fontSize: 20,
                          textDirection: TextDirection.rtl),
                    ],
                  )),

              const Align(
                alignment: Alignment.center,
                child: Padding(
                  padding: EdgeInsets.only(right: 15.0),
                  child: Divider(
                    color: ColorName.primaryAssentColor,
                    thickness: 3,
                    indent: 200,
                    endIndent: 8,
                  ),
                ),
              ),

              const SizedBox(
                height: 10,
              ),

              GestureDetector(
                onTap: () =>
                    Navigator.pushNamed(context, RouteManager.carService),
                child: CustomContainer(
                  bgColor: ColorName.lightGreyColor,
                  allBorder: true,
                  circularRadius: const Radius.circular(10),
                  width: 370,
                  height: 100,
                  padding: const EdgeInsets.all(1.0),
                  margin: const EdgeInsets.all(10.0),
                  alignment: Alignment.topRight,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Assets.images.carser.image(),
                        const SizedBox(
                          width: 120,
                        ),
                        const Text(
                          "خدمات السيارة",
                          style: TextStyle(
                            color: ColorName.blueColor,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              // const SizedBox(
              //   height:3,
              // ),
              GestureDetector(
                onTap: () => Navigator.pushNamed(context, RouteManager.carCare),
                child: CustomContainer(
                  bgColor: ColorName.lightGreyColor,
                  allBorder: true,
                  circularRadius: Radius.circular(10),
                  width: 370,
                  height: 100,
                  padding: const EdgeInsets.all(4.0),
                  //  margin:const EdgeInsets.all(10.0),
                  alignment: Alignment.topRight,
                  // decoration:const BoxDecoration(
                  //   shape: BoxShape.rectangle,
                  //   color: Color.fromARGB(100,143,142,142),
                  //   borderRadius: BorderRadius.all(
                  //     Radius.circular(10),
                  //
                  //   ),
                  // ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Assets.images.care.image(),
                        const SizedBox(
                          width: 90,
                        ),
                        const Text(
                          "العناية بالسيارة",
                          style: TextStyle(
                            color: ColorName.blueColor,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              const SizedBox(
                height: 30,
              ),
              GestureDetector(
                onTap: () =>
                    Navigator.pushNamed(context, RouteManager.emergency),
                child: CustomContainer(
                  bgColor: ColorName.blueColor,
                  allBorder: true,
                  circularRadius: Radius.circular(20),
                  width: 370,
                  height: 80,
                  padding: EdgeInsets.all(1.0),
                  margin: EdgeInsets.all(10.0),
                  alignment: Alignment.topRight,
                  child: Padding(
                    padding: const EdgeInsets.all(8),
                    child: GestureDetector(
                      onTap: () =>
                          Navigator.pushNamed(context, RouteManager.emergency),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Assets.images.emer.image(),
                          const SizedBox(
                            width: 150,
                          ),
                          const Text(
                            "حالة طارئة",
                            style: TextStyle(
                              color: ColorName.whiteColor,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ]),
          )),
        ),
      ),
    );
  }
}
