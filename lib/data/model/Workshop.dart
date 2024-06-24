import 'package:equatable/equatable.dart';

class Workshop extends Equatable {
  String? workshopUid;
  String? workshopName;
  String? workshopPhone;
  String? workshopEmail;
  String? workshopAddress;
  double? workshopLat = 0;
  double? workshopLon = 0;
  String? workshopId = '';

  Workshop(
      {this.workshopUid,
      this.workshopId,
      this.workshopName,
      this.workshopPhone,
      this.workshopEmail,
      this.workshopAddress,
      this.workshopLat,
      this.workshopLon});

  factory Workshop.fromJson(Map<String, dynamic> json) {
    return Workshop(
        workshopUid: json['workshopUid'],
        workshopId: json['workshopId'] ?? '' ,
        workshopName: json['workshopName'],
        workshopPhone: json['workshopPhone'],
        workshopEmail: json['workshopEmail'],
        workshopAddress: json['workshopAddress'],
        workshopLat: json['workshopLat'],
        workshopLon: json['workshopLon']);
  }

  Map<String, dynamic> toJson() {
    return {
      'workshopUid': workshopUid,
      'workshopId': workshopId,
      'workshopName': workshopName,
      'workshopPhone': workshopPhone,
      'workshopEmail': workshopEmail,
      'workshopAddress': workshopAddress,
      'workshopLat': workshopLat,
      'workshopLon': workshopLon,
    };
  }

  @override
  List<Object?> get props => [
        workshopUid,
        workshopId,
        workshopName,
        workshopPhone,
        workshopEmail,
        workshopAddress,
        workshopLat,
        workshopLon
      ];
}
