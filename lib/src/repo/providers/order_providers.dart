import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:master_brother/src/data/remote/order_services.dart';

final getAllOrdersProvider = FutureProvider((ref) async {
  final result = await Order.getAllOrders();
  return result;
});

final getSuccessOrdersProvider = FutureProvider((ref) async {
  final result = await Order.getSuccessOrders();
  return result;
});

final getCancelledOrdersProvider = FutureProvider((ref) async {
  final result = await Order.getCancelledOrders();
  return result;
});

final getQarzedOrdersProviders = FutureProvider((ref) async {
  final result = await Order.getQarzedOrders();
  return result;
});