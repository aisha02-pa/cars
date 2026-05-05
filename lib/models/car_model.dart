class CarModel {
  final String name;
  final String brand;
  final int year;
  final String type;
  final String image;
  final int price;

  CarModel({
    required this.name,
    required this.brand,
    required this.year,
    required this.type,
    required this.image,
    required this.price,
  });

  factory CarModel.fromJson(Map<String, dynamic> json) {
    return CarModel(
      name: json['model'] ?? '',
      brand: json['brand'] ?? '',
      year: json['year'] ?? 0,
      type: json['type'] ?? '',
      image: json['image'] ?? '',
      price: json['price'] ?? 0,
    );
  }
}