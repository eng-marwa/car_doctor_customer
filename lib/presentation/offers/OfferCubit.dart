import 'package:bloc/bloc.dart';
import 'package:car_doctor/di/AppModule.dart';
import 'package:car_doctor/domain/usecases/offers/ViewOffers.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

import '../../data/model/Offer.dart';

part 'OfferState.dart';

@injectable
class OfferCubit extends Cubit<OfferState> {
  OfferCubit() : super(OfferInitial());

  void getOffer() async {
    print('OfferCubit.getOffer()');
    try {
       emit(OfferLoading());
      List<Offer> data = await getIt<ViewOffers>().execute(null);
      if (data.isEmpty) {
        emit(OfferInitial());
      } else {
        emit(OfferLoaded(data));
      }
    } catch (e) {
      print(e.toString());
      //emit(OfferError(e.toString()));
    }
  }
}
