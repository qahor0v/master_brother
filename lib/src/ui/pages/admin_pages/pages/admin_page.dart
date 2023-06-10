import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iconly/iconly.dart';
import 'package:master_brother/src/data/local/local_db_services.dart';
import 'package:master_brother/src/ui/pages/admin_pages/screens/sdmin_sidebar.dart';
import 'package:master_brother/src/ui/pages/auth_pages/start_page.dart';
import 'package:master_brother/src/ui/pages/global_pages/add_order_page.dart';
import 'package:master_brother/src/ui/pages/global_pages/order_pages/open_orders_list.dart';
import 'package:master_brother/src/ui/pages/global_pages/order_pages/qarzs_page.dart';
import 'package:master_brother/src/ui/widgets/helper_box/sized_box.dart';
import 'package:master_brother/src/utils/constants/app_colors.dart';
import 'package:master_brother/src/utils/methods/navigators.dart';

import '../../../../repo/providers/order_providers.dart';

class AdiminPage extends ConsumerWidget {
  static const String id = "admin1";

  const AdiminPage({super.key});

  @override
  Widget build(BuildContext context, ref) {
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
              ref.watch(getSuccessOrdersProvider).when(
                    data: (data) {
                      return ListTile(
                        onTap: () {
                          goTo(
                            context,
                            OpenOrdersListPage(
                              orders: data,
                              title: "Bajarilgan buyurtmalar",
                            ),
                          );
                        },
                        contentPadding: EdgeInsets.zero,
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
                        trailing: Text(
                          "${data.length} ta",
                          style: const TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      );
                    },
                    error: (e, m) {
                      return WBox(0.0);
                    },
                    loading: () => WBox(0.0),
                  ),
              ref.watch(getWaitingOrdersProvider).when(
                    data: (data) {
                      return ListTile(
                        onTap: () {
                          goTo(
                            context,
                            OpenOrdersListPage(
                              orders: data,
                              title: "Jarayondagi buyurtmalar",
                            ),
                          );
                        },
                        contentPadding: EdgeInsets.zero,
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
                        trailing: Text(
                          "${data.length} ta",
                          style: const TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      );
                    },
                    error: (e, m) {
                      return WBox(0.0);
                    },
                    loading: () => WBox(0.0),
                  ),
              ref.watch(getCancelledOrdersProvider).when(
                    data: (data) {
                      return ListTile(
                        onTap: () {
                          goTo(
                            context,
                            OpenOrdersListPage(
                              orders: data,
                              title: "Bekor qilingan buyurtmalar",
                            ),
                          );
                        },
                        contentPadding: EdgeInsets.zero,
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
                        trailing: Text(
                          "${data.length} ta",
                          style: const TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      );
                    },
                    error: (e, m) {
                      return WBox(0.0);
                    },
                    loading: () => WBox(0.0),
                  ),
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
                onTap: () {
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
