import 'dart:developer';

import 'package:firedart/firestore/firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:master_brother/src/repo/models/order_model.dart';
import 'package:master_brother/src/ui/widgets/loadings/dialog_loading.dart';
import 'package:master_brother/src/ui/widgets/toast/main.dart';
import 'package:master_brother/src/utils/extensions/order_status.dart';
import 'package:master_brother/src/utils/extensions/payment_status.dart';
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

  static Future<List<OrderModel>> getAllOrders() async {
    List<OrderModel> orders = [];
    try {
      final data = await Firestore.instance.collection('orders').get();
      for (var item in data) {
         try {
          OrderModel order = OrderModel.fromJson(item.map);
          order.docID = item.id;
          orders.add(order);
        } catch (e) {
          log("Error:", error: e);
        }
      }
    } catch (e) {
      log("Error:", error: e);
    }

    return orders;
  }

  static Future<List<OrderModel>> getSuccessOrders() async {
    List<OrderModel> orders = [];
    try {
      final data = await Firestore.instance.collection('orders').get();
      for (var item in data) {
        OrderModel order = OrderModel.fromJson(item.map);
        order.docID = item.id;
        if (order.orderStatus == OrderStatus.success) {
          orders.add(order);
        }
      }
    } catch (e) {
      log("Error: ", error: e);
    }

    return orders;
  }  static Future<List<OrderModel>> getWaitingOrders() async {
    List<OrderModel> orders = [];
    try {
      final data = await Firestore.instance.collection('orders').get();
      for (var item in data) {
        OrderModel order = OrderModel.fromJson(item.map);
        order.docID = item.id;
        if (order.orderStatus == OrderStatus.progress) {
          orders.add(order);
        }
      }
    } catch (e) {
      log("Error: ", error: e);
    }

    return orders;
  }

  static Future<List<OrderModel>> getCancelledOrders() async {
    List<OrderModel> orders = [];
    try {
      final data = await Firestore.instance.collection('orders').get();
      for (var item in data) {
        OrderModel order = OrderModel.fromJson(item.map);
        order.docID = item.id;
        if (order.orderStatus == OrderStatus.cancelled) {
          orders.add(order);
        }
      }
    } catch (e) {
      log("Error: ", error: e);
    }

    return orders;
  }

  static Future<List<OrderModel>> getQarzedOrders() async {
    List<OrderModel> orders = [];
    try {
      final data = await Firestore.instance.collection('orders').get();
      for (var item in data) {
        OrderModel order = OrderModel.fromJson(item.map);
        order.docID = item.id;
        if (order.paymentStatus == false) {
          orders.add(order);
        }
      }
    } catch (e) {
      log("Error: ", error: e);
    }

    return orders;
  }

  static Future<bool> orderSetStatusSuccess(OrderModel order) async {
    bool status = false;
    final db = Firestore.instance.collection('orders');
    await db
        .document(order.docID)
        .update(
          OrderModel(
            id: order.id,
            createTime: order.createTime,
            customerID: order.customerID,
            customerName: order.customerName,
            sellerID: order.sellerID,
            productCount: order.productCount,
            paidSumma: order.paidSumma,
            productID: order.productID,
            productName: order.productName,
            productPrice: order.productPrice,
            paymentStatus: order.paymentStatus,
            orderStatus: OrderStatus.success,
          ).toJson(),
        )
        .then((value) {
      status = true;
    });
    return status;
  }

  static Future<bool> orderSetStatusCancelled(OrderModel order) async {
    bool status = false;
    final db = Firestore.instance.collection('orders');
    await db
        .document(order.docID)
        .update(
          OrderModel(
            id: order.id,
            createTime: order.createTime,
            customerID: order.customerID,
            customerName: order.customerName,
            sellerID: order.sellerID,
            productCount: order.productCount,
            paidSumma: order.paidSumma,
            productID: order.productID,
            productName: order.productName,
            productPrice: order.productPrice,
            paymentStatus: order.paymentStatus,
            orderStatus: OrderStatus.cancelled,
          ).toJson(),
        )
        .then((value) {
      status = true;
    });
    return status;
  }

  static Future<bool> changeOrderPayment(OrderModel order, int payment) async {
    bool status = false;
    final db = Firestore.instance.collection('orders');
    await db
        .document(order.docID)
        .update(
          OrderModel(
            id: order.id,
            createTime: order.createTime,
            customerID: order.customerID,
            customerName: order.customerName,
            sellerID: order.sellerID,
            productCount: order.productCount,
            paidSumma: payment,
            productID: order.productID,
            productName: order.productName,
            productPrice: order.productPrice,
            paymentStatus: paymentStatus(
              price: order.productPrice.toString(),
              payed: payment.toString(),
              count: order.productCount,
            ),
            orderStatus: OrderStatus.cancelled,
          ).toJson(),
        )
        .then((value) {
      status = true;
    });
    return status;
  }

  static Future<bool> deleteOrder(OrderModel order) async {
    bool status = false;
    final db = Firestore.instance.collection('orders');
    await db.document(order.docID).delete().then((value) {
      status = true;
    });
    return status;
  }
}
