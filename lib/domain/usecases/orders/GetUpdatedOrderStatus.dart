import 'package:injectable/injectable.dart';

import '../../../app/BaseUseCase.dart';
import '../../../data/model/orders/CustomerOrder.dart';
import '../../../di/AppModule.dart';
import '../../repository/order_repository/OrderRepository.dart';

@injectable
class GetUpdatedOrderStatus implements BaseUseCase<CustomerOrder, CustomerOrder> {
  @override
  Future<CustomerOrder> execute(input) async {
    return getIt<OrderRepository>().updateServiceStatus(input!);
  }
}
