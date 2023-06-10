import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:master_brother/src/data/local/local_db_services.dart';
import 'package:master_brother/src/ui/pages/auth_pages/start_page.dart';
import 'package:master_brother/src/ui/pages/global_pages/add_customer_page.dart';
import 'package:master_brother/src/ui/pages/global_pages/add_order_page.dart';

class SellerPage extends StatelessWidget {
  static const String id = 'seller23';

  const SellerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Sotuv paneli"),
        actions: [
          IconButton(
            onPressed: () async {
              await LocalDB().logout().then((value) {
                Navigator.pushReplacementNamed(context, StartPage.id);
                log("logouted");
              });
            },
            icon: const Icon(
              Icons.logout,
              color: Colors.white,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ListTile(
              leading: const Icon(
                Icons.add_business,
                color: Colors.blueAccent,
              ),
              title: const Text(
                "Buyurtma qo'shish",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              trailing: const Icon(
                IconlyLight.arrow_right,
                color: Colors.white,
              ),
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => const AddOrderPage(),
                ),
              ),
            ),
            ListTile(
              leading: const Icon(
                Icons.person,
                color: Colors.blueAccent,
              ),
              title: const Text(
                "Mijoz qo'shish",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              trailing: const Icon(
                IconlyLight.arrow_right,
                color: Colors.white,
              ),
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => const AddCustomerPage(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
