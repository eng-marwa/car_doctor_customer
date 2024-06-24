class Representative {
  String? repId;
  String? repName;
  String? repPhone;
  String? repEmail;
  String? repAddress;
  String? repLocation;

  Representative({
    this.repId,
    this.repName,
    this.repPhone,
    this.repEmail,
    this.repAddress,
    this.repLocation,
  });

  factory Representative.fromJson(Map<String, dynamic> json) {
    return Representative(
        repId: json['repId'],
        repName: json['repName'],
        repPhone: json['repPhone'],
        repEmail: json['repEmail'],
        repAddress: json['repAddress'],
        repLocation: json['repLocation']);
  }

  Map<String, dynamic> toJson() {
    return {
      'repId': repId,
      'repName': repName,
      'repPhone': repPhone,
      'repEmail': repEmail,
      'repAddress': repAddress,
      'repLocation': repLocation,
    };
  }
}
