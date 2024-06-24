import 'package:car_doctor/data/model/Client.dart';
import 'package:car_doctor/data/model/Representative.dart';
import 'package:car_doctor/data/model/Workshop.dart';
import 'package:car_doctor/data/model/car/Car.dart';
import 'package:car_doctor/data/model/orders/CarService.dart';
import 'package:car_doctor/data/model/orders/OrderServiceStatus.dart';
import 'package:car_doctor/data/model/orders/CustomerOrder.dart';
import 'package:car_doctor/data/model/orders/OrderStatus.dart';
import 'package:car_doctor/data/model/orders/OrderType.dart';
import 'package:car_doctor/di/AppModule.dart';
import 'package:car_doctor/presentation/car/MyCarCubit.dart';
import 'package:car_doctor/presentation/car/MyCarState.dart';
import 'package:car_doctor/presentation/my_account/ClientInfoCubit.dart';
import 'package:car_doctor/presentation/my_orders/MyOrderCubit.dart';
import 'package:car_doctor/presentation/resources/RouteManager.dart';
import 'package:car_doctor/presentation/widgets/CustomDropDownWidget.dart';
import 'package:car_doctor/utils/DateTimeManager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:intl/intl.dart';

import '../../../gen/colors.gen.dart';
import '../../../utils/LocationPermission.dart';
import '../../resources/ColorManager.dart';
import '../../services/WorkshopCubit.dart';
import '../../widgets/CustomButton.dart';
import '../../widgets/CustomContainer.dart';
import '../../widgets/CustomStepWidget.dart';
import '../../widgets/CustomTextField.dart';
import '../../widgets/CustomTextLink.dart';

class RequestScreen extends StatefulWidget {
  @override
  State<RequestScreen> createState() => _RequestState();
}

class _RequestState extends State<RequestScreen> {
  late MyCarCubit myCarCubit;
  late WorkshopCubit workshopCubit;
  late MyOrderCubit orderCubit;

  Position? currentLocation;

  bool useRep = false;

  @override
  void initState() {
    super.initState();
    checkPermission();
    getCurrentLocation();
    myCarCubit = getIt<MyCarCubit>();
    workshopCubit = getIt<WorkshopCubit>();
    orderCubit = getIt<MyOrderCubit>();
    workshopCubit.loadWorkshops();
     myCarCubit.loadCars();
  }

  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController dateTimeController = TextEditingController();

  CarService? carService;

