import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../di/AppModule.dart';
import '../../gen/assets.gen.dart';
import '../../gen/colors.gen.dart';
import '../resources/ColorManager.dart';
import '../resources/RouteManager.dart';
import '../widgets/CustomButton.dart';
import '../widgets/CustomContainer.dart';
import '../widgets/CustomMyCarListItem.dart';
import 'MyCarCubit.dart';
import 'MyCarState.dart';

class MyCarScreen extends StatefulWidget {
  const MyCarScreen({super.key});

  @override
  State<MyCarScreen> createState() => _MyCarScreenState();
}

class _MyCarScreenState extends State<MyCarScreen> {
  late MyCarCubit myCarCubit;

  @override
  void initState() {
    super.initState();
    myCarCubit = getIt<MyCarCubit>();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_) => myCarCubit..loadCars(),
        child: BlocListener<MyCarCubit, MyCarState>(
            listener: (context, state) {
              if (state is MyCarAdded) {
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                  content: Text('Car added successfully'),
                  backgroundColor: Colors.green,
                ));
              } else if (state is MyCarDeleted) {
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                  content: Text('Car deleted successfully'),
                  backgroundColor: Colors.green,
                ));
              } else if (state is MyCarEdited) {
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                  content: Text('Car data edited successfully'),
                  backgroundColor: Colors.green,
                ));
              }
            },
            child: WillPopScope(
              onWillPop: () async {
                print('WillPopScope called');
                // Get the WorkshopOrderCubit instance
                // Call the method to reload the orders
               myCarCubit.loadCars();
                return true; // Allow the screen to be popped
              },
              child: Scaffold(
                body: Container(
                  decoration: const BoxDecoration(
                      gradient: LinearGradient(
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                    colors: ColorsManager.bg_gradient,
                  )),
                  padding: const EdgeInsets.only(top: 60),
                  child: CustomContainer(
                    margin: const EdgeInsets.all(10),
                    padding: const EdgeInsets.all(10),
                    bgColor: ColorName.whiteColor,
                    allBorder: true,
                    circularRadius: const Radius.circular(50),
                    child: SingleChildScrollView(
                      child: Column(children: [
                        const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            "سيارتي",
                            style: TextStyle(
                                color: ColorName.blackColor,
                                fontSize: 30,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        const Divider(
                          color: ColorName.lightGreyColor,
                          thickness: 3,
                          indent: 10,
                          endIndent: 8,
                        ),
                        CustomButton(
                          onClick: () =>
                              Navigator.pushNamed(context, RouteManager.addCar),
                          textColor: ColorName.whiteColor,
                          bgColor: ColorName.blueColor,
                          title: "إضافة سيارة جديدة   +",
                        ),
                        BlocBuilder<MyCarCubit, MyCarState>(
                            builder: (context, state) {
                          if (state is MyCarLoading) {
                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                          } else if (state is MyCarError) {
                            return Center(
                              child: Text(state.message),
                            );
                          } else if (state is MyCarLoaded) {
                            return ListView.builder(
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                itemCount: state.cars.length,
                                itemBuilder: (context, index) =>
                                    CustomMyCarListItem(state.cars[index]));
                          } else if (state is MyCarInitial) {
                            return Column(children: [
                              Assets.images.car.image(height: 370, width: 370),
                              const Text(
                                "لا يوجد سيارة مضافة ",
                                style: TextStyle(
                                    color: ColorName.blueColor,
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold),
                              ),
                            ]);
                          } else {
                            return Container();
                          }
                        })
                      ]),
                    ),
                  ),
                ),
              ),
            )));
  }
}
