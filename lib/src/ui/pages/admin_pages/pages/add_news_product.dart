import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:lottie/lottie.dart';
import 'package:master_brother/src/repo/providers/product_providers.dart';
import 'package:master_brother/src/ui/pages/global_pages/product_adder.dart';
import 'package:master_brother/src/utils/constants/app_colors.dart';
import 'package:master_brother/src/utils/constants/assets_paths.dart';

class AddNewProductPage extends HookConsumerWidget {
  const AddNewProductPage({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final all = ref.watch(getAllProductsProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Barcha tovarlar"),
      ),
      body: all.when(
        data: (data) {
          return ListView.builder(
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(data[index].name),
              );
            },
            itemCount: data.length,
          );
        },
        error: (e, m) {
          return Lottie.asset(MyAssets.error);
        },
        loading: () {
          return Lottie.asset(MyAssets.loading);
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: mainColor,
        child: const Icon(
          Icons.add,
          color: bgColor,
          size: 32,
        ),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => const ProductAdderpage(),
            ),
          );
        },
      ),
    );
  }
}
