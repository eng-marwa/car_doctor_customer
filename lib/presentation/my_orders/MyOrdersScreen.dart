import 'package:car_doctor/gen/colors.gen.dart';
import 'package:car_doctor/presentation/my_orders/MyOrderList.dart';
import 'package:car_doctor/presentation/my_orders/RecentOrderCubit.dart';
import 'package:car_doctor/presentation/resources/ColorManager.dart';
import 'package:car_doctor/presentation/widgets/CustomMyOrderListItem.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../di/AppModule.dart';
import '../widgets/CustomContainer.dart';
import 'MyOrderStatus.dart';
import 'MyOrderCubit.dart';

class MyOrdersScreen extends StatefulWidget {
  const MyOrdersScreen({super.key});

  @override
  State<MyOrdersScreen> createState() => _MyOrdersScreenState();
}

class _MyOrdersScreenState extends State<MyOrdersScreen> {
  late MyOrderCubit myOrderCubit;
  late RecentOrderCubit recentOrderCubit;

  @override
  void initState() {
    super.initState();
    myOrderCubit = getIt<MyOrderCubit>();
    myOrderCubit.loadRecentOrders();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => myOrderCubit,
        child: BlocBuilder<MyOrderCubit, MyOrderState>(
            builder: (context, state) => Scaffold(
                body: Container(
                    alignment: Alignment.centerRight,
                    decoration: const BoxDecoration(
                        gradient: LinearGradient(
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight,
                            colors: ColorsManager.bg_gradient)),
                    child: CustomContainer(
                        constraints: const BoxConstraints.expand(),
                        margin: const EdgeInsets.all(10),
                        padding: const EdgeInsets.all(10),
                        bgColor: ColorName.whiteColor,
                        allBorder: true,
                        circularRadius: const Radius.circular(50),
                        child: SingleChildScrollView(
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                const SizedBox(height: 20),
                                const Padding(
                                  padding: EdgeInsets.only(bottom: 20.0),
                                  child: Text(
                                    'طلباتي ',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: ColorName.blueColor,
                                      fontSize: 30,
                                      fontWeight: FontWeight.bold,
                                      height: 0.2,
                                    ),
                                  ),
                                ),
                                const Divider(
                                  color: ColorName.lightGreyColor,
                                  thickness: 3,
                                  indent: 10,
                                  endIndent: 8,
                                ),
                                const SizedBox(height: 15),
                                CustomContainer(
                                    circularRadius: Radius.circular(30),
                                    alignment: Alignment.center,
                                    width: MediaQuery.of(context).size.width,
                                    height: 60,
                                    bgColor: ColorName.lightGreyColor,
                                    allBorder: true,
                                    child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.stretch,
                                        children: <Widget>[
                                          TextButton(
                                            onPressed: () {
                                              myOrderCubit.toggleOrderType(
                                                  OrdersStatus.previous);
                                              myOrderCubit.loadRecentOrders();

                                            },
                                            style: ElevatedButton.styleFrom(
                                                backgroundColor: myOrderCubit
                                                        .isPressed
                                                    ? ColorName.lightGreyColor
                                                    : ColorName.blueColor,
                                                fixedSize: Size(188, 10)),
                                            child: Text('طلباتي الحالية',
                                                style: TextStyle(
                                                    color: myOrderCubit
                                                            .isPressed
                                                        ? ColorName.blackColor
                                                        : ColorName.whiteColor,
                                                    fontSize: 15)),
                                          ),
                                          TextButton(
                                            onPressed: () {
                                              myOrderCubit.toggleOrderType(
                                                  OrdersStatus.current);
                                              myOrderCubit.loadPreviousOrders();

                                            },
                                            style: ElevatedButton.styleFrom(
                                                backgroundColor: myOrderCubit
                                                        .isPressed
                                                    ? ColorName.blueColor
                                                    : ColorName.lightGreyColor,
                                                fixedSize: Size(178, 10)),
                                            child: Text(
                                              'طلباتي السابقة',
                                              style: TextStyle(
                                                  color: myOrderCubit.isPressed
                                                      ? ColorName.whiteColor
                                                      : ColorName.blackColor,
                                                  fontSize: 15),
                                            ),
                                          ),
                                        ])),
                                MyOrderList()
                              ]),
                        ))))));
  }
}
