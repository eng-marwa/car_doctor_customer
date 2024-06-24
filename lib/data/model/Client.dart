class Client {
  String? clientId;
  String? clientName;
  String? clientPhone;
  String? clientEmail;
  String? clientAddress;
  double? clientLat = 0;
  double? clientLon = 0;
  String? uid;

  Client(
      {this.clientId,
      this.clientName,
      this.clientPhone,
      this.clientEmail,
      this.clientAddress,
      this.clientLat,
      this.clientLon,
      this.uid});

  factory Client.fromJson(Map<String, dynamic> json) {
    return Client(
        clientId: json['clientId'],
        clientName: json['clientName'],
        clientPhone: json['clientPhone'],
        clientEmail: json['clientEmail'],
        clientAddress: json['clientAddress'],
        clientLat: json['clientLat'],
        clientLon: json['clientLon'],
        uid: json['uid']);
  }

  Map<String, dynamic> toJson() {
    return {
      'clientId': clientId,
      'clientName': clientName,
      'clientPhone': clientPhone,
      'clientEmail': clientEmail,
      'clientAddress': clientAddress,
      'clientLat': clientLat,
      'clientLon': clientLon,
      'uid': uid,
    };
  }
}
