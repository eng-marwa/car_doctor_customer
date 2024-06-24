import 'package:car_doctor/app/BaseUseCase.dart';
import 'package:car_doctor/di/AppModule.dart';
import 'package:injectable/injectable.dart';

import '../../../data/model/Offer.dart';
import '../../repository/offer_repository/OfferRepository.dart';

@injectable
class ViewOffers implements BaseUseCase<void, List<Offer>> {
  @override
  Future<List<Offer>> execute(input) async{
    print('ViewOffers.execute() ${getIt<OfferRepository>().getOffers()}');
    return await getIt<OfferRepository>().getOffers();
  }
}
