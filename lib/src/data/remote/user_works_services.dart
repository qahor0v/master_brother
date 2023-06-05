import 'dart:developer';

import 'package:firedart/firestore/firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:master_brother/src/repo/models/order_model.dart';
import 'package:master_brother/src/repo/models/reserved_product_model.dart';
import 'package:master_brother/src/repo/models/storage_order_model.dart';
import 'package:master_brother/src/repo/providers/local_user_provider.dart';
import 'package:master_brother/src/utils/constants/employees.dart';

class UserWorks {
  Ref ref;

  UserWorks(this.ref);

  Future<dynamic> getMyChanges() async {
    final user = ref.watch(localUser);
    if (user!.type == Employee.seller) {
      List<OrderModel> orders = [];
      final db = await Firestore.instance.collection('orders').get();
      for (var item in db) {
        try {
          final order = OrderModel.fromJson(item.map);
          if (order.sellerID == user.login) {
            orders.add(order);
          }
        } catch (e) {
          log("Error: ", error: e);
        }
      }
      return orders;
    } else if (user.type == Employee.creator) {
      List<ReserveProductModel> products = [];
      final db = await Firestore.instance.collection('reserve').get();
      for (var item in db) {
        try {
          final product = ReserveProductModel.fromJson(item.map);
          if (product.employeeID == user.login) {
            products.add(product);
          }
        } catch (e) {
          log("Error: ", error: e);
        }
      }
      return products;
    } else if (user.type == Employee.sclad) {
      List<StorageOrderModel> works = [];
      final storage = await Firestore.instance.collection('scladers').get();
      for (var item in storage) {
        try {
          final work = StorageOrderModel.fromJson(item.map);
          if (work.employeeID == user.login) {
            works.add(work);
          }
        } catch (e) {
          log("Error: ", error: e);
        }
      }
      return works;
    } else {
      return null;
    }
  }
}
