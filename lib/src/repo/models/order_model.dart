class OrderModel {
  String customerName;
  String customerID;
  String productName;
  String productID;
  String productImage;
  int productCount;
  int productPrice;
  String createTime;
  String id;
  String sellerID;
  String sellerName;
  String sellerStatus;
  String orderStatus;
  String paymentStatus;

  OrderModel({
    required this.id,
    required this.createTime,
    required this.customerID,
    required this.customerName,
    required this.sellerID,
    required this.sellerName,
    required this.sellerStatus,
    required this.productCount,
    required this.productID,
    required this.productImage,
    required this.productName,
    required this.productPrice,
    required this.paymentStatus,
    required this.orderStatus,
  });
}
