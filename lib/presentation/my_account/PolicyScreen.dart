import 'package:car_doctor/presentation/view/representative/RequestScreen.dart';
import 'package:flutter/material.dart';

import '../../gen/colors.gen.dart';
import '../resources/ColorManager.dart';
import '../widgets/CustomContainer.dart';

class PolicyScreen extends StatefulWidget {
  const PolicyScreen({super.key});

  @override
  State<PolicyScreen> createState() => _PolicyState();
}

class _PolicyState extends State<PolicyScreen> {
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
                  const SizedBox(height: 40),
                  CustomContainer(
                    height: MediaQuery.of(context).size.height - 150,
                    bgColor: ColorName.whiteColor,
                    allBorder: false,
                    circularRadius: Radius.circular(60),
                    padding: EdgeInsets.all(16),
                    child: Form(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Row(
                            children: [
                              IconButton(
                                icon: Icon(Icons.arrow_back),
                                onPressed: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) => RequestScreen()));
                                },
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              Icon(
                                Icons.local_police_rounded,
                                size: 30,
                                color: ColorName.errorColor,
                              ),
                              Text(
                                'الشروط وسياسة الخصوصية',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          const Divider(
                            color: ColorName.errorColor,
                          ),
                          SizedBox(
                            height: 50,
                          ),
                          CustomContainer(
                            bgColor: ColorName.bgTextField,
                            margin: const EdgeInsets.only(top: 50),
                            padding: const EdgeInsets.all(1),
                            allBorder: true,
                            height: 150,
                            width: 380,
                            circularRadius: const Radius.circular(30),
                            child: const SingleChildScrollView(
                              child: Column(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(
                                        bottom: 10, top: 20, left: 240),
                                    child: Text(
                                      'الشروط',
                                      style: TextStyle(
                                          fontSize: 17,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  Text(''),
                                ],
                              ),
                            ),
                          ),
                          CustomContainer(
                            bgColor: ColorName.bgTextField,
                            margin: const EdgeInsets.only(top: 70),
                            padding: const EdgeInsets.all(1),
                            allBorder: true,
                            height: 150,
                            width: 380,
                            circularRadius: const Radius.circular(30),
                            child: const SingleChildScrollView(
                              child: Column(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(
                                        bottom: 10, top: 20, left: 200),
                                    child: Text(
                                      'سياسة الخصوصية',
                                      style: TextStyle(
                                          fontSize: 17,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  Expanded(
                                      child: Text('',
                                          maxLines: 4,
                                          overflow: TextOverflow.ellipsis,
                                          textDirection: TextDirection.rtl,
                                          textAlign: TextAlign.justify)),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        bottomNavigationBar: Stack(children: [
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color(0xff6e6e70),
                  Color(0xffa3a3a8),
                  Color(0xff9999e8),
                  Color(0xff222280),
                ],
              ),
            ),
            height: 80,
          ),
          NavigationBar(
            backgroundColor: Colors.transparent,
            destinations: const [
              NavigationDestination(
                  icon: Icon(Icons.add_box_outlined), label: "طلباتي"),
              NavigationDestination(
                  icon: Icon(Icons.car_crash), label: "سيارتي"),
              NavigationDestination(icon: Icon(Icons.home), label: "الرئيسية"),
              NavigationDestination(icon: Icon(Icons.percent), label: "عروض"),
              NavigationDestination(icon: Icon(Icons.person), label: "حسابي"),
            ],
          ),
        ])
        // This trailing comma makes auto-formatting nicer for build methods.
        );
  }
}
