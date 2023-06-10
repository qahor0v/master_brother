import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:master_brother/src/data/local/local_db_services.dart';
import 'package:master_brother/src/repo/providers/reserve_providers.dart';
import 'package:master_brother/src/ui/pages/auth_pages/start_page.dart';
 import 'package:master_brother/src/ui/pages/sclader_pages/get_product_page.dart';
import 'package:master_brother/src/ui/screens/when/when_error.dart';
import 'package:master_brother/src/ui/screens/when/when_loading.dart';
import 'package:master_brother/src/utils/constants/app_colors.dart';

class CreatorPage extends HookConsumerWidget {
  static const String id = 'id1223';

  const CreatorPage({super.key});

  @override
  Widget build(BuildContext context, ref) {
    return Scaffold(
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
        title: const Text("Ishlab chiqarish"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ref.watch(getAllReservedProductsProvider).when(
          data: (data) {
            return ListView.builder(
              itemCount: data.length,
              itemBuilder: (context, index) {
                final item = data[index];
                return ListTile(
                  title: Text(
                    item.name,
                    style: const TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  subtitle: Text(
                    "${item.count} dona mavjud",
                    style: const TextStyle(
                      color: Colors.white,
                    ),
                  ),
                );
              },
            );
          },
          error: (e, m) {
            return WhenError();
          },
          loading: () => WhenLoading(),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => const GetProductFromSclad(),
            ),
          );
        },
        backgroundColor: mainColor,
        child: const Icon(
          Icons.add,
          color: bgColor,
          size: 32,
        ),
      ),
    );
  }
}
