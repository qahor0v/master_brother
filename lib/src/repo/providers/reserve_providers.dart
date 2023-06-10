import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:master_brother/src/data/remote/reserve_services.dart';

final getAllReservedProductsProvider = FutureProvider((ref) async {
  final result = await Reserve.getAllStorageProducts();

  return result;
});
