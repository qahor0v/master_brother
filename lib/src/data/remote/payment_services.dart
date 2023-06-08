import 'dart:developer';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:master_brother/src/data/remote/order_services.dart';
import 'package:master_brother/src/utils/extensions/date_time.dart';

class PaymentServices {
  Ref ref;

  PaymentServices(this.ref);

  Future<int> getSuccessPayments() async {
    int summa = 0;
    final orders = await Order.getAllOrders();
    for (final order in orders) {
      try {
        if (Time.isToday(order.createTime)) {
          summa += order.paidSumma;
        }
      } catch (e) {
        log("Error payment:", error: e);
      }
    }
    return summa;
  }

  Future<int> getQarzedPayments() async {
    int summa = 0;
    final orders = await Order.getAllOrders();
    for (final order in orders) {
      try {
        if (Time.isToday(order.createTime)) {
          summa += (order.productCount * order.productPrice - order.paidSumma);
        }
      } catch (e) {
        log("$e");
      }
    }
    return summa;
  }
}
