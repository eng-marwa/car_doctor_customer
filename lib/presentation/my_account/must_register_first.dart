import 'package:car_doctor/presentation/resources/ColorManager.dart';
import 'package:flutter/material.dart';

import '../../gen/colors.gen.dart';
import '../widgets/CustomTextLink.dart';




class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
 

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(

        body: Container(




            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: ColorsManager.bg_gradient,


              ),

            ),
            child:Container(
                child: Column(
                    children: [

                      Row(
                        children: [
                          Container(
                            child: IconButton(onPressed: (){}, icon: Icon(Icons.arrow_forward),color: ColorName.whiteColor,padding: EdgeInsets.only(left: 300,top:50),),
                          ),
                        ],
                      ),



                      Container(
                          height: 600,   width: 385,
                          margin:const EdgeInsets.symmetric(vertical: 70),
                          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 100),

                          decoration: BoxDecoration(

                            color: ColorName.whiteColor,
                            borderRadius: BorderRadius.all(Radius.circular(120)),
                          ),
                          child: Column(
                              children: [









                                const Text(
                                  ' عذراً !                        يجب التسجيل اولاً         لتتمكن من انشاء         طلب  ',
                                  style: TextStyle(

                                      fontSize: 40, color: ColorName.greyColor),
                                  textAlign: TextAlign.center,
                                ),
                                const SizedBox(height: 60),
                                CustomTextLink(
                                    onClick: () {},
                                    text: ' انقر هنا للعودة الى صفحة تسجيل الدخول',
                                    textAlign: TextAlign.center,
                                    fontSize: 20,
                                    textColor: ColorName.blueColor)
                              ])
                      ),

                    ])
            )
        )


    );




  }
}