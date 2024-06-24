import 'package:flutter/material.dart';

import '../../gen/assets.gen.dart';
import '../widgets/CustomButton.dart';

class ViewCarPlateWidget extends StatefulWidget {
  String number;
  String code;

  ViewCarPlateWidget(
    this.number,
    this.code, {
    Key? key,
  }) : super(key: key);

  @override
  State<ViewCarPlateWidget> createState() => _ViewCarPlateWidgetState();
}

class _ViewCarPlateWidgetState extends State<ViewCarPlateWidget> {
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
    _codeController.text = widget.code;
    _numberController.text = widget.number;
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Form(
          key: key,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
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
                        child: TextFormField(enabled: false,
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
                        child: TextFormField(enabled: false,
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
