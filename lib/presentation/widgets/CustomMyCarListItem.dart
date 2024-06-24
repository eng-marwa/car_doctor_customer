import 'package:car_doctor/data/model/car/Car.dart';
import 'package:car_doctor/di/AppModule.dart';
import 'package:car_doctor/presentation/car/MyCarState.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../gen/colors.gen.dart';
import '../car/MyCarCubit.dart';
import '../resources/RouteManager.dart';
import 'CustomContainer.dart';
import 'MyCarPopup.dart';

class CustomMyCarListItem extends StatelessWidget {
  final Car car;

  CustomMyCarListItem(this.car, {super.key});

  final _myCarCubit = getIt<MyCarCubit>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => _myCarCubit,
      child: BlocListener<MyCarCubit, MyCarState>(
        listener: (context, state) {
          if (state is MyCarDeleted) {
            print('mmmm ');
            // _myCarCubit.loadCars();
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
              content: Text('Car deleted successfully'),
              backgroundColor: Colors.green,
            ));
          }
        },
        child: Row(children: [
          CustomContainer(
              bgColor: ColorName.blueColor,
              allBorder: false,
              circularRadius: const Radius.circular(30),
              margin: const EdgeInsets.all(10),
              width: MediaQuery.of(context).size.width - 60,
              height: 110,
              alignment: Alignment.center,
              child: Column(children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    PopupMenuButton(
                      iconColor: ColorName.whiteColor,
                      itemBuilder: (ctx) => [
                        buildPopupMenuItem(
                            'تعديل بيانات السيارة',
                            Icons.edit,
                            () => Navigator.pushNamed(
                                context, RouteManager.editCar,
                                arguments: car)),
                        buildPopupMenuItem('حذف السيارة', Icons.delete,
                            () => _myCarCubit.deleteCar(car)),
                      ],
                    ),
                    Expanded(
                      child: Align(
                        alignment: Alignment.center,
                        child: Text(
                          '${car.carType} ${car.carModel} ${car.carYear}',
                          style: const TextStyle(
                            color: ColorName.whiteColor,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width - 80,
                      height: 40,
                      margin: const EdgeInsets.all(8),
                      alignment: Alignment.center,
                      decoration: const BoxDecoration(
                        shape: BoxShape.rectangle,
                        color: ColorName.lightGreyColor,
                      ),
                      child: Column(
                        children: [
                          IntrinsicHeight(
                            child: SizedBox(
                              height: 40,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text('${car.plateNumber?.plateNumber}'),
                                  const SizedBox(
                                    width: 50,
                                  ),
                                  const VerticalDivider(
                                    color: Colors.black,
                                    thickness: 3,
                                    endIndent: 1,
                                    // indent: 30,
                                  ),
                                  const SizedBox(
                                    width: 100,
                                  ),
                                  Text('${car.plateNumber?.plateCode}'),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ]))
        ]),
      ),
    );
  }
}
