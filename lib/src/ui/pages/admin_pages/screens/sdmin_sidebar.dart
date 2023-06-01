import 'package:flutter/material.dart';
import 'package:master_brother/src/ui/pages/admin_pages/pages/add_employee_page.dart';
import 'package:master_brother/src/ui/pages/admin_pages/pages/add_news_product.dart';
import 'package:master_brother/src/ui/pages/admin_pages/pages/admin_employee_stats_page.dart';
import 'package:master_brother/src/ui/pages/admin_pages/pages/edit_price_page.dart';
import 'package:master_brother/src/ui/pages/global_pages/add_customer_page.dart';
import 'package:master_brother/src/utils/constants/app_colors.dart';
class AdminSidebar extends StatelessWidget {
  const AdminSidebar({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: kBgColor,
      child: ListView(
        children: [
          tile(
            title: "Tovarlar ro'yxati",
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => const AddNewProductPage(),
                ),
              );
            },
          ),
           tile(
            title: "Narxlarni o'zgartirish",
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => const EditPricePageAdmin(),
                ),
              );
            },
          ),
           tile(
            title: "Mijoz qo'shish",
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => const AddCustomerPage(),
                ),
              );
            },
          ),
          tile(
            title: "Xodim qo'shish",
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => const AddEmployeePageAdmin(),
                ),
              );
            },
          ),
          tile(
            title: "Xodimlarning natijalari",
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => const AdminEmployeeStatsPage(),
                ),
              );
            },
          ),
          tile(
            title: "Xodimlar davomati",
            onTap: () {
              showDialog(
                  context: context,
                  builder: (context) {
                    return const AlertDialog(
                      content: Text("Yaqinda Qo'shiladi!"),
                    );
                  });
            },
          ),
        ],
      ),
    );
  }

  Widget tile({
    required String title,
    required void Function() onTap,
  }) =>
      ListTile(
        onTap: onTap,
        leading: const Icon(
          Icons.info_outline,
          color: Colors.white,
          size: 20,
        ),
        title: Text(
          title,
          style: const TextStyle(
            color: Colors.white,
          ),
        ),
        trailing: const Icon(
          Icons.arrow_forward_ios,
          color: Colors.white70,
          size: 20,
        ),
      );
}
