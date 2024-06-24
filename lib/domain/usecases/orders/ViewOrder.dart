import 'package:car_doctor/data/model/MyOrder.dart';
import 'package:car_doctor/data/model/orders/CustomerOrder.dart';
import 'package:car_doctor/domain/repository/order_repository/OrderRepository.dart';
import 'package:injectable/injectable.dart';

import '../../../app/BaseUseCase.dart';
import '../../../di/AppModule.dart';

@injectable
class ViewOrders implements BaseUseCase<void, List<CustomerOrder>> {
  @override
  Future<List<CustomerOrder>> execute(input) async {
    print('ViewOrder.execute()${getIt<OrderRepository>().getOrders()}');
    return getIt<OrderRepository>().getOrders();
  }
}
