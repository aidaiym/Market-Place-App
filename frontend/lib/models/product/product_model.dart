class ProductModel {
  ProductModel({
    this.id,
    required this.name,
    required this.description,
    required this.price,
  });

  final int? id;
  final String name;
  final String description;
  final String price;

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
      id: json["id"],
      name: json["name"],
      description: json["description"],
      price: json["price"]);

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "description": description,
        "price": price,
      };
}
