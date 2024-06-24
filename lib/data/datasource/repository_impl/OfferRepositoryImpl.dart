import 'package:car_doctor/di/AppModule.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:injectable/injectable.dart';

import '../../../domain/repository/offer_repository/OfferRepository.dart';
import '../../model/Offer.dart';

@Injectable(as: OfferRepository)
class OfferRepositoryImpl implements OfferRepository{
  OfferRepositoryImpl();

  Future<List<Offer>> getOffers() async {
    QuerySnapshot snapshot =
        await getIt<FirebaseFirestore>().collection('offers').get();
    print(snapshot.docs);
    return snapshot.docs
        .map((e) => Offer.fromJson(e.data() as Map<String, dynamic>))
        .toList();
  }
}
