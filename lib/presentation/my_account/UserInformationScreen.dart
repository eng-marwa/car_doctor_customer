import 'package:car_doctor/gen/colors.gen.dart';
import 'package:car_doctor/presentation/resources/ColorManager.dart';
import 'package:car_doctor/presentation/widgets/CustomButton.dart';
import 'package:car_doctor/presentation/widgets/CustomTextField.dart';
import 'package:car_doctor/utils/extensions/Toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../data/datasource/local/SharedPreferencesService.dart';
import '../../data/model/UserData.dart';
import '../../di/AppModule.dart';
import '../../utils/ToastType.dart';
import '../resources/RouteManager.dart';
import '../widgets/CustomContainer.dart';
import '../widgets/CustomTextLink.dart';
import 'ClientInfoCubit.dart';
import 'ClientInfoState.dart';

class UserInformationScreen extends StatefulWidget {
  const UserInformationScreen({
    super.key,
  });

  @override
  State<UserInformationScreen> createState() => _UserInformationScreenState();
}

class _UserInformationScreenState extends State<UserInformationScreen> {
  late SharedPreferences sharedPreferences;
  UserData? user;
  late TextEditingController nameController;
  late TextEditingController idController;
  late TextEditingController phoneController;
  late TextEditingController emailController;
  late TextEditingController addressController;
  late ClientInfoCubit _clientInfoCubit;

  @override
  void initState() {
    super.initState();
    _clientInfoCubit = getIt<ClientInfoCubit>();
    sharedPreferences = getIt<SharedPreferences>();
    final sharedPreferencesService =
        SharedPreferencesService<UserData>(sharedPreferences);
    user = sharedPreferencesService.getObject('user', UserData.fromJson);
    nameController = TextEditingController(text: user?.displayName ?? '');
    idController = TextEditingController(text: user?.userId ?? '');
    phoneController = TextEditingController(text: user?.phone ?? '');
    emailController = TextEditingController(text: user?.email ?? '');
    addressController = TextEditingController(text: user?.address ?? '');
  }

  @override
  void dispose() {
    super.dispose();
    nameController.dispose();
    phoneController.dispose();
    emailController.dispose();
    addressController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ClientInfoCubit>(
        create: (_) => _clientInfoCubit,
        child: BlocListener<ClientInfoCubit, ClientInfoState>(
            listener: (context, state) {
              print('state: $state');
              if (state is ClientInfoOrderStatusUpdated) {
                widget.showToast(context, 'تم تحديث البيانات بنجاح',
                    type: ToastType.success,
                    duration: const Duration(seconds: 3));
              }
            },
            child: Scaffold(
                body: Container(
              alignment: Alignment.centerRight,
              decoration: const BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                      colors: ColorsManager.bg_gradient)),
              child: CustomContainer(
                  circularRadius: const Radius.circular(10),
                  height: MediaQuery.of(context).size.height - 50,
                  alignment: Alignment.topCenter,
                  padding: const EdgeInsets.all(8.0),
                  bgColor: ColorName.whiteColor,
                  allBorder: true,
                  child: SingleChildScrollView(
                    child: Form(
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                          Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                IconButton(
                                  icon: const Icon(Icons.arrow_forward),
                                  onPressed: () => Navigator.pop(context),
                                ),
                              ]),
                          const Text(
                            'بيانات المستخدم',
                            style: TextStyle(
                                fontSize: 30, fontWeight: FontWeight.bold),
                          ),
                          CustomTextField(
                            alignment: Alignment.centerRight,
                            checkValidation: (value) =>
                                value!.isEmpty ? 'يرجى كتابة الاسم' : null,
                            textAlign: TextAlign.right,
                            label: 'الاسم',
                            type: TextInputType.text,
                            fontSize: 15,
                            controller: nameController,
                          ),
                          CustomTextField(enabled: false,
                            alignment: Alignment.centerRight,
                            checkValidation: (value) =>
                                value!.isEmpty ? 'يرجى كتابة الاسم' : null,
                            textAlign: TextAlign.right,
                            type: TextInputType.phone,
                            fontSize: 15,
                            controller: phoneController,
                            label: 'رقم الجوال',
                          ),
                          CustomTextField(
                            enabled: false,
                            alignment: Alignment.centerRight,
                            checkValidation: (value) =>
                                value!.isEmpty ? 'يرجى كتابة رقم الهوية' : null,
                            textAlign: TextAlign.right,
                            type: TextInputType.emailAddress,
                            fontSize: 15,
                            controller: emailController,
                            label: 'رقم الهوية',
                          ),
                          CustomTextField(
                            enabled: false,
                            alignment: Alignment.centerRight,
                            checkValidation: (value) =>
                                value!.isEmpty ? 'يرجى كتابة الايميل' : null,
                            textAlign: TextAlign.right,
                            type: TextInputType.number,
                            fontSize: 15,
                            controller: idController,
                            label: 'الايميل',
                          ),
                          CustomTextField(
                            alignment: Alignment.centerRight,
                            checkValidation: (value) =>
                                value!.isEmpty ? 'يرجى كتابة العنوان' : null,
                            textAlign: TextAlign.right,
                            type: TextInputType.text,
                            fontSize: 15,
                            controller: addressController,
                            label: 'العنوان',
                          ),
                          // Row(
                          //     mainAxisAlignment: MainAxisAlignment.end,
                          //     children: [
                          //       CustomTextLink(
                          //           text: 'تغيير كلمة السر',
                          //           textColor: ColorName.lightBlueColor,
                          //           onClick: () {
                          //             Navigator.pushNamed(
                          //                 context, RouteManager.changePassword);
                          //           }),
                          //       const Text(
                          //         'الرقم السري',
                          //         style: TextStyle(
                          //             fontSize: 15,
                          //             fontWeight: FontWeight.bold),
                          //       ),
                          //     ]),
                        
                          TextButton(
                            onPressed: () {},
                            child: Container(
                              width: 200,
                              height: 50,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(13),
                                color: const Color(0xff1f058a),
                              ),
                              child: Center(
                                child: CustomButton(
                                    onClick: () {
                                      UserData userData = user!;
                                      userData.displayName =
                                          nameController.text;
                                      userData.phone = phoneController.text;
                                      userData.address = addressController.text;
                                      _clientInfoCubit.updateUserData(userData);
                                    },
                                    bgColor: ColorName.blueColor,
                                    title: "تحديث البيانات",
                                    textColor: ColorName.whiteColor),
                              ),
                            ),
                          ),
                        ])),
                  )),
            ))));
  }
}
