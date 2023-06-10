import 'package:flutter/material.dart';
import 'package:master_brother/src/repo/models/order_model.dart';
import 'package:master_brother/src/ui/pages/global_pages/order_pages/open_order_page.dart';
import 'package:master_brother/src/utils/methods/navigators.dart';

class OpenOrdersListPage extends StatelessWidget {
  final List<OrderModel> orders;
  final String title;

  const OpenOrdersListPage({
    Key? key,
    required this.orders,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: orders.isEmpty
          ? const Center(
              child: Text(
                "Mavjud emas",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                ),
              ),
            )
          : ListView.builder(
              itemCount: orders.length,
              itemBuilder: (context, index) {
                return ListTile(
                  onTap: () {
                    goTo(context, OpenOrderPage(order: orders[index]));
                  },
                  leading: const Icon(
                    Icons.balance_outlined,
                    color: Colors.white,
                  ),
                  title: Text(
                    "${orders[index].productCount} ta ${orders[index].productName}",
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  subtitle: Text(
                    "Narxi: ${orders[index].productPrice} so'm/dona | Sana:${orders[index].createTime}",
                    style: const TextStyle(
                      color: Colors.white70,
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                );
              },
            ),
    );
  }
}
