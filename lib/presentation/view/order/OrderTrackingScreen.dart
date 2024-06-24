import 'package:car_doctor/data/model/orders/CustomerOrder.dart';
import 'package:car_doctor/di/AppModule.dart';
import 'package:car_doctor/presentation/my_orders/MyOrderCubit.dart';
import 'package:car_doctor/presentation/resources/RouteManager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/model/StepModel.dart';
import '../../../data/model/orders/OrderServiceStatus.dart';
import '../../../gen/colors.gen.dart';
import '../../../utils/DateTimeManager.dart';
import '../../my_orders/StepperCubit.dart';
import '../../widgets/CustomButton.dart';
import '../../widgets/CustomStepWidget.dart';

List<StepModel> steps = [
  StepModel(
    title: " وصول السيارة الى الورشة",
    isActive: false,
    state: StepState.indexed,
    subtitle: '',
  ),
  StepModel(
      title: "جاري العمل على اصلاح السيارة",
      isActive: false,
      state: StepState.indexed,
      subtitle: ''),
  StepModel(
      title: "تم الانتهاء من السيارة",
      isActive: false,
      state: StepState.indexed,
      subtitle: ''),
  StepModel(
      title: "تم استلام السيارة",
      isActive: false,
      state: StepState.indexed,
      subtitle: ''),
];

class OrderTrackingScreen extends StatefulWidget {
  const OrderTrackingScreen({super.key});

  @override
  State<OrderTrackingScreen> createState() => _OrderTrackingScreenState();
}

class _OrderTrackingScreenState extends State<OrderTrackingScreen> {
  late StepperCubit stepperCubit;
  late CustomerOrder customerOrder;
  late MyOrderCubit myOrderCubit;
  int currentStep = 0;

  @override
  void initState() {
    super.initState();
    myOrderCubit = getIt<MyOrderCubit>();
  }

  @override
  Widget build(BuildContext context) {
    customerOrder = ModalRoute.of(context)?.settings.arguments as CustomerOrder;
    myOrderCubit.updateOrderStatus(customerOrder);
    stepperCubit = StepperCubit(currentStep);

    return WillPopScope(
        onWillPop: () async {
          print('WillPopScope called');
          // Get the WorkshopOrderCubit instance
          final myOrderCubit = getIt<MyOrderCubit>();
          // Call the method to reload the orders
          myOrderCubit.loadRecentOrders();
          return true; // Allow the screen to be popped
        },
        child: BlocProvider(
            create: (context) => stepperCubit,
            child: Scaffold(
                body: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.black,
                    Color(0xff181879),
                  ],
                ),
              ),
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(120)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.white,
                    )
                  ],
                ),
                margin:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(
                      height: 50,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 50.0),
                            child: Text(
                              '${customerOrder.carService?.serviceName} ',
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                color: ColorName.blueColor,
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                                height: 0.2,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 50,
                          child: IconButton(
                            onPressed: () => Navigator.pop(context),
                            icon: const Icon(Icons.arrow_forward),
                            color: ColorName.blackColor,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    const Divider(),
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
                          isActive: true,
                          number: 2,
                        ),
                        Text('الخطوة\nالأولى'),
                        CustomStep(
                          isActive: true,
                          number: 1,
                        ),
                      ],
                    ),
                    Divider(),
                    BlocBuilder<StepperCubit, int>(builder: (context, state) {
                      final updatedSteps = steps.asMap().entries.map((entry) {
                        final index = entry.key;
                        final step = entry.value;
                        StepState stepState = StepState.indexed;
                        bool isActive = false;
                        switch (customerOrder.carService?.status) {

                          case OrderServiceStatus.PENDING:
                          case OrderServiceStatus.ARRIVED:
                            if (index == 0) {
                              stepState = StepState.complete; // Red color state
                              isActive = true;
                            }
                            break;
                          case OrderServiceStatus.IN_PROGRESS:
                            if (index == 1) {
                              stepState = StepState.complete; // Red color state
                              isActive = true;
                            }
                            break;
                          case OrderServiceStatus.COMPLETED:
                            if (index == 2) {
                              stepState = StepState.complete; // Red color state
                              isActive = true;
                            }
                            break;
                          case OrderServiceStatus.DELIVER:
                            stepState = StepState.complete; // Red color state for all steps
                            isActive = true;
                            break;
                          default:
                            break;
                        }

                        return Step(
                          title: Text(step.title),
                          content: step.content,
                          isActive: isActive,
                          state: stepState,
                          subtitle: Text(step.subtitle),
                        );
                      }).toList();

                      return Column(
                        children: [
                          Padding(
                              padding: const EdgeInsets.all(30),
                              child: Directionality(
                                textDirection: TextDirection.rtl,
                                child: Theme(
                                    data: Theme.of(context).copyWith(
                                      colorScheme: Theme.of(context)
                                          .colorScheme
                                          .copyWith(
                                            primary: Colors.red,
                                            // Color for the active step
                                            secondary: Colors.green,
                                            // Color for the completed steps
                                            onSurface: Colors.blue,
                                          ),
                                    ),
                                    child: Stepper(
                                      steps: updatedSteps,
                                      type: StepperType.vertical,
                                      currentStep: state,
                                      onStepTapped: (value) {
                                      },
                                      controlsBuilder: (context, details) =>
                                          const SizedBox.shrink(),
                                    )),
                              )),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 15, horizontal: 30),
                            child: CustomButton(
                              title: 'تم',
                              textColor: ColorName.whiteColor,
                              onClick: customerOrder.carService?.status==OrderServiceStatus.DELIVER
                                  ? () {
                                      getIt<MyOrderCubit>().loadRecentOrders();
                                      Navigator.pushNamed(context, RouteManager.pay , arguments: customerOrder);
                                    }
                                  : null,
                              // Enable the button if the current step is 6 or more
                              bgColor: customerOrder.carService?.status==OrderServiceStatus.DELIVER
                                  ? ColorName.blueColor
                                  : ColorName.lightGreyColor,
                            ),
                          ),
                        ],
                      );
                    }),
                  ],
                ),
              ),
            ))));
  }
}