  onTapFunction({required BuildContext context}) async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      lastDate: DateTime(2025),
      firstDate: DateTime.now(),
      initialDate: DateTime.now(),
    );

    if (pickedDate == null) return;

    TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );

    if (pickedTime == null) return;

    DateTime selectedDateTime = DateTime(
      pickedDate.year,
      pickedDate.month,
      pickedDate.day,
      pickedTime.hour,
      pickedTime.minute,
    );

    dateTimeController.text =
        DateFormat('yyyy-MM-dd hh:mm a').format(selectedDateTime);
  }

  @override
  Widget build(BuildContext context) {
    carService = ModalRoute.of(context)!.settings.arguments as CarService;

    return MultiBlocProvider(
        providers: [
          BlocProvider<MyCarCubit>(create: (_) => myCarCubit),
          BlocProvider<MyOrderCubit>(create: (_) => orderCubit),
          BlocProvider<WorkshopCubit>(
              create: (_) => workshopCubit),
        ],
        child: BlocListener<MyOrderCubit, MyOrderState>(
            listener: (context, state) {
              if (state is MyOrderAdded) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    duration: Duration(seconds: 2),
                    content: Text('تم اضافة الطلب بنجاح'),
                    backgroundColor: Colors.green,
                  ),
                );
                Navigator.pushNamed(context, RouteManager.tracking,
                    arguments: state.customerOrder);
              }
            },
            child: Scaffold(
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
                        SafeArea(
                          child: CustomContainer(
                            height: MediaQuery.of(context).size.height,
                            bgColor: ColorName.whiteColor,
                            allBorder: true,
                            circularRadius: Radius.circular(60),
                            padding: EdgeInsets.all(16),
                            child: SingleChildScrollView(
                              child: Form(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Expanded(
                                          child: Text(
                                            carService!.serviceName ?? '',
                                            textAlign: TextAlign.center,
                                            style: const TextStyle(
                                                fontSize: 30,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                        IconButton(
                                          icon: Icon(Icons.arrow_forward),
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                        ),
                                      ],
                                    ),
                                    const Divider(
                                      color: Colors.grey,
                                      // color:ColorManager.errorColor,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text('الخطوة\nالثالثة'),
                                        CustomStep(
                                          isActive: false,
                                          number: 3,
                                        ),
                                        Text('الخطوة\nالثانية'),
                                        CustomStep(
                                          isActive: false,
                                          number: 2,
                                        ),
                                        Text('الخطوة\nالأولى'),
                                        CustomStep(
                                          isActive: true,
                                          number: 1,
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 16,
                                    ),
                                    const SizedBox(
                                      height: 16,
                                    ),
                                    Visibility(
                                      visible: carService?.serviceName !=
                                          'نقل السيارة بسطحة',
                                      child: BlocBuilder<MyOrderCubit,
                                          MyOrderState>(
                                        builder: (context, state) {
                                          if (state is SetRepState) {
                                            useRep = state.useRep;
                                          }
                                          return Column(
                                            children: [
                                              CustomContainer(
                                                  circularRadius:
                                                      Radius.circular(30),
                                                  alignment: Alignment.center,
                                                  width: MediaQuery.of(context)
                                                      .size
                                                      .width,
                                                  height: 60,
                                                  bgColor:
                                                      ColorName.lightGreyColor,
                                                  allBorder: true,
                                                  child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .stretch,
                                                      children: <Widget>[
                                                        TextButton(
                                                          onPressed: () {
                                                            orderCubit
                                                                .setRep(false);
                                                          },
                                                          style: ElevatedButton.styleFrom(
                                                              backgroundColor:
                                                                  orderCubit
                                                                          .useRep
                                                                      ? ColorName
                                                                          .lightGreyColor
                                                                      : ColorName
                                                                          .blueColor,
                                                              fixedSize: const Size(
                                                                  188, 10)),
                                                          child: Text(
                                                              'اوصل سيارتي بنفسي',
                                                              style: TextStyle(
                                                                  color: orderCubit.useRep
                                                                      ? ColorName
                                                                          .blackColor
                                                                      : ColorName
                                                                          .whiteColor,
                                                                  fontSize:
                                                                      15)),
                                                        ),
                                                        TextButton(
                                                          onPressed: () {
                                                            orderCubit
                                                                .setRep(true);
                                                          },
                                                          style: ElevatedButton.styleFrom(
                                                              backgroundColor:
                                                                  orderCubit
                                                                          .useRep
                                                                      ? ColorName
                                                                          .blueColor
                                                                      : ColorName
                                                                          .lightGreyColor,
                                                              fixedSize: const Size(
                                                                  178, 10)),
                                                          child: Text(
                                                            'مندوبنا يوصلك',
                                                            style: TextStyle(
                                                                color: orderCubit.useRep
                                                                    ? ColorName
                                                                        .whiteColor
                                                                    : ColorName
                                                                        .blackColor,
                                                                fontSize: 15),
                                                          ),
                                                        ),
                                                      ])),
                                              Visibility(
                                                  visible: useRep,
                                                  child: const Text(
                                                    'تبدأ رسوم التوصيل من 20 ريال',
                                                    style: TextStyle(
                                                        color:
                                                            ColorName.redColor),
                                                  ))
                                            ],
                                          );
                                        },
                                      ),
                                    ),
                                    BlocBuilder<MyCarCubit, MyCarState>(
                                      builder: (context, state) {
                                        List<Car> myCars = [];
                                        List<String> carName = [];
                                        if (state is MyCarLoaded) {
                                          print(
                                              'loaded cars: ${myCarCubit.value}');
                                          myCars = state.cars;
                                          carName.add(myCarCubit.value);
                                          myCars.forEach((e) => carName.add(
                                              '${e.carType} - ${e.carModel} - ${e.carYear} - ${e.carColor}'));
                                        }

                                        return CustomDropDownWidget<String>(
                                          value: myCarCubit.value,
                                          alignment: Alignment.topRight,
                                          label: 'اختار سيارتك',
                                          fontSize: 16,
                                          items: carName,
                                          onItemSelected: (value) {
                                            List<String> data =
                                                value.split(' - ');
                                            if (data.length == 4) {
                                              Car myCar = myCars.firstWhere(
                                                  (element) =>
                                                      element.carType ==
                                                          data[0] &&
                                                      element.carModel ==
                                                          data[1] &&
                                                      element.carYear ==
                                                          data[2] &&
                                                      element.carColor ==
                                                          data[3]);
                                              myCarCubit.selectCar(myCar);
                                            }
                                          },
                                        );
                                      },
                                    ),
                                    CustomTextField(
                                      controller: _phoneController,
                                      checkValidation: (value) => value!.isEmpty
                                          ? 'يرجى كتابة وصف'
                                          : null,
                                      label: 'اوصف مشكلتك',
                                      type: TextInputType.multiline,
                                      alignment: Alignment.topRight,
                                      fontSize: 16,
                                      textAlign: TextAlign.right,
                                      fieldLabel: '......',
                                    ),
                                    const SizedBox(height: 8),
                                    const Padding(
                                      padding: EdgeInsets.all(8.0),
                                      child: Align(
                                        alignment: Alignment.topRight,
                                        child: Text(
                                          'ادخل موقعك',
                                          textAlign: TextAlign.right,
                                          style: TextStyle(
                                            fontSize: 16,
                                          ),
                                        ),
                                      ),
                                    ),
                                    BlocBuilder<MyOrderCubit, MyOrderState>(
                                        builder: (context, state) {
                                      if (state is OrderLocationUpdated) {
                                        return Column(children: [
                                          Visibility(
                                              visible: true,
                                              child: Text(
                                                'LAT: ${state.latitude ?? ""} - LNG: ${state.longitude ?? ""}',
                                                style: const TextStyle(
                                                    fontSize: 16,
                                                    color: ColorName.blueColor),
                                              )),
                                          Visibility(
                                              visible: true,
                                              child: Text(
                                                'ADDRESS: ${state.address}-',
                                                style: const TextStyle(
                                                    fontSize: 12,
                                                    color:
                                                        ColorName.blackColor),
                                              ))
                                        ]);
                                      } else {
                                        return Container();
                                      }
                                    }),
                                    ElevatedButton(
                                      onPressed: () => getCurrentLocation(),
                                      //getCurrentPosition(),
                                      style: ButtonStyle(
                                        minimumSize:
                                            MaterialStateProperty.all<Size>(
                                                Size(50, 50)), //////// HERE
                                        backgroundColor: getColor(
                                            ColorName.blueColor,
                                            ColorName.greyColor),
                                        shape: MaterialStateProperty.all<
                                            RoundedRectangleBorder>(
                                          RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(200),
                                          ),
                                        ),
                                      ),
                                      child: const Icon(
                                        Icons.location_on_outlined,
                                        color: Colors.white,
                                        size: 40,
                                      ),
                                    ),
                                    const Align(
                                        alignment: Alignment.topRight,
                                        child: Padding(
                                          padding: EdgeInsets.only(right: 8.0),
                                          child: Text(
                                            'اختار الموعد',
                                            style: TextStyle(fontSize: 16),
                                          ),
                                        )),
                                    TextField(
                                      controller: dateTimeController,
                                      readOnly: true,
                                      decoration: const InputDecoration(
                                          hintText:
                                              "Click here to select date and time",
                                          hintStyle: TextStyle(fontSize: 12)),
                                      onTap: () =>
                                          onTapFunction(context: context),
                                    ),
                                    BlocBuilder<WorkshopCubit, WorkshopState>(
                                        builder: (context, state) {
                                      List<Workshop> workshops = [];
                                      List<String> workshopsName = [];
                                      if (state is WorkshopLoaded) {
                                        print('loaded workshops: $state');
                                        workshops = state.agents;
                                        workshopsName.add(workshopCubit.value!);
                                        workshops.forEach((e) {
                                          if (e.workshopName != null ||
                                              e.workshopName!.trim().isNotEmpty)
                                            workshopsName.add(e.workshopName!);
                                        });
                                      }
                                      return CustomDropDownWidget<String>(
                                        value: workshopCubit.value,
                                        alignment: Alignment.topRight,
                                        label: 'اختار الورشة',
                                        fontSize: 16,
                                        items: workshopsName,
                                        onItemSelected: (value) {
                                          if (value != "Select Workshop") {
                                            workshopCubit.setWorkshop(workshops
                                                .firstWhere((element) =>
                                                    element.workshopName ==
                                                    value));
                                          }
                                        },
                                      );
                                    }),
                                    SizedBox(height: 25),
                                    CustomTextLink(
                                      text: 'لعرض الفاتورة اضغط هنا',
                                      fontSize: 15,
                                      textColor: ColorName.primaryAssentColor,
                                      onClick: () {
                                        Client client = getIt<ClientInfoCubit>()
                                            .getClient();
                                        print('${client.clientName}');
                                        Navigator.pushNamed(
                                            context, RouteManager.bill,
                                            arguments: CustomerOrder(
                                                client: client,
                                                orderType: OrderType.HOME,
                                                car: myCarCubit.selectedCar,
                                                orderDate: DateTimeManager
                                                    .currentDateTime(),
                                                carService: CarService(
                                                    serviceName:
                                                        carService!.serviceName,
                                                    servicePrice: carService!
                                                        .servicePrice,
                                                    status: OrderServiceStatus
                                                        .PENDING,
                                                    serviceDescription: carService!
                                                            .serviceDescription ??
                                                        carService!.serviceName,
                                                    serviceId: '123'),
                                                representative:
                                                    Representative(),
                                                orderStatus:
                                                    OrderStatus.PENDING,
                                                workshop: workshopCubit
                                                    .selectedWorkshop,
                                                orderDescription: '',
                                                notes: '',
                                                orderCost:
                                                    calculateOrderCost()));
                                      },
                                    ),
                                    SizedBox(height: 25),
                                    CustomButton(
                                      onClick: () {
                                        orderCubit.createOrder(CustomerOrder(
                                            orderType: OrderType.HOME,
                                            car: myCarCubit.selectedCar,
                                            orderDate: dateTimeController.text,
                                            carService: CarService(
                                                serviceName:
                                                    carService!.serviceName,
                                                servicePrice:
                                                    carService!.servicePrice,
                                                status:
                                                    OrderServiceStatus.PENDING,
                                                serviceDescription: carService!
                                                        .serviceDescription ??
                                                    carService!.serviceName,
                                                serviceId: '123'),
                                            representative: useRep
                                                ? Representative()
                                                : null,
                                            orderStatus: OrderStatus.PENDING,
                                            workshop:
                                                workshopCubit.selectedWorkshop,
                                            orderDescription: '',
                                            notes: '',
                                            orderCost: calculateOrderCost()));
                                      },
                                      textColor: ColorName.whiteColor,
                                      title: 'تأكيد الطلب',
                                      bgColor: ColorName.blueColor,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              // This trailing comma makes auto-formatting nicer for build methods.
            )));
  }

  MaterialStateProperty<Color> getColor(Color greyColor, Color whiteLinkColor) {
    getColor(Set<MaterialState> states) {
      if (states.contains(MaterialState.pressed)) {
        return whiteLinkColor;
      } else {
        return greyColor;
      }
    }

    return MaterialStateProperty.resolveWith(getColor);
  }

  double calculateOrderCost() {
    if (useRep) {
      return 20.0 + carService!.servicePrice!;
    } else {
      return carService!.servicePrice ?? 0.0;
    }
  }

  Future<LocationPermission> checkPermission() async {
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
    }
    return permission;
  }

  Future<void> getCurrentLocation() async {
    try {
      LocationPermission permission = await checkPermission();
      print('permission $permission');
      if (permission != LocationPermission.denied) {
        currentLocation = await Geolocator.getCurrentPosition(
            desiredAccuracy: LocationAccuracy.high);
        if (currentLocation != null) {
          getAddressFromLatLng(
              LatLng(currentLocation!.latitude, currentLocation!.longitude));
        }
      }
    } catch (e) {
      print("Error getting location: $e");
    }
  }

  Future<void> getAddressFromLatLng(LatLng latLng) async {
    try {
      List<Placemark> placemarks =
          await placemarkFromCoordinates(latLng.latitude, latLng.longitude);
      Placemark place = placemarks[0];
      print(
          "Address: ${place.street}, ${place.locality}, ${place.administrativeArea}, ${place.country}");
      orderCubit.orderLocation(latLng.latitude, latLng.longitude, place.street,
          place.locality, place.administrativeArea, place.country);
    } catch (e) {
      print("Error getting address: $e");
    }
  }
}
