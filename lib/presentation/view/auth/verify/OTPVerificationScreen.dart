import 'package:car_doctor/gen/colors.gen.dart';
import 'package:car_doctor/presentation/widgets/CustomButton.dart';
import 'package:car_doctor/presentation/widgets/CustomTextField.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../data/datasource/local/SharedPreferencesService.dart';
import '../../../../data/model/UserData.dart';
import '../../../../di/AppModule.dart';
import '../../../../domain/usecases/client/ViewClientData.dart';
import '../../../../utils/ToastType.dart';
import '../../../resources/RouteManager.dart';
import '../../../widgets/ToastWidget.dart';
import '../login/LoginCubit.dart';

class OTPVerification extends StatefulWidget {
  String phoneNumber;
  String screen;

  OTPVerification(this.phoneNumber, this.screen, {Key? key}) : super(key: key);

  @override
  State<OTPVerification> createState() => _PhoneOTPVerificationState();
}

class _PhoneOTPVerificationState extends State<OTPVerification> {
  final TextEditingController otp = TextEditingController();
  final _loginCubit = getIt<LoginCubit>();
  final sharedPreferences = getIt<SharedPreferences>();
  bool visible = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    otp.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    UserData? userData = ModalRoute.of(context)?.settings.arguments as UserData?;
    return BlocProvider<LoginCubit>(
        create: (_) => _loginCubit,
        child: Scaffold(
          appBar: AppBar(
            title: Text("Verify OTP "),
          ),
          body: BlocListener<LoginCubit, LoginState>(
            listener: (context, state) async {
              if (state is LoginVerified) {
                Navigator.pushNamed(context, RouteManager.home);
              } else if (state is LoginError) {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text(state.message),
                  backgroundColor: Colors.red,
                ));
                ToastWidget(text: state.message ?? '', type: ToastType.error);
              }
            },
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Enter the OTP sent to  ${widget.phoneNumber}',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  SizedBox(
                    width: 200,
                    child: CustomTextField(
                        // Show error message if input is invalid
                        type: TextInputType.number,
                        label: '',
                        controller: otp,
                        alignment: Alignment.topRight,
                        fontSize: 15,
                        textAlign: TextAlign.right,
                        fieldLabel: 'X X X X X X',
                        onValueChanged: (value) {
                          _loginCubit.verificationCode = value;
                        }),
                  ),
                  SizedBox(
                      width: 200,
                      child: CustomButton(
                          fontSize: 20,
                          textColor: ColorName.whiteColor,
                          title: 'Verify',
                          bgColor: ColorName.blueColor,
                          onClick: () => widget.screen == "register"
                              ? _loginCubit.sendCode(otp.text,userData)
                              : _loginCubit.sendLoginCode(otp.text)))
                ],
              ),
            ),
          ),
        ));
  }
}
