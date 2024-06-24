import 'package:car_doctor/data/model/car/CarData.dart';
import 'package:car_doctor/presentation/car/CarTypesCubit.dart';
import 'package:car_doctor/presentation/car/CarsTypesState.dart';
import 'package:car_doctor/presentation/resources/ColorManager.dart';
import 'package:car_doctor/presentation/widgets/CustomDropDownWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/model/car/Car.dart';
import '../../data/model/car/PlateNumber.dart';
import '../../data/model/car/ProducTypeEnum.dart';
import '../../di/AppModule.dart';
import '../../gen/assets.gen.dart';
import '../../gen/colors.gen.dart';
import '../../utils/TenYearsBefore.dart';
import '../widgets/CustomButton.dart';
import '../widgets/CustomContainer.dart';
import '../widgets/CustomTextField.dart';
import '../widgets/ToastWidget.dart';
import 'CarPlateWidget.dart';
import 'MyCarCubit.dart';
import 'MyCarState.dart';
import 'ViewCarPlateWidget.dart';

class EditCarScreen extends StatefulWidget {
  const EditCarScreen({super.key});

  @override
  State<EditCarScreen> createState() => _EditCarScreenState();
}

class _EditCarScreenState extends State<EditCarScreen> {
  late MyCarCubit myCarCubit;
  late CarsTypesCubit carsTypesCubit;

  late TextEditingController _carColorController;

  String _carCode = '';
  String _carNumber = '';

