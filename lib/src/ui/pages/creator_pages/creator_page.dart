import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:master_brother/src/ui/pages/creator_pages/add_product_page.dart';
import 'package:master_brother/src/utils/constants/app_colors.dart';

class CreatorPage extends HookConsumerWidget {
  static const String id = 'id1223';

  const CreatorPage({super.key});

  @override
  Widget build(BuildContext context, ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Ishlab chiqarish"),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return ListTile();
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => const AddProductToSclad(),
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
