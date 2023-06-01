import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:master_brother/src/data/remote/firestore_services.dart';
import 'package:master_brother/src/repo/models/product_model.dart';


final addNewProductProvider =
    FutureProvider.family((ref, ProductModel product) async {
  final result = await AppFirestore(ref).addNewProduct(product);
  return result;
});

final getAllProductsProvider = FutureProvider(
  (ref) async {
    final result = await AppFirestore(ref).getAllProducts();
    List<ProductModel> products = [];
    for (final item in result) {
      products.add(
        ProductModel(
          name: item['name'],
          id: item['id'],
          price: item['price'],
        ),
      );
    }
    return products;
  },
);
