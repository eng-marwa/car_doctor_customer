import 'package:bloc/bloc.dart';
import 'package:car_doctor/di/AppModule.dart';
import 'package:car_doctor/domain/entity/ReviewData.dart';
import 'package:car_doctor/domain/usecases/orders/Review.dart';
import 'package:injectable/injectable.dart';

@injectable
class ReviewCubit extends Cubit<String> {
  ReviewCubit() : super("");
  final Review reviewUseCase = getIt<Review>();
  double selectedRate = 0;
  Future<void> addReview(
      String text, double rate, String orderId, String clientId) async {
    ReviewData reviewData = ReviewData(
        text: text, rate: rate, orderId: orderId, clientId: clientId);
    String state = await reviewUseCase.execute(reviewData);
    emit(state);
  }

  setRate(double rating) {
    selectedRate = rating;
    emit("rateAdded");
  }
}
