import 'package:car_doctor/presentation/widgets/CustomButton.dart';
import 'package:flutter/material.dart';

import '../../../data/model/Offer.dart';
import 'OfferService.dart';

class AddOffer extends StatefulWidget {
  const AddOffer({super.key});

  @override
  State<AddOffer> createState() => _AddOfferState();
}

class _AddOfferState extends State<AddOffer> {
  @override
  Widget build(BuildContext context) {
    return CustomButton(textColor: Colors.red, title: 'Test', bgColor: Colors.white, onClick: () {
      Offer offer = Offer(
        title: 'New Offer',
        description: 'Description of the offer',
        price: '10', // Example price
        discount: '2', // Example discount
        createdAt: DateTime.now().toString(),
        expiredAt: DateTime.now().add(Duration(days: 7)).toString(),
        limit: '1', // Example limit
      );

      OfferService offerService = OfferService();
      offerService.addOffer(offer);
    },);
  }
}


