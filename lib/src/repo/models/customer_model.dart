class CustomerModel {
  String name;
  String id;
  String phoneNumber;
  String address;

  CustomerModel({
    required this.id,
    required this.name,
    required this.phoneNumber,
    required this.address,
  });

  Map<String, dynamic> toJson() => {
        "name": name,
        "id": id,
        "phoneNumber": phoneNumber,
        "address": address,
      };

  CustomerModel.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        id = json['id'],
        phoneNumber = json['phoneNumber'],
        address = json['address'];
}
