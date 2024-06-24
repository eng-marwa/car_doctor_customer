
import 'package:car_doctor/domain/repository/order_repository/OrderRepository.dart';
import 'package:injectable/injectable.dart';

import '../../../app/BaseUseCase.dart';
import '../../../data/model/MyOrder.dart';
import '../../../di/AppModule.dart';

@injectable
class DeleteOrder implements BaseUseCase<MyOrder,String> {
  @override
  Future<String> execute(input) {
    return getIt<OrderRepository>().deleteOrder(input!);
  }
}