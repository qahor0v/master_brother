import 'package:flutter/material.dart';
import 'package:master_brother/src/repo/models/order_model.dart';
import 'package:master_brother/src/ui/widgets/helper_box/sized_box.dart';

class OpenOrderPage extends StatelessWidget {
  final OrderModel order;

  const OpenOrderPage({
    Key? key,
    required this.order,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Buyurtma"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Yaratildi - ${order.createTime} da",
                style: const TextStyle(
                  color: Colors.white,
                ),
              ),
              HBox(12.0),
              Text(
                "Tovar nomi - ${order.productName} ",
                style: const TextStyle(
                  color: Colors.white,
                ),
              ),
              HBox(12.0),
              Text(
                "Donasi - ${order.productCount} ",
                style: const TextStyle(
                  color: Colors.white,
                ),
              ),
              HBox(12.0),
              Text(
                "Narxi - ${order.productPrice} ",
                style: const TextStyle(
                  color: Colors.white,
                ),
              ),
              HBox(12.0),
              Text(
                "Buyurtmani - ${order.sellerID} qo'shdi",
                style: const TextStyle(
                  color: Colors.white,
                ),
              ),
              HBox(12.0),
              Text(
                "To'langan summa: ${order.paidSumma} so'm",
                style: const TextStyle(
                  color: Colors.white,
                ),
              ),
              HBox(12.0),
              Text(
                "Qolgan summa (qarzdorlik): ${order.productCount * order.productPrice - order.paidSumma > 0 ? order.productCount * order.productPrice - order.paidSumma : "Mavjud emas"} so'm",
                style: const TextStyle(
                  color: Colors.white,
                ),
              ),
              HBox(12.0),
              Text(
                "Qolgan summa (qarzdorlik): ${order.productCount * order.productPrice - order.paidSumma > 0 ? order.productCount * order.productPrice - order.paidSumma : "Mavjud emas"} so'm",
                style: const TextStyle(
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
