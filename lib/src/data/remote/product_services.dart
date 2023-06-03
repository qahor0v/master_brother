import 'dart:developer';

import 'package:firedart/firestore/firestore.dart';
import 'package:master_brother/src/repo/models/product_model.dart';
import 'package:master_brother/src/utils/methods/id_generator.dart';

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
            docID: item.id,
            name: item.map['name'],
            id: item.map['id'],
            price: item.map['price'].toString(),
          ),
        );
      }
    }
    return list;
  }

  static Future<bool> editPrice(ProductModel product, String price) async {
    bool status = false;
    try {
      final db = Firestore.instance.collection('products');
      db
          .document(product.docID)
          .update(ProductModel(
            name: product.name,
            id: generateID(),
            price: price,
          ).toJson())
          .then((value) {
        status = true;
      }).catchError((onError) {
        log("Error: $onError");
      });
    } catch (e) {
      log("$e");
    }

    return status;
  }
}
