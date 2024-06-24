import 'OrderServiceStatus.dart';

class CarService {
  final String? serviceId;
  final String? serviceName;
  final String? serviceDescription;
  final double? servicePrice;
  OrderServiceStatus? status;

  CarService(
      {this.serviceId,
      this.serviceName,
      this.serviceDescription='',
      this.servicePrice,
      this.status});

  factory CarService.fromJson(Map<String, dynamic> json) {
    return CarService(
        serviceId: json['serviceId'],
        serviceName: json['serviceName'],
        serviceDescription: json['serviceDescription'],
        servicePrice: json['servicePrice'],
        status: OrderServiceStatus.values.firstWhere(
            (element) => element.name.toLowerCase() == json['status']));
  }

  Map<String, dynamic> toJson() {
    return {
      'serviceId': serviceId,
      'serviceName': serviceName,
      'serviceDescription': serviceDescription,
      'servicePrice': servicePrice,
      'status': status!.name.toLowerCase()
    };
  }
}
