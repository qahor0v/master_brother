import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:master_brother/src/repo/providers/order_providers.dart';
import 'package:master_brother/src/ui/screens/when/when_error.dart';
import 'package:master_brother/src/ui/screens/when/when_loading.dart';

class InProcessOrdersPage extends HookConsumerWidget {
  const InProcessOrdersPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    final myProvider = ref.watch(getAllOrdersProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Jarayondagi buyurtmalar"),
      ),
      body: myProvider.when(
        data: (data) {
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
        },
        error: (e, m) {
          return WhenError();
        },
        loading: () {
          return WhenLoading();
        },
      ),
    );
  }
}
