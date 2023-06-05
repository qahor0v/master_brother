import 'package:firedart/firestore/firestore.dart';
import 'package:master_brother/src/repo/models/reserved_product_model.dart';
import 'package:master_brother/src/repo/models/storage_product_model.dart';
import 'package:master_brother/src/utils/extensions/date_time.dart';

class Reserve {
  static Future<bool> addToReserve(ReserveProductModel product) async {
    bool status = false;
    final db = Firestore.instance.collection('reserve');
    final storage = await Firestore.instance.collection('storage').get();
    await db.add(product.toJson()).then((value) async {
      for (var item in storage) {
        final pr = StorageProduct.fromJson(item.map);
        if (pr.id == product.productID) {
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
      }
    });
    return status;
  }

  static Future<bool> getFromReserve(ReserveProductModel product) async {
    bool status = false;
    final db = Firestore.instance.collection('reserve');
    final storage = await Firestore.instance.collection('storage').get();
    await db.add(product.toJson()).then((value) async {
      for (var item in storage) {
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
      }
    });
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
}
