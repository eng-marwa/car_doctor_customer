class CarEntity {
  String? id;
  String brand = "";
  String model = "";
  String color = "";
  String plate = "";
  String year = "";
  String fuel = "";

  CarEntity(
      {this.id,
      required this.brand,
      required this.model,
      required this.color,
      required this.plate,
      required this.year,
      required this.fuel});
}
