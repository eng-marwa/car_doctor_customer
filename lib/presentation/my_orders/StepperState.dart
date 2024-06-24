abstract class StepperState {
  const StepperState();
}

class WaitingStepState extends StepperState {}

class CarArrivedStepState extends StepperState {}

class CarReceivedStepState extends StepperState {}

class CarInProgressStepState extends StepperState {}

class CarFinishedStepState extends StepperState {}

class CarDeliveryStepState extends StepperState {}
