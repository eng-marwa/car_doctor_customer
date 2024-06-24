import 'package:car_doctor/data/model/orders/CustomerOrder.dart';



class TempOrder {
  CustomerOrder? customerOrder;
  List<String?> rejectBy = [];

  TempOrder({this.customerOrder, this.rejectBy = const <String>[]});

  Map<String, dynamic> toJson() {
    return {
      'customerOrder': customerOrder!.toJson(),
      'rejectBy': rejectBy.map((v) => v).toList(), // Convert each element to JSON compatible type
    };
  }

  TempOrder.fromJson(Map<String, dynamic> json) {
    customerOrder = CustomerOrder.fromJson(json['customerOrder']);
    // Check if 'rejectBy' key exists in the JSON
    if (json.containsKey('rejectBy')) {
      // Iterate over the list and add each element individually
      (json['rejectBy'] as List).forEach((v) {
        rejectBy.add(v as String?);
      });
    }
  }
}
