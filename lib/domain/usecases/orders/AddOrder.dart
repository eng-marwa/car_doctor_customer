import 'package:car_doctor/data/model/orders/CustomerOrder.dart';
import 'package:car_doctor/domain/repository/order_repository/OrderRepository.dart';
import 'package:injectable/injectable.dart';
import '../../../app/BaseUseCase.dart';
import '../../../data/model/MyOrder.dart';
import '../../../di/AppModule.dart';

@injectable
class AddOrder implements BaseUseCase<CustomerOrder,String> {
  @override
  Future<String> execute(input) async {
    return getIt<OrderRepository>().addOrder(input!);
  }}


