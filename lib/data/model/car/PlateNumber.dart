class PlateNumber{
  String? plateNumber;
  String? plateCode;
  String? plateType;
  PlateNumber({this.plateNumber, this.plateCode, this.plateType});

  factory PlateNumber.fromJson(Map<String, dynamic> json) {
    return PlateNumber(
      plateNumber: json['plateNumber'],
      plateCode: json['plateCode'],
      plateType: json['plateType'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'plateNumber': plateNumber,
      'plateCode': plateCode,
      'plateType': plateType,
    };
  }
}