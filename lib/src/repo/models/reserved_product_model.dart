class ReserveProductModel {
  String productID;
  String productName;
  int count;
  String employeeID;
  String addedTime;
  String docID;

  ReserveProductModel({
    required this.productID,
    required this.count,
    required this.productName,
    required this.addedTime,
    required this.employeeID,
    this.docID = '',
  });

  Map<String, dynamic> toJson() => {
        "productID": productID,
        "productName": productName,
        "count": count,
        "employeeID": employeeID,
        "addedTime": addedTime,
        "docID": docID,
      };

  ReserveProductModel.fromJson(Map<String, dynamic> json)
      : productID = json['productID'],
        productName = json['productName'],
        count = json['count'],
        employeeID = json['employeeID'],
        addedTime = json['addedTime'],
        docID = json['docID'] ?? '';
}
