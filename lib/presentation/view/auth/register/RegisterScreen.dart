import 'package:car_doctor/data/model/UserData.dart';
import 'package:car_doctor/presentation/widgets/CustomContainer.dart';
import 'package:car_doctor/presentation/widgets/CustomTextLink.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../di/AppModule.dart';
import '../../../../gen/assets.gen.dart';
import '../../../../gen/colors.gen.dart';
import '../../../../utils/ToastType.dart';
import '../../../../validation/PhoneNumberValidation.dart';
import '../../../my_account/ClientInfoCubit.dart';
import '../../../resources/ColorManager.dart';
import '../../../resources/RouteManager.dart';
import '../../../widgets/CustomButton.dart';
import '../../../widgets/CustomTextField.dart';
import '../../../widgets/ToastWidget.dart';
import '../login/LoginCubit.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  late TextEditingController nameController;
  late TextEditingController idController;
  late TextEditingController phoneController;
  late TextEditingController emailController;
  late TextEditingController addressController;
  late PhoneNumberInput _phoneNumberInput;
  late LoginCubit _loginCubit;
  late ClientInfoCubit _clientInfoCubit;

  @override
  void initState() {
    super.initState();
    _loginCubit = getIt<LoginCubit>();
    _clientInfoCubit = getIt<ClientInfoCubit>();
    _phoneNumberInput = const PhoneNumberInput.pure();
    nameController = TextEditingController();
    idController = TextEditingController();
    phoneController = TextEditingController();
    emailController = TextEditingController();
    addressController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider<LoginCubit>(create: (_) => _loginCubit),
          BlocProvider(create: (_) => _clientInfoCubit)
        ],
        child: Scaffold(
            body: BlocListener<LoginCubit, LoginState>(
                listener: (context, state) {
                  if (state is LoginSuccess) {
                    var userData=    UserData(
                            email: emailController.text,
                            phone: phoneController.text,
                            userId: idController.text,
                            address: addressController.text,
                            displayName:
                            nameController.text,
                            username: '',
                            password: '');
                    Navigator.pushNamed(context, RouteManager.otp,
                        arguments: [state.phoneNumber, "register", userData]);
                  } else if (state is LoginError) {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text(state.message),
                      backgroundColor: Colors.red,
                    ));
                    ToastWidget(
                        text: state.message ?? '', type: ToastType.error);
                  }
                },
                child: Container(
                    width: double.infinity,
                    height: double.infinity,
                    decoration: const BoxDecoration(
                        gradient: LinearGradient(
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight,
                            colors: ColorsManager.bg_gradient)),
                    child: CustomContainer(
                        bgColor: ColorName.whiteColor,
                        margin: const EdgeInsets.only(top: 50),
                        padding: const EdgeInsets.all(16),
                        allBorder: false,
                        height: 120,
                        width: 250,
                        circularRadius: const Radius.circular(50),
                        child: SingleChildScrollView(
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                const Text('تسجيل حساب جديد',
                                    style: TextStyle(
                                        fontSize: 30,
                                        fontWeight: FontWeight.bold)),
                                CustomTextLink(
                                  text: 'هل لديك حساب بالفعل؟ تسجيل دخول',
                                  textColor: ColorName.blueColor,
                                ),
                                CustomTextField(
                                  alignment: Alignment.centerRight,
                                  checkValidation: (value) => value!.isEmpty
                                      ? 'يرجى كتابة الاسم'
                                      : null,
                                  textAlign: TextAlign.right,
                                  label: 'الاسم',
                                  type: TextInputType.text,
                                  fontSize: 15,
                                  controller: nameController,
                                ),
                                CustomTextField(
                                  alignment: Alignment.centerRight,
                                  checkValidation: (value) => value!.isEmpty
                                      ? 'يرجى كتابة الاسم'
                                      : null,
                                  textAlign: TextAlign.right,
                                  type: TextInputType.phone,
                                  fontSize: 15,
                                  controller: phoneController,
                                  label: 'رقم الجوال',
                                  onValueChanged: (value) {
                                    _phoneNumberInput =
                                        PhoneNumberInput.dirty(value);
                                  },
                                ),
                                CustomTextField(
                                  enabled: true,
                                  alignment: Alignment.centerRight,
                                  checkValidation: (value) => value!.isEmpty
                                      ? 'يرجى كتابة رقم الهوية'
                                      : null,
                                  textAlign: TextAlign.right,
                                  type: TextInputType.number,
                                  fontSize: 15,
                                  controller: idController,
                                  label: 'رقم الهوية',
                                ),
                                CustomTextField(
                                  enabled: true,
                                  alignment: Alignment.centerRight,
                                  checkValidation: (value) => value!.isEmpty
                                      ? 'يرجى كتابة الايميل'
                                      : null,
                                  textAlign: TextAlign.right,
                                  type: TextInputType.emailAddress,
                                  fontSize: 15,
                                  controller: emailController,
                                  label: 'الايميل',
                                ),
                                CustomTextField(
                                  alignment: Alignment.centerRight,
                                  checkValidation: (value) => value!.isEmpty
                                      ? 'يرجى كتابة العنوان'
                                      : null,
                                  textAlign: TextAlign.right,
                                  type: TextInputType.text,
                                  fontSize: 15,
                                  controller: addressController,
                                  label: 'العنوان',
                                ),
                                CustomButton(
                                    onClick: () {
                                      if (_phoneNumberInput.isValid) {
                                        // Do something with the valid phone number
                                        _loginCubit.login(phoneController.text);
                                      } else {
                                        // Handle invalid input
                                        print('Invalid phone number');
                                      }
                                    },
                                    textColor: ColorName.whiteColor,
                                    title: 'تسجيل',
                                    bgColor: ColorName.blackColor),
                              ]),
                        ))))));
  }
}
