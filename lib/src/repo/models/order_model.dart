class OrderModel {
  String customerName;
  String customerID;
  String productName;
  String productID;
  int productCount;
  int productPrice;
  int paidSumma;
  String createTime;
  String id;
  String sellerID;
  int orderStatus;
  bool paymentStatus;
  String docID;

  OrderModel({
    required this.id,
    required this.createTime,
    required this.customerID,
    required this.customerName,
    required this.sellerID,
    required this.productCount,
    required this.paidSumma,
    required this.productID,
    required this.productName,
    required this.productPrice,
    required this.paymentStatus,
    required this.orderStatus,
    this.docID = '',
  });

  Map<String, dynamic> toJson() => {
        "id": id,
        "createTime": createTime,
        "customerID": customerID,
        "customerName": customerName,
        "sellerID": sellerID,
        "productCount": productCount,
        "paidSumma": paidSumma,
        "productID": productID,
        "productName": productName,
        "productPrice": productPrice,
        "paymentStatus": paymentStatus,
        "orderStatus": orderStatus,
      };

  OrderModel.fromJson(Map<String, dynamic> json)
      : id = json['id']??"",
        createTime = json['createTime']??"",
        customerID = json['customerID']??"",
        customerName = json['customerName']??"",
        sellerID = json['sellerID']??"",
        productCount = json['productCount']??0,
        paidSumma = json['paidSumma']??0,
        productID = json['productID']??"",
        productName = json['productID']??"",
        productPrice = json['productPrice']??0,
        paymentStatus = json['paymentStatus']??false,
        orderStatus = json['orderStatus']??1,
        docID = json['docID'] ?? "";
}
