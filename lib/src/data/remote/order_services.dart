import 'package:firedart/firestore/firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:master_brother/src/repo/models/order_model.dart';
import 'package:master_brother/src/ui/widgets/loadings/dialog_loading.dart';
import 'package:master_brother/src/ui/widgets/toast/main.dart';
import 'package:master_brother/src/utils/methods/navigators.dart';

class Order {
  static Future<void> addOrder(BuildContext context, OrderModel order) async {
    if (order.productName.isEmpty) {
      ScaffoldMessage.error(context, message: "Tovarni tanlang!");
    } else if (order.customerName.isEmpty) {
      ScaffoldMessage.error(context, message: "Mijoz ma'lumotlarini kiriting!");
    } else if (order.productCount == 0) {
      ScaffoldMessage.error(context, message: "Tovarni sonini kiriting!");
    } else {
      loadingDialog(context);
      final db = Firestore.instance.collection('orders');
      db.add(order.toJson()).then((value) {
        pop(context);
        pop(context);
        ScaffoldMessage.success(
          context,
          message: "Buyurtma muvaffaqiyatli yaratildi!",
        );
      });
    }
  }
}
