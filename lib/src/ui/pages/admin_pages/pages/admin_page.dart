import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:master_brother/src/data/local/local_db_services.dart';
import 'package:master_brother/src/ui/pages/admin_pages/screens/sdmin_sidebar.dart';
import 'package:master_brother/src/ui/pages/auth_pages/start_page.dart';
import 'package:master_brother/src/ui/pages/global_pages/add_order_page.dart';
import 'package:master_brother/src/ui/pages/global_pages/order_pages/cancelled_orders_page.dart';
import 'package:master_brother/src/ui/pages/global_pages/order_pages/in_proccess_orders_page.dart';
import 'package:master_brother/src/ui/pages/global_pages/order_pages/qarzs_page.dart';
import 'package:master_brother/src/ui/pages/global_pages/order_pages/success_orders_page.dart';
import 'package:master_brother/src/utils/constants/app_colors.dart';
import 'package:master_brother/src/utils/methods/navigators.dart';

class AdiminPage extends StatefulWidget {
  static const String id = "admin1";

  const AdiminPage({super.key});

  @override
  State<AdiminPage> createState() => _AdiminPageState();
}

class _AdiminPageState extends State<AdiminPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const AdminSidebar(),
      appBar: AppBar(
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
        elevation: 0.8,
        title: const Text("Admin Panel"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(
            left: 16,
            right: 16,
            top: 8.0,
          ),
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
                  IconlyLight.shield_done,
                  color: mainColor,
                ),
                title: const Text(
                  "Bajarilgan buyurtmalar",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                trailing: const Icon(
                  IconlyLight.arrow_right,
                  color: Colors.white,
                ),
                onTap: () {
                  goTo(context, const SuccessOrdersPage());
                },
              ),
              ListTile(
                leading: const Icon(
                  IconlyLight.time_circle,
                  color: Colors.yellowAccent,
                ),
                title: const Text(
                  "Jarayondagi buyurtmalar",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                trailing: const Icon(
                  IconlyLight.arrow_right,
                  color: Colors.white,
                ),
                onTap: () {
                  goTo(context, const InProcessOrdersPage());
                },
              ),
              ListTile(
                leading: const Icon(
                  IconlyLight.close_square,
                  color: Colors.redAccent,
                ),
                title: const Text(
                  "Bekor qilingan buyurtmalar",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                trailing: const Icon(
                  IconlyLight.arrow_right,
                  color: Colors.white,
                ),
                onTap: () {
                  goTo(context, const CancelledOrdersPage());
                },
              ),
                ListTile(
                  onTap: (){
                    goTo(context, const QarzedOrdersPage());
                  },
                leading: const Icon(
                  Icons.attach_money_outlined,
                  color: Colors.blueAccent,
                ),
                title: const Text(
                  "Qarzdorliklar",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                trailing: const Icon(
                  IconlyLight.arrow_right,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
