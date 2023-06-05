class StorageOrderModel {
  String orderID;
  String employeeID;
  String productID;
  String productName;
  int count;
  String createdTime;
  int status;
  String docID;

  StorageOrderModel({
    required this.employeeID,
    required this.status,
    required this.count,
    required this.productID,
    required this.createdTime,
    required this.orderID,
    required this.productName,
    this.docID = '',
  });

  Map<String, dynamic> toJson() => {
        "orderID": orderID,
        "employeeID": employeeID,
        "productID": productID,
        "count": count,
        "productName": productName,
        "createdTime": createdTime,
        "status": status,
      };

  StorageOrderModel.fromJson(Map<String, dynamic> json)
      : orderID = json['orderID'],
        employeeID = json['employeeID'],
        productName = json['productName'],
        productID = json['productID'],
        createdTime = json['createdTime'],
        count = json['count'],
        status = json['status'],
        docID = json['docID'] ?? "";
}
