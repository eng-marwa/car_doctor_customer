import 'package:equatable/equatable.dart';

class CarData extends Equatable {
  String? type;
  String? model;

  CarData({this.type, this.model});

  factory CarData.fromJson(Map<String, dynamic> json) {
    return CarData(
      type: json['type'],
      model: json['model'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'type': type,
      'model': model,
    };
  }

  @override
  List<Object?> get props => [type, model];
}
