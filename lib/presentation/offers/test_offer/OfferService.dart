import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../data/model/Offer.dart';

class OfferService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> addOffer(Offer offer) async {
    try {
      await _firestore.collection('offers').add(offer.toJson());
    } catch (e) {
      print('Error adding offer: $e');
      // Handle error
    }
  }
}
