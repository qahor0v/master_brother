class CustomerModel {
  String name;
  String id;
  String phoneNumber;
  String address;
  String docID;

  CustomerModel({
    required this.id,
    required this.name,
    required this.phoneNumber,
    required this.address,
    this.docID = '',
  });

  Map<String, dynamic> toJson() => {
        "name": name,
        "id": id,
        "phoneNumber": phoneNumber,
        "address": address,
        "docID": docID,
      };

  CustomerModel.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        id = json['id'],
        phoneNumber = json['phoneNumber'],
        docID = json['docID'],
        address = json['address'];
}