  @override
  void initState() {
    super.initState();
    myCarCubit = getIt<MyCarCubit>();
    carsTypesCubit = getIt<CarsTypesCubit>();
    _carColorController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();

    _carColorController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Car car = ModalRoute.of(context)?.settings.arguments as Car;
    _carColorController.text = car.carColor;
    return MultiBlocProvider(
        providers: [
          BlocProvider<CarsTypesCubit>(
              create: (_) => carsTypesCubit..fetchCars()),
          BlocProvider<MyCarCubit>(create: (_) => myCarCubit),
        ],
        child: Scaffold(
            body: Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: ColorsManager.bg_gradient,
                  ),
                ),
                child: CustomContainer(
                    margin: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 10),
                    bgColor: ColorName.whiteColor,
                    allBorder: true,
                    padding: const EdgeInsets.only(
                        bottom: 25, top: 16, right: 16, left: 16),
                    circularRadius: const Radius.circular(60),
                    child: SingleChildScrollView(
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              IconButton(
                                onPressed: () => Navigator.pop(context),
                                icon: const Icon(Icons.arrow_forward),
                                color: ColorName.blackColor,
                                padding:
                                    const EdgeInsets.only(left: 250, top: 40),
                              ),
                            ],
                          ),
                          const Text(
                            "تعديل سيارة جديدة",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: ColorName.blackColor,
                              fontSize: 30,
                              height: 0.2,
                            ),
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          const Align(
                            alignment: Alignment.center,
                            child: Divider(
                              color: ColorName.lightGreyColor,
                              thickness: 2,
                              indent: 2,
                              endIndent: 8,
                              height: 1,
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          BlocBuilder<CarsTypesCubit, CarsTypesState>(
                              builder: (context, state) {
                            List<CarData> carsData = [];
                            List<String> uniqueMakes = [];
                            List<String> models = [];

                            if (state is CarsTypesLoaded) {
                              carsData = state.carsTypes;
                              uniqueMakes = carsData
                                  .map((carData) => carData.type!)
                                  .toSet()
                                  .toList();
                            }

                            return Column(
                              children: [
                                CustomDropDownWidget<String>(
                                  alignment: Alignment.topRight,
                                  value: car.carType,
                                  label: 'نوع السيارة',
                                  fontSize: 16,
                                  items: uniqueMakes,
                                  onItemSelected: (value) {
                                    // print('selected value: $value');
                                    models = carsData
                                        .where(
                                            (carData) => carData.type == value)
                                        .map((carData) => carData.model!)
                                        .toList();
                                    models = ['A', 'B', 'C', 'D', 'E'];
                                    carsTypesCubit.selectedCarType = value;
                                    print(carsTypesCubit.selectedCarType);
                                    print(models);
                                  },
                                ),
                                CustomDropDownWidget<String>(
                                  alignment: Alignment.topRight,
                                  value: models.isNotEmpty
                                      ? models.first
                                      : 'select car model',
                                  label: 'موديل السيارة',
                                  fontSize: 16,
                                  items: models,
                                  onItemSelected: (value) {
                                    // carsTypesCubit.selectCarModel(value);
                                  },
                                ),
                              ],
                            );
                          }),
                          const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 8),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text(
                                  "رقم اللوحة ",
                                  textAlign: TextAlign.right,
                                  style: TextStyle(fontSize: 16),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 8.0, horizontal: 30),
                              child: ViewCarPlateWidget(
                                  car.plateNumber!.plateNumber!,
                                  car.plateNumber!.plateCode!)),
                          CustomDropDownWidget(
                            value: car.carYear,
                            alignment: Alignment.topRight,
                            label: 'سنة الاصدار',
                            fontSize: 16,
                            items: TenYearsBefore()
                                .generateYears(DateTime.now().year - 20),
                            onItemSelected: (value) {
                              carsTypesCubit.selectCarYear(value);
                            },
                          ),
                          CustomTextField(
                            controller: _carColorController,
                            checkValidation: (value) =>
                                value!.isEmpty ? 'يرجى كتابة لون' : null,
                            label: 'لون السيارة',
                            type: TextInputType.multiline,
                            alignment: Alignment.topRight,
                            fontSize: 16,
                            textAlign: TextAlign.right,
                          ),
                          const Align(
                            alignment: Alignment.topRight,
                            child: Text(
                              " نوع الوقود",
                              textAlign: TextAlign.right,
                              style: TextStyle(fontSize: 16),
                            ),
                          ),
                          BlocBuilder<MyCarCubit, MyCarState>(
                            builder: (context, state) {
                              ProductTypeEnum? groupValue =
                                  convertStringToEnum(car.carFuel);
                              print(groupValue);
                              return Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Expanded(
                                    child: RadioListTile<ProductTypeEnum>(
                                      contentPadding: EdgeInsets.all(0.0),
                                      value: ProductTypeEnum.DIESEL,
                                      groupValue: groupValue,
                                      title: const Text('ديزل'),
                                      onChanged: (val) {
                                        myCarCubit.selectProductType(val!);
                                      },
                                    ),
                                  ),
                                  Expanded(
                                    child: RadioListTile<ProductTypeEnum>(
                                      contentPadding: const EdgeInsets.all(0.0),
                                      value: ProductTypeEnum.GASOLINE,
                                      groupValue: groupValue,
                                      title: const Text('بنزين'),
                                      onChanged: (val) {
                                        myCarCubit.selectProductType(val!);
                                      },
                                    ),
                                  ),
                                ],
                              );
                            },
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          CustomButton(
                            onClick: () {
                              myCarCubit.editCar(Car(
                                  carColor: _carColorController.value.text,
                                  carType: carsTypesCubit.selectedCarType!,
                                  carModel: carsTypesCubit.selectedCarModel!,
                                  plateNumber: PlateNumber(
                                      plateCode: car.plateNumber?.plateCode,
                                      plateNumber: car.plateNumber?.plateNumber,),
                                  carYear: carsTypesCubit.selectedYear,
                                  carFuel: myCarCubit.selectedType!.name));
                            },
                            textColor: ColorName.whiteColor,
                            title: 'تأكيد الطلب',
                            bgColor: ColorName.blueColor,
                          ),
                          // BlocListener<MyCarCubit, MyCarState>(
                          //     listener: (context, state) {
                          //   if (state is MyCarAdded) {
                          //     ScaffoldMessenger.of(context)
                          //         .showSnackBar(const SnackBar(
                          //       content: Text('تم اضافة السيارة بنجاح'),
                          //       backgroundColor: Colors.green,
                          //     ));
                          //   } else if (state is MyCarError) {
                          //     ScaffoldMessenger.of(context)
                          //         .showSnackBar(const SnackBar(
                          //       content: Text('حدث خطأ ما'),
                          //       backgroundColor: Colors.red,
                          //     ));
                          //   } else if (state is MyCarLoading) {
                          //     const Center(child: CircularProgressIndicator());
                          //   } else {
                          //     Container();
                          //   }
                          // }),
                        ]))))));
  }

  ProductTypeEnum? convertStringToEnum(String? fuelType) {
    switch (fuelType) {
      case 'DIESEL':
        return ProductTypeEnum.DIESEL;
      case 'GASOLINE':
        return ProductTypeEnum.GASOLINE;
      default:
        return null;
    }
  }
}
