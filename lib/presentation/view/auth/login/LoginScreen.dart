import 'package:car_doctor/di/AppModule.dart';
import 'package:car_doctor/gen/assets.gen.dart';
import 'package:car_doctor/gen/colors.gen.dart';
import 'package:car_doctor/presentation/view/auth/login/LoginCubit.dart';
import 'package:car_doctor/presentation/widgets/CustomButton.dart';
import 'package:car_doctor/presentation/widgets/CustomContainer.dart';
import 'package:car_doctor/presentation/widgets/CustomTextField.dart';
import 'package:car_doctor/presentation/widgets/CustomTextLink.dart';
import 'package:car_doctor/presentation/widgets/ToastWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../utils/ToastType.dart';
import '../../../../validation/PhoneNumberValidation.dart';
import '../../../resources/ColorManager.dart';
import '../../../resources/RouteManager.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _phoneController = TextEditingController();
  late PhoneNumberInput _phoneNumberInput;
  late LoginCubit _loginCubit;

  @override
  void initState() {
    super.initState();
    _loginCubit = getIt<LoginCubit>();
    _phoneNumberInput = const PhoneNumberInput.pure();
  }

  @override
  void dispose() {
    super.dispose();
    _loginCubit.close();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<LoginCubit>(
        create: (_) => _loginCubit,
        child: Scaffold(
          body: BlocListener<LoginCubit, LoginState>(
            listener: (context, state) {
              if (state is LoginSuccess) {
                Navigator.pushNamed(context, RouteManager.otp,
                    arguments: [state.phoneNumber, "login"]);
              } else if (state is LoginError) {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text(state.message),
                  backgroundColor: Colors.red,
                ));
                ToastWidget(text: state.message ?? '', type: ToastType.error);
              }
            },
            child: SingleChildScrollView(
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
                      Padding(
                        padding: const EdgeInsets.only(right: 16, top: 30),
                        child: CustomTextLink(
                          alignment: Alignment.topRight,
                          textAlign: TextAlign.right,
                          onClick: () {},
                          text: 'تخطي التسجيل',
                          textColor: ColorName.whiteLinkColor,
                          isMultiline: false,
                          fontSize: 18,
                        ),
                      ),
                      CustomContainer(
                          bgColor: ColorName.whiteColor,
                          margin: const EdgeInsets.only(top: 50),
                          padding: const EdgeInsets.all(16),
                          allBorder: true,
                          height: 120,
                          width: 250,
                          circularRadius: const Radius.circular(30),
                          child: Assets.images.logo1.image(
                            width: 100,
                            height: 100,
                          )),
                      const SizedBox(height: 50),
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
                              const Text(
                                'تسجيل الدخول',
                                style: TextStyle(
                                    fontSize: 24, fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(height: 10),
                              const Text(
                                'سجل دخولك عشان نكمل',
                                style: TextStyle(
                                    fontSize: 16, color: ColorName.greyColor),
                              ),
                              const SizedBox(height: 20),
                              CustomTextField(
                                errorText: _phoneNumberInput.error?.name ?? '',
                                // Show error message if input is invalid
                                type: TextInputType.phone,
                                controller: _phoneController,
                                label: 'رقم جوالك',
                                alignment: Alignment.topRight,
                                fontSize: 15,
                                textAlign: TextAlign.right,
                                fieldLabel: '+966*****',
                                onValueChanged: (value) {
                                  _phoneNumberInput = PhoneNumberInput.dirty(
                                      value); // Update input state
                                },
                              ),
                              const SizedBox(height: 20),
                              CustomButton(
                                  onClick: () {
                                    if (_phoneNumberInput.isValid) {
                                      // Do something with the valid phone number
                                      _loginCubit.login(_phoneController.text);
                                      // Navigator.pushNamed(context, RouteManager.otp,
                                      //     arguments: _phoneController.text);
                                    } else {
                                      // Handle invalid input
                                      print('Invalid phone number');
                                    }
                                  },
                                  textColor: ColorName.whiteColor,
                                  title: 'تأكيد',
                                  bgColor: ColorName.blackColor),
                              const SizedBox(height: 20),
                              CustomTextLink(
                                  onClick: () {
                                    Navigator.pushNamed(
                                        context, RouteManager.register);
                                  },
                                  text: 'سجل معانا',
                                  fontSize: 20,
                                  textColor: ColorName.greyLinkColor)
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),

          // This trailing comma makes auto-formatting nicer for build methods.
        ));
  }
}
