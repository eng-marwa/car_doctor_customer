part of 'OfferCubit.dart';

@immutable
abstract class OfferState {}

class OfferInitial extends OfferState {}

class OfferLoading extends OfferState {}

class OfferLoaded extends OfferState {
  final List<Offer> data;

  OfferLoaded(this.data);
}

class OfferError extends OfferState {
  final String message;

  OfferError(this.message);
}
