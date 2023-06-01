import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:master_brother/src/data/local/local_db_services.dart';
import 'package:master_brother/src/ui/pages/admin_pages/screens/sdmin_sidebar.dart';
import 'package:master_brother/src/ui/pages/global_pages/add_order_page.dart';
import 'package:master_brother/src/utils/constants/app_colors.dart';


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
              const ListTile(
                leading: Icon(
                  IconlyLight.shield_done,
                  color: mainColor,
                ),
                title: Text(
                  "Bajarilgan buyurtmalar",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                trailing: Icon(
                  IconlyLight.arrow_right,
                  color: Colors.white,
                ),
              ),
              const ListTile(
                leading: Icon(
                  IconlyLight.time_circle,
                  color: Colors.yellowAccent,
                ),
                title: Text(
                  "Jarayondagi buyurtmalar",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                trailing: Icon(
                  IconlyLight.arrow_right,
                  color: Colors.white,
                ),
              ),
              const ListTile(
                leading: Icon(
                  IconlyLight.close_square,
                  color: Colors.redAccent,
                ),
                title: Text(
                  "Bekor qilingan buyurtmalar",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                trailing: Icon(
                  IconlyLight.arrow_right,
                  color: Colors.white,
                ),
              ),
              const ListTile(
                leading: Icon(
                  Icons.attach_money_outlined,
                  color: Colors.blueAccent,
                ),
                title: Text(
                  "Qarzdorliklar",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                trailing: Icon(
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
