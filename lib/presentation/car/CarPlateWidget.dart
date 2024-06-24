import 'package:car_doctor/data/model/orders/CustomerOrder.dart';
import 'package:car_doctor/gen/colors.gen.dart';
import 'package:car_doctor/presentation/widgets/CustomButton.dart';
import 'package:flutter/material.dart';

import '../../gen/assets.gen.dart';

class CarPlateWidget extends StatefulWidget {
  final Function(String, String)? onPlateDataEntered;

  const CarPlateWidget({
    Key? key,
    this.onPlateDataEntered,
  }) : super(key: key);

  @override
  State<CarPlateWidget> createState() => _CarPlateWidgetState();
}

class _CarPlateWidgetState extends State<CarPlateWidget> {
  final GlobalKey<FormState> key = GlobalKey();
  late TextEditingController _numberController;
  late TextEditingController _codeController;

  @override
  void initState() {
    super.initState();
    _codeController = TextEditingController();
    _numberController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    _numberController.dispose();
    _codeController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Form(
          key: key,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                flex: 1,
                child: CustomButton(
                    onClick: () {
                      if (key.currentState!.validate()) {
                        widget.onPlateDataEntered?.call(
                            _numberController.text, _codeController.text);

                        print(
                            'CarPlateWidget: ${_numberController.text} ${_codeController.text}');
                      }
                    },
                    textColor: ColorName.whiteColor,
                    title: 'تأكيد رقم اللوحة',
                    fontSize: 10,
                    bgColor: ColorName.blueColor),
              ),
              const SizedBox(width: 10),
              Expanded(
                flex: 4,
                child: Container(
                  width: double.infinity,
                  height: 80,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(Assets
                              .images.saudiArabiaLicensePlateTemporary.path),
                          fit: BoxFit.fill)),
                  child: Row(children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15.0),
                        child: TextFormField(
                          keyboardType: TextInputType.number,
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                          ),
                          controller: _numberController,
                          validator: (value) =>
                              value!.isEmpty ? 'Please enter a number' : null,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15.0),
                        child: TextFormField(
                          keyboardType: TextInputType.text,
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                          ),
                          controller: _codeController,
                          validator: (value) =>
                              value!.isEmpty ? 'Please enter a code' : null,
                        ),
                      ),
                    ),
                  ]),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
