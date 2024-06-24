import 'PlateNumber.dart';

class Car {
  String? carId;
  String carColor = "";
  String carType = "";
  String carModel ="";
  PlateNumber? plateNumber;
  String carYear="";
  String carFuel = "";
  Car({this.carId, required this.carColor , required this.carType,required this.carModel, required this.plateNumber, required this.carYear, required this.carFuel});

  factory Car.fromJson(Map<String, dynamic> json) {
    return Car(
      carId: json['carId'],
      carColor: json['carColor'],
      carType: json['carType'],
      carModel: json['carModel'],
      plateNumber: PlateNumber.fromJson(json['plateNumber']),
      carYear: json['carYear'],
      carFuel: json['carFuel'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "carId": carId,
      "carColor": carColor,
      "carType": carType,
      "carModel": carModel,
      "plateNumber": plateNumber!.toJson(),
      "carYear": carYear,
      "carFuel": carFuel,
    };
  }
}
