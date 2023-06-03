class OrderModel {
  String customerName;
  String customerID;
  String productName;
  String productID;
  int productCount;
  int productPrice;
  String createTime;
  String id;
  String sellerID;
  String sellerName;
  String orderStatus;
  String paymentStatus;
  String docID;

  OrderModel({
    required this.id,
    required this.createTime,
    required this.customerID,
    required this.customerName,
    required this.sellerID,
    required this.sellerName,
    required this.productCount,
    required this.productID,
    required this.productName,
    required this.productPrice,
    required this.paymentStatus,
    required this.orderStatus,
    this.docID = '',
  });
}
