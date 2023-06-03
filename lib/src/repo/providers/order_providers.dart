import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:master_brother/src/data/remote/order_services.dart';

final getAllOrdersProvider = FutureProvider((ref) async {
  final result = await Order.getAllOrders();
  return result;
});
