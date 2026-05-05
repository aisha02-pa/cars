class CarModel {
  final String id;
  final String brand;
  final String model;
  final int year;
  final String type;
  final String image;
  final int price;

  CarModel({
    required this.id,
    required this.brand,
    required this.model,
    required this.year,
    required this.type,
    required this.image,
    required this.price,
  });

  factory CarModel.fromJson(Map<String, dynamic> json) {
    return CarModel(
      id: json['id'] ?? '',
      brand: json['brand'] ?? '',
      model: json['model'] ?? '',
      year: json['year'] ?? 0,
      type: json['type'] ?? '',
      image: (json['images'] != null && json['images'].isNotEmpty)
          ? json['images'][0]
          : '',
      price:
          (json['leasePeriodPricing'] != null &&
              json['leasePeriodPricing'].isNotEmpty)
          ? json['leasePeriodPricing'][0]['totalAmount'] ?? 0
          : 0,
    );
  }
}
