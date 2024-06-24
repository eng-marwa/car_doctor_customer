class Offer {
  String? id;
  String title='';
  String description;
  String? imageUrl;
  String price;
  String discount;
  String createdAt;
  String expiredAt;
  String limit;

  Offer(
      {this.id,
      required this.title,
      required this.description,
      this.imageUrl,
      required this.price,
      required this.discount,
      required this.createdAt,
      required this.expiredAt,
      required this.limit});

  factory Offer.fromJson(Map<String, dynamic> json) {
    print(json);
    return Offer(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      imageUrl: json['imageUrl'],
      price: json['price'],
      discount: json['discount'],
      createdAt: json['createdAt'],
      expiredAt: json['expiredAt'],
      limit: json['limit'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'imageUrl': imageUrl,
      'price': price,
      'discount': discount,
      'createdAt': createdAt,
      'expiredAt': expiredAt,
      'limit': limit,
    };
  }
}
