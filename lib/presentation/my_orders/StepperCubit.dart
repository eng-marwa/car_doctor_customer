import 'package:bloc/bloc.dart';
import 'package:car_doctor/data/model/orders/CarService.dart';
import 'package:car_doctor/data/model/orders/CustomerOrder.dart';
import 'package:car_doctor/data/model/orders/OrderServiceStatus.dart';


import '../../data/model/orders/OrderStatus.dart';
import '../../di/AppModule.dart';
import '../../domain/repository/order_repository/OrderRepository.dart';
import '../view/order/OrderTrackingScreen.dart';

class StepperCubit extends Cubit<int> {
  int currentStep = 0;

  StepperCubit(this.currentStep)
      : super(currentStep); // pass the new parameter here
  final OrderRepository orderRepository = getIt<OrderRepository>();

  void nextStep(int value, CustomerOrder order) {
    if (value < steps.length) {
      emit(value);
      value++;
    }
  }

  void lastStep(CustomerOrder customerOrder) {
    customerOrder.carService?.status = OrderServiceStatus.DELIVER;
    emit(4);
  }




}
