import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:master_brother/src/data/remote/customer_services.dart';

final getAllCustomers = FutureProvider((ref) async {
  final result = await CustomerServices.getAllCustomers();
  return result;
});
