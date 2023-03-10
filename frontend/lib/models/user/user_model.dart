class UserModel {
  UserModel({
    this.id,
    required this.name,
    required this.email,
    required this.phoneNumber,
  });

  final int? id;
  final String name;
  final String email;
  final String phoneNumber;

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
      id: json["id"],
      name: json["name"],
      email: json["email"],
      phoneNumber: json["phoneNumber"]);

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "email": email,
        "phoneNumber": phoneNumber,
      };
}
