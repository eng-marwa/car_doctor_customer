import 'package:car_doctor/presentation/resources/ColorManager.dart';
import 'package:car_doctor/presentation/resources/ImageManager.dart';
import 'package:car_doctor/presentation/widgets/CustomButton.dart';
import 'package:car_doctor/presentation/widgets/CustomContainer.dart';
import 'package:car_doctor/presentation/widgets/CustomTextField.dart';
import 'package:car_doctor/presentation/widgets/CustomTextLink.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  final TextEditingController _phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                Padding(
                  padding: const EdgeInsets.only(right: 16, top: 30),
                  child: CustomTextLink(
                    alignment: Alignment.topRight,
                    textAlign: TextAlign.right,
                    onClick: () {},
                    text: 'تخطي التسجيل',
                    textColor: ColorsManager.whiteLinkColor,
                    isMultiline: false,
                    fontSize: 18,
                  ),
                ),
                CustomContainer(
                  bgColor: ColorsManager.whiteColor,
                  margin: const EdgeInsets.only(top: 50),
                  padding: const EdgeInsets.all(16),
                  allBorder: true,
                  height: 120,
                  width: 250,
                  circularRadius: const Radius.circular(30),
                  child: Image.asset(
                    ImagesManager.logo1,
                    height: 100,
                    width: 150,
                  ),
                ),
                const SizedBox(height: 50),
                CustomContainer(
                  height: MediaQuery
                      .of(context)
                      .size
                      .height - 150,
                  bgColor: ColorsManager.whiteColor,
                  allBorder: false,
                  circularRadius: Radius.circular(60),
                  padding: EdgeInsets.all(16),
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
                              fontSize: 16, color: ColorsManager.greyColor),
                        ),
                        const SizedBox(height: 20),
                        CustomTextField(controller:_phoneController, checkValidation: (value) =>
                        value!.isEmpty ? 'لابد من ادخال رقم الجوال' : null,
                          label: 'رقم جوالك',
                          alignment: Alignment.topRight,
                          fontSize: 15,
                          textAlign: TextAlign.right,
                          fieldLabel: '+966*****',),
                        SizedBox(height: 20),
                        CustomButton(
                            onClick: () {},
                            textColor: ColorsManager.whiteColor,
                            title: 'تأكيد',
                            bgColor: ColorsManager.blackColor),
                        const SizedBox(height: 20),
                        CustomTextLink(
                            onClick: () {},
                            text: 'سجل معانا',
                            fontSize: 20,
                            textColor: ColorsManager.greyLinkColor)
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
    );
  }
}
