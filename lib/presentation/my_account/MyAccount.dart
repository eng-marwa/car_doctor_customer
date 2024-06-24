import 'package:car_doctor/gen/colors.gen.dart';
import 'package:car_doctor/presentation/resources/RouteManager.dart';
import 'package:car_doctor/utils/extensions/Toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../data/datasource/local/SharedPreferencesService.dart';
import '../../data/model/UserData.dart';
import '../../di/AppModule.dart';
import '../../utils/ToastType.dart';
import '../resources/ColorManager.dart';
import '../widgets/CustomButton.dart';
import '../widgets/CustomContainer.dart';
import '../widgets/CustomTextLink.dart';
import 'ClientInfoCubit.dart';
import 'ClientInfoState.dart';

class MyAccountScreen extends StatefulWidget {
  const MyAccountScreen({super.key});

  @override
  State<MyAccountScreen> createState() => _MyAccountState();
}

class _MyAccountState extends State<MyAccountScreen> {
  late ClientInfoCubit _clientInfoCubit;
  final sharedPrefs = getIt<SharedPreferences>();

  @override
  void initState() {
    super.initState();
    _clientInfoCubit = getIt<ClientInfoCubit>();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ClientInfoCubit>(
        create: (_) => _clientInfoCubit,
        child: BlocListener<ClientInfoCubit, ClientInfoState>(
            listener: (context, state) {
              print('state: $state');
              if (state is SignOutSuccess) {
                widget.showToast(context, 'تم تسجيل الخروج بنجاح',
                    type: ToastType.success,
                    duration: const Duration(seconds: 3));
                Navigator.pushNamed(context, RouteManager.splash);
              }
            },
            child: Scaffold(
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
                        const SizedBox(height: 40),
                        CustomContainer(
                          height: MediaQuery.of(context).size.height - 150,
                          bgColor: ColorName.whiteColor,
                          allBorder: false,
                          circularRadius: const Radius.circular(60),
                          padding: const EdgeInsets.all(16),
                          child: Form(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                const Icon(
                                  Icons.account_circle,
                                  size: 100,
                                  color: ColorName.errorColor,
                                ),
                                const Text(
                                  'حسابي',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 30,
                                      fontWeight: FontWeight.bold),
                                ),
                                CustomContainer(
                                  bgColor: ColorName.bgTextField,
                                  margin: const EdgeInsets.only(top: 50),
                                  padding: const EdgeInsets.all(1),
                                  allBorder: true,
                                  height: 400,
                                  width: 380,
                                  circularRadius: const Radius.circular(30),
                                  child: Column(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 20),
                                        child: GestureDetector(
                                          onTap: () => Navigator.pushNamed(
                                              context,
                                              RouteManager.userInformation),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            children: [
                                              CustomTextLink(
                                                alignment: Alignment.topRight,
                                                text: 'بيانات المستخدم',
                                                textColor: ColorName.blueColor,
                                                isMultiline: false,
                                                fontSize: 20,
                                              ),
                                              const SizedBox(
                                                width: 20,
                                              ),
                                              const Icon(
                                                Icons.account_circle_rounded,
                                                color: ColorName.greyColor,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      const Divider(
                                        color: ColorName.primaryAssentColor,
                                      ),
                                      Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 20),
                                        child: GestureDetector(
                                          onTap: () => Navigator.pushNamed(
                                              context, RouteManager.contactUs),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            children: [
                                              CustomTextLink(
                                                text: 'تواصل معنا',
                                                textColor: ColorName.blueColor,
                                                isMultiline: false,
                                                fontSize: 20,
                                              ),
                                              const SizedBox(
                                                width: 20,
                                              ),
                                              const Icon(
                                                Icons
                                                    .quick_contacts_dialer_outlined,
                                                color: ColorName.greyColor,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      const Divider(
                                        color: ColorName.primaryAssentColor,
                                      ),
                                      Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 20),
                                        child: GestureDetector(
                                          onTap: () => Navigator.pushNamed(
                                              context, RouteManager.policy),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            children: [
                                              CustomTextLink(
                                                text: 'الشروط وسياسة الخصوصية',
                                                textColor: ColorName.blueColor,
                                                isMultiline: false,
                                                fontSize: 20,
                                              ),
                                              const SizedBox(
                                                width: 20,
                                              ),
                                              const Icon(
                                                Icons.local_police_rounded,
                                                color: ColorName.greyColor,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      const Divider(
                                        color: ColorName.primaryAssentColor,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 20),
                                        child: GestureDetector(
                                          onTap: () => Navigator.pushNamed(
                                              context,
                                              RouteManager.commonQuestion),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            children: [
                                              CustomTextLink(
                                                text: 'الاسئلة الشائعة',
                                                textColor: ColorName.blueColor,
                                                isMultiline: false,
                                                fontSize: 20,
                                              ),
                                              const SizedBox(
                                                width: 20,
                                              ),
                                              const Icon(
                                                Icons.question_answer_outlined,
                                                color: ColorName.greyColor,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      const Divider(
                                        color: ColorName.primaryAssentColor,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 20),
                                        child: GestureDetector(
                                          onTap: () => Navigator.pushNamed(
                                              context, RouteManager.ourTeams),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            children: [
                                              CustomTextLink(
                                                text: 'من نحن',
                                                textColor: ColorName.blueColor,
                                                isMultiline: false,
                                                fontSize: 20,
                                              ),
                                              const SizedBox(
                                                width: 20,
                                              ),
                                              const Icon(
                                                Icons.people_alt_outlined,
                                                color: ColorName.greyColor,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      const Divider(
                                        color: ColorName.primaryAssentColor,
                                      ),
                                      Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 20),
                                        child: GestureDetector(
                                          onTap: () => Navigator.pushNamed(
                                              context, '/joinus'),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            children: [
                                              CustomTextLink(
                                                text: 'انضم لفريقنا',
                                                textColor: ColorName.blueColor,
                                                isMultiline: false,
                                                fontSize: 20,
                                              ),
                                              const SizedBox(
                                                width: 20,
                                              ),
                                              const Icon(
                                                Icons.add_circle,
                                                color: ColorName.greyColor,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(
                                  height: 8,
                                ),
                                CustomButton(
                                    onClick: () {
                                      _clientInfoCubit.signOut();
                                    },
                                    textColor: ColorName.whiteColor,
                                    title: 'تسحيل الخروج',
                                    bgColor: ColorName.redTextColor),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              // This trailing comma makes auto-formatting nicer for build methods.
            )));
  }
}
