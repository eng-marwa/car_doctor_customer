import 'package:injectable/injectable.dart';

import '../../../app/BaseUseCase.dart';
import '../../../di/AppModule.dart';
import '../../entity/ReviewData.dart';
import '../../repository/order_repository/OrderRepository.dart';

@injectable
class Review implements BaseUseCase<ReviewData,String> {
  @override
  Future<String> execute(input) async {
    return getIt<OrderRepository>().review(input!);
  }}


