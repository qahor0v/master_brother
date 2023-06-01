import 'dart:developer';

import 'package:firedart/firestore/firestore.dart';
import 'package:master_brother/src/repo/models/product_model.dart';

class ProductServices {
  static Future<bool> addNewProduct(ProductModel product) async {
    bool status = false;
    try {
      final db = Firestore.instance.collection('products');
      await db.add(product.toJson()).then((value) {
        status = true;
      });
    } catch (e) {
      log("Error:", error: e);
    }
    return status;
  }

  static Future<List<ProductModel>> getAllProducts() async {
    List<ProductModel> list = [];
    final db = Firestore.instance.collection('products');
    final result = await db.get();
    for (final item in result) {
      if (item.map.isNotEmpty) {
        list.add(
          ProductModel(
            name: item.map['name'],
            id: item.map['id'],
            price: item.map['price'],
          ),
        );
      }
    }
    return list;
  }
}
