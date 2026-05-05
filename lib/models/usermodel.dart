class UserModel {
  final String name;
  final String email;
  final String phone;
  final String whatsapp;
  final String password;

  UserModel({
    required this.name,
    required this.email,
    required this.phone,
    required this.whatsapp,
    required this.password,
  });

  Map<String, dynamic> toJson() {
    return {
      "name": name,
      "email": email,
      "phone": phone,
      "whatsapp": whatsapp,
      "password": password,
    };
  }

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      name: json["name"],
      email: json["email"],
      phone: json["phone"],
      whatsapp: json["whatsapp"],
      password: json["password"],
    );
  }
}