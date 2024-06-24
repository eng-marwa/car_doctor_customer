class MyOrder {
  String? id;
  final String category;
  final String name;
  bool? deliverCar;
  String? describeProblem;
  final String location;
  final String orderdate;
  final String workshop;
  final String car;
  final String status;
  final String total;

  MyOrder(
      {required this.id,
        required this.name,
        required this.category,
        this.deliverCar,
        this.describeProblem,
        required this.location,
        required this.workshop,
        required this.car,
        required this.orderdate,
        required this.status,
        required this.total});

  factory MyOrder.fromJson(Map<String, dynamic> json) {
    return MyOrder(
        id: json['id'],
        name: json['name'],
        orderdate: json['orderdate'],
        status: json['status'],
        total: json['total'],
        category:json['category'],
        location:json['location'],
        workshop:json['workshop'],
        car:json['car'],
        deliverCar:json['deliverCar'],
        describeProblem:json['describeProblem']);
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'category':category,
      'orderdate': orderdate,
      'location':location,
      'workshop':workshop,
      'car':car,
      'deliverCar':deliverCar,
      'describeProblem':describeProblem,
      'status': status,
      'total': total
    };
  }
}
