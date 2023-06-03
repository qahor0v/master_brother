class ProductModel {
  String name;
  String id;
  String price;
  String docID;

  ProductModel({
    required this.name,
    required this.id,
    required this.price,
    this.docID = '',
  });

  Map<String, dynamic> toJson() => {
        "name": name,
        "id": id,
        "price": price,
        "docID": docID,
      };

  ProductModel.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        id = json['id'],
        docID = json['docID']??"",
        price = json['price'];
}
