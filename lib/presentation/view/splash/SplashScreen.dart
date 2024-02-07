import 'dart:async';

import 'package:car_doctor/presentation/resources/ColorManager.dart';
import 'package:car_doctor/presentation/resources/ImageManager.dart';
import 'package:car_doctor/presentation/resources/RouteManager.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 7),
        () => Navigator.pushNamed(context, RouteManager.login));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                    decoration: const BoxDecoration(
                      // color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      image: DecorationImage(
                        image: AssetImage(ImagesManager.road),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: Lottie.asset(ImagesManager.car),
                  ),
              SizedBox(height: 20,),
              Text('كار دكتور', style: TextStyle(color: ColorsManager.bluedColor,fontSize: 30, fontWeight: FontWeight.bold),),

            ],
          ),
        ));
  }
}
