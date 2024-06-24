part of 'WorkshopCubit.dart';

@immutable
abstract class WorkshopState {}

class WorkshopInitial extends WorkshopState {}
class WorkshopLoading extends WorkshopState {}
class WorkshopLoaded extends WorkshopState {
  List<Workshop> agents;
  WorkshopLoaded(this.agents);
}
class WorkshopError extends WorkshopState {
  final String message;

  WorkshopError(this.message);
}

class WorkshopSelected extends WorkshopState {
  final Workshop workshop;

  WorkshopSelected(this.workshop);
}