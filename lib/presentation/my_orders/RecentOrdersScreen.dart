import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../di/AppModule.dart';
import '../../gen/colors.gen.dart';
import '../resources/ColorManager.dart';
import '../widgets/CustomContainer.dart';
import 'RecentOrderCubit.dart';
import 'RecentOrderList.dart';
import 'RecentOrderState.dart';

class RecentOrdersScreen extends StatefulWidget {
  const RecentOrdersScreen({super.key});

  @override
  State<RecentOrdersScreen> createState() => _RepRecentOrders();
}

class _RepRecentOrders extends State<RecentOrdersScreen> {
  final RecentOrderCubit recentOrderCubit = getIt<RecentOrderCubit>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<RecentOrderCubit>(
      create: (context) => recentOrderCubit..loadRecentOrders(),
      child: Scaffold(
        body: Container(
          alignment: Alignment.centerRight,
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: ColorsManager.bg_gradient)),
          child: CustomContainer(
            margin: EdgeInsets.all(10.r),
            padding: EdgeInsets.all(10.r),
            bgColor: ColorName.whiteColor,
            allBorder: true,
            circularRadius: Radius.circular(50.r),
            child: SingleChildScrollView(
              child: BlocBuilder<RecentOrderCubit, RecentOrderState>(
                  builder: (context, state) {
                return Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(height: 20.r),
                      Padding(
                        padding: EdgeInsets.only(bottom: 20.0.r),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Expanded(
                              child: Padding(
                                padding: EdgeInsets.only(left: 50.0.r),
                                child: Text(
                                  'الطلبات الحالية ',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: ColorName.blueColor,
                                    fontSize: 30.r,
                                    fontWeight: FontWeight.bold,
                                    height: 0.2.r,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 50.r,
                              child: IconButton(
                                onPressed: () => Navigator.pop(context),
                                icon: const Icon(Icons.arrow_forward),
                                color: ColorName.blackColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Divider(
                        color: ColorName.lightGreyColor,
                        thickness: 3.r,
                        indent: 10.r,
                        endIndent: 8.r,
                      ),
                      SizedBox(height: 15.r),
                      RecentOrderList(),
                    ]);
              }),
            ),
          ),
        ),
      ),
    );
  }
}
