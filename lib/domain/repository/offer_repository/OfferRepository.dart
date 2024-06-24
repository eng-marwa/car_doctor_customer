import 'package:injectable/injectable.dart';

import '../../../data/model/Offer.dart';

abstract class OfferRepository {
  Future<List<Offer>> getOffers();
}