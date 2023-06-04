import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:master_brother/src/repo/providers/order_providers.dart';
import 'package:master_brother/src/ui/screens/when/when_error.dart';
import 'package:master_brother/src/ui/screens/when/when_loading.dart';

class CancelledOrdersPage extends HookConsumerWidget {
  const CancelledOrdersPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    final orders = ref.watch(getCancelledOrdersProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Bekor qilingan buyurtmalar"),
      ),
      body: orders.when(
        data: (data) {
          if (data.isEmpty) {
            return const Center(
              child: Text(
                "Bekor qilingan buyurtmalar hozircha mavjud emas.",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  fontSize: 20,
                ),
                textAlign: TextAlign.center,
              ),
            );
          } else {
            return ListView.builder(
              itemCount: data.length,
              itemBuilder: (context, index) {
                final order = data[index];
                return ListTile(
                  title: Text(
                    '${order.customerName} ga ${order.productCount} ta ${order.productName}',
                    style: const TextStyle(color: Colors.white, fontSize: 13),
                  ),
                  subtitle: Text(
                    "Qo'shildi: ${order.createTime}",
                    style: const TextStyle(color: Colors.white, fontSize: 13),
                  ),
                );
              },
            );
          }
        },
        error: (e, m) {
          log("Error: ", error: e, stackTrace: m);
          return WhenError();
        },
        loading: () => WhenLoading(),
      ),
    );
  }
}
