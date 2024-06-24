import 'dart:async';


import 'package:car_doctor/gen/colors.gen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../../di/AppModule.dart';
import '../../../gen/assets.gen.dart';
import '../../resources/ColorManager.dart';
import '../../resources/RouteManager.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}


class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
    final FirebaseAuth _auth = getIt<FirebaseAuth>();
    Timer(const Duration(seconds: 7), () {
      if (_auth.currentUser != null) {
        Navigator.pushNamed(context, RouteManager.home);
      } else {
        Navigator.pushNamed(context, RouteManager.login);
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor:Colors.blue,
        body: Center(
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
                  Container(
                    decoration: BoxDecoration(
                      // color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      image: DecorationImage(
                        image: AssetImage(Assets.images.road.path),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: Assets.animations.cr.lottie(
                      height: 150,
                      width: 150,
                    ),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  const Text(
                    'CAR DOCTOR',
                    style: TextStyle(
                        color: ColorName.whiteColor,
                        fontSize: 35,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
