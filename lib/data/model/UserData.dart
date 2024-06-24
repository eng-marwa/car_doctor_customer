import 'package:car_doctor/data/model/Client.dart';
import 'package:json_annotation/json_annotation.dart';

import 'Workshop.dart';

@JsonSerializable()
class UserData extends JsonSerializable {
  String username;
  String password;
  String? uid;
  String email;
  String phone;
  String? displayName;
  String? address;
  String? userId;
  double? lat;
  double? lon;

  UserData(
      {required this.username,
      required this.password,
      this.uid,
      required this.email,
      required this.phone,
      this.displayName = "",
      this.address = "",
      required this.userId,
      this.lat = 0,
      this.lon = 0});

  factory UserData.fromJson(Map<String, dynamic> json) {
    return UserData(
      username: json['username'],
      password: json['password'],
      uid: json['uid'],
      email: json['email'],
      phone: json['phone'],
      displayName: json['displayName'] ?? "",
      address: json['address'] ?? "",
      userId: json['userId'],
      lat: json['lat']?.toDouble(),
      lon: json['lon']?.toDouble(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "username": username,
      "password": password,
      "uid": uid,
      "email": email,
      "phone": phone,
      "displayName": displayName,
      "address": address,
      "userId": userId,
      "lat": lat,
      "lon": lon,
    };
  }

  static Workshop userDataWorkshopMapper(UserData userData) {
    return Workshop(
      workshopUid: userData.uid,
      workshopName: userData.displayName,
      workshopPhone: userData.phone,
      workshopEmail: userData.email,
      workshopAddress: userData.address,
      workshopId: userData.userId ?? '',
      workshopLat: userData.lat ?? 0.0, // Providing default value if null
      workshopLon: userData.lon ?? 0.0, // Providing default value if null
    );
  }

  static Client userDataClientMapper(UserData userData) {
    return Client(
        clientId: userData.userId,
        clientLat: userData.lat  ?? 0.0,
        clientAddress: userData.address,
        clientEmail: userData.email,
        clientLon: userData.lon  ?? 0.0,
        clientName: userData.displayName,
        clientPhone: userData.phone,
        uid: userData.uid);
  }

  @override
  String toString() {
    return 'UserData{username: $username, password: $password, uid: $uid, email: $email, phone: $phone, displayName: $displayName, address: $address, userId: $userId, lat: $lat, lon: $lon}';
  }
}
