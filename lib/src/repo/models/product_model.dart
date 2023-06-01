class ProductModel {
  String name;
  String id;
  int price;

  ProductModel({
    required this.name,
    required this.id,
    required this.price,
  });

  Map<String, dynamic> toJson() => {
        "name": name,
        "id": id,
        "price": price,
      };

  ProductModel.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        id = json['id'],
        price = json['price'];
}
