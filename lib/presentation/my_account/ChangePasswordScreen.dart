import 'package:car_doctor/utils/extensions/Toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../data/datasource/local/SharedPreferencesService.dart';
import '../../data/model/UserData.dart';
import '../../di/AppModule.dart';
import '../../gen/colors.gen.dart';
import '../../utils/ToastType.dart';
import '../resources/ColorManager.dart';
import '../widgets/CustomButton.dart';
import '../widgets/CustomTextField.dart';
import 'ChangePasswordCubit.dart';
import 'ChangePasswordState.dart';

class ChangePasswordScreen extends StatefulWidget {
  const ChangePasswordScreen({super.key});

  @override
  State<ChangePasswordScreen> createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePasswordScreen> {
  final ChangePasswordCubit clientInfoCubit = getIt<ChangePasswordCubit>();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late SharedPreferences sharedPreferences;
  UserData? user;
  late TextEditingController currentPasswordController;
  late TextEditingController newPasswordControllerController;
  late TextEditingController confirmNewPasswordControllerController;

  @override
  void initState() {
    super.initState();
    sharedPreferences = getIt<SharedPreferences>();
    final sharedPreferencesService =
        SharedPreferencesService<UserData>(sharedPreferences);
    user = sharedPreferencesService.getObject('user', UserData.fromJson);
    currentPasswordController = TextEditingController();
    newPasswordControllerController = TextEditingController();
    confirmNewPasswordControllerController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    currentPasswordController.dispose();
    newPasswordControllerController.dispose();
    confirmNewPasswordControllerController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ChangePasswordCubit>(
        create: (_) => clientInfoCubit,
        child: BlocListener<ChangePasswordCubit, ChangePasswordState>(
            listener: (context, state) {
              if (state is ChangePasswordOrderStatusUpdated) {
                widget.showToast(context, 'تم تحديث البيانات بنجاح',
                    type: ToastType.success,
                    duration: const Duration(seconds: 3));
              }
            },
            child: Scaffold(
              body: SingleChildScrollView(
                child: Container(
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                      colors: ColorsManager.bg_gradient,
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 110),
                    child: Container(
                      alignment: Alignment.center,
                      width: 1500,
                      height: 700,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(90)),
                      ),
                      padding: const EdgeInsets.all(10),
                      child: Form(
                        key: _formKey,
                        child: Column(
                          children: <Widget>[
                            const SizedBox(height: 10),
                            const Text(
                              "تغيير رمز المرور",
                              style: TextStyle(
                                color: ColorName.blackColor,
                                fontSize: 35,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 10),
                            const Divider(
                              color: ColorName.greyColor,
                            ),
                            const SizedBox(height: 20),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                CustomTextField(
                                  alignment: Alignment.centerRight,
                                  checkValidation: (value) => value!.isEmpty
                                      ? 'يرجى كتابة الرقم السري'
                                      : null,
                                  textAlign: TextAlign.right,
                                  //type: TextInputType.visiblePassword,
                                  fontSize: 15,
                                  type: TextInputType.visiblePassword,
                                  controller: currentPasswordController,
                                  label: ':ادخل رمز المرور الحالي',
                                ),
                                SizedBox(height: 8),
                                CustomTextField(
                                  alignment: Alignment.centerRight,
                                  checkValidation: (value) => value!.isEmpty
                                      ? 'يرجى كتابة الرقم السري'
                                      : null,
                                  textAlign: TextAlign.right,
                                  //type: TextInputType.visiblePassword,
                                  fontSize: 15,
                                  type: TextInputType.visiblePassword,
                                  controller: newPasswordControllerController,
                                  label: ':ادخل رمز المرور الجديد',
                                ),
                                CustomTextField(
                                  alignment: Alignment.centerRight,
                                  checkValidation: (value) => value!.isEmpty
                                      ? 'يرجى كتابة الرقم السري'
                                      : value !=
                                              newPasswordControllerController
                                                  .value.text
                                          ? 'رمز المرور غير متطابق'
                                          : null,
                                  textAlign: TextAlign.right,
                                  //type: TextInputType.visiblePassword,
                                  fontSize: 15,
                                  type: TextInputType.visiblePassword,
                                  controller:
                                      confirmNewPasswordControllerController,
                                  label: ':اكد رمز المرور الجديد',
                                ),
                              ],
                            ),
                            const SizedBox(height: 50),
                            Container(
                              width: 200,
                              height: 70,
                              decoration: const BoxDecoration(
                                color: ColorName.blackColor,
                                borderRadius: BorderRadius.all(
                                  Radius.circular(25),
                                ),
                              ),
                              child: TextButton(
                                onPressed: () {},
                                child: Container(
                                  width: 300,
                                  height: 50,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(60),
                                  ),
                                  child: Center(
                                    child: CustomButton(
                                        onClick: () {
                                          if (_formKey.currentState!
                                              .validate()) {
                                            clientInfoCubit.updatePassword(
                                                newPasswordControllerController
                                                    .value.text);
                                          }
                                        },
                                        bgColor: ColorName.blackColor,
                                        title: "تغيير رمز المرور",
                                        textColor: ColorName.whiteColor),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            )));
  }
}
