import 'dart:developer';

import 'package:firedart/firestore/firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:master_brother/src/repo/models/order_model.dart';
import 'package:master_brother/src/repo/models/reserved_product_model.dart';
import 'package:master_brother/src/repo/models/storage_order_model.dart';
import 'package:master_brother/src/repo/models/storage_product_model.dart';
import 'package:master_brother/src/repo/providers/local_user_provider.dart';
import 'package:master_brother/src/utils/extensions/date_time.dart';
import 'package:master_brother/src/utils/extensions/order_status.dart';

class Reserve {
  static Future<bool> addToReserve(ReserveProductModel product) async {
    bool status = false;
    final db = Firestore.instance.collection('reserve');
    final storage = await Firestore.instance.collection('storage').get();
    await db.add(product.toJson()).then((value) async {
      bool have = false;
      for (var item in storage) {
        try {
          final pr = StorageProduct.fromJson(item.map);
          if (pr.id == product.productID) {
            have = true;
            final updating = StorageProduct(
              name: pr.name,
              id: pr.id,
              lastUpdated: Time.getNow(),
              count: pr.count + product.count,
            ).toJson();
            await Firestore.instance
                .collection('storage')
                .document(item.id)
                .update(updating)
                .then((value) {
              status = true;
            });
            break;
          }
        } catch (e) {
          log("Error: ", error: e);
        }
      }
      if (have == false) {
        final storage = Firestore.instance.collection('storage');
        storage.add(
          StorageProduct(
            name: product.productName,
            id: product.productID,
            lastUpdated: Time.getNow(),
            count: product.count,
          ).toJson(),
        );
      }
    });
    return status;
  }

  static Future<bool> getFromReserve(ReserveProductModel product) async {
    bool status = false;
    final storage = await Firestore.instance.collection('storage').get();
    for (var item in storage) {
      try {
        final pr = StorageProduct.fromJson(item.map);
        if (pr.id == product.productID) {
          if (pr.count >= product.count) {
            final updating = StorageProduct(
              name: pr.name,
              id: pr.id,
              lastUpdated: Time.getNow(),
              count: pr.count - product.count,
            ).toJson();
            await Firestore.instance
                .collection('storage')
                .document(item.id)
                .update(updating)
                .then((value) {
              status = true;
            });
            break;
          } else {
            status = false;
            break;
          }
        }
      } catch (e) {
        log("Error: ", error: e);
      }
    }
    return status;
  }

  static Future<bool> addNewProductToReserve(StorageProduct product) async {
    bool status = false;
    final storage = Firestore.instance.collection('storage');
    storage.add(product.toJson()).then((value) {
      status = true;
    });

    return status;
  }

  static Future<int> getFromSclad(OrderModel order, Ref ref) async {
    final status = await getFromReserve(
      ReserveProductModel(
        productID: order.productID,
        count: order.productCount,
        productName: order.productName,
        addedTime: Time.getNow(),
        employeeID: '',
      ),
    );

    if (status) {
      final storage = Firestore.instance.collection('scladers');
      storage.add(
        StorageOrderModel(
          employeeID: ref.watch(localUser)!.login,
          status: OrderStatus.success,
          count: order.productCount,
          productID: order.productID,
          createdTime: Time.getNow(),
          orderID: order.id,
          productName: order.productName,
        ).toJson(),
      );

      return OrderStatus.success;
    } else {
      return OrderStatus.not;
    }
  }

  static Future<List<StorageProduct>> getAllStorageProducts() async {
    List<StorageProduct> products = [];
    final storage = await Firestore.instance.collection('storage').get();
    for (var item in storage) {
      try {
        log("${item.map}");
        StorageProduct prd = StorageProduct.fromJson(item.map);
        prd.docID = item.id;
        products.add(prd);
      } catch (e) {
        log("Error: ", error: e);
      }
    }

    return products;
  }
}
