class ReviewData {
  String text = '';
  double rate = 0;
  String orderId;
  String clientId;

  ReviewData({required this.text, required this.rate, required this.orderId, required this.clientId});

  Map<String, dynamic> toMap() {
    return {
      'text': this.text,
      'rate': this.rate,
      'orderId': this.orderId,
      'clientId': this.clientId,
    };
  }

  factory ReviewData.fromMap(Map<String, dynamic> map) {
    return ReviewData(
      text: map['text'] as String,
      rate: map['rate'] as double,
      orderId: map['orderId'] as String,
      clientId: map['clientId'] as String,
    );
  }
}