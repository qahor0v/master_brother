import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:master_brother/src/data/remote/payment_services.dart';

final getSuccessPaymentProvider = FutureProvider((ref) async {
  final result = await PaymentServices(ref).getSuccessPayments();
  return result;
});

final getQarzedPaymentProvider = FutureProvider((ref) async {
  final result = await PaymentServices(ref).getQarzedPayments();
  return result.abs();
});
