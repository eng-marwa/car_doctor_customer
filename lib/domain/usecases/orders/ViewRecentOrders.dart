import 'package:injectable/injectable.dart';

import '../../../app/BaseUseCase.dart';
import '../../../data/model/orders/CustomerOrder.dart';
import '../../../di/AppModule.dart';
import '../../repository/order_repository/OrderRepository.dart';

@injectable
class ViewRecentOrders implements BaseUseCase<void, List<CustomerOrder>> {
  @override
  Future<List<CustomerOrder>> execute(input) async {
    return getIt<OrderRepository>().getRecentOrders();
  }
}
