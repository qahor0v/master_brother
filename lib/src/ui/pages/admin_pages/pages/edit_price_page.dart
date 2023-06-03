import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:master_brother/src/repo/models/product_model.dart';
import 'package:master_brother/src/repo/providers/product_providers.dart';
import 'package:master_brother/src/ui/screens/when/when_error.dart';
import 'package:master_brother/src/ui/screens/when/when_loading.dart';
import 'package:master_brother/src/ui/widgets/product_price_edit_widget.dart';
import 'package:master_brother/src/utils/constants/app_colors.dart';

class EditPricePageAdmin extends HookConsumerWidget {
  const EditPricePageAdmin({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final all = ref.watch(getAllProductsProvider);
    return Scaffold(
      appBar: AppBar(
        elevation: 0.8,
        title: const Text("Narxlarni o'zgartirish"),
      ),
      body: all.when(
        data: (data) {
          return SingleChildScrollView(
            child: Column(
              children: [
                ...List<Widget>.generate(data.length, (index) {
                  return ProductPriceWidget(
                    product: data[index],
                  );
                }),
              ],
            ),
          );
        },
        error: (e, m) {
          log("Error: ", error: e, stackTrace: m);
          return WhenError();
        },
        loading: () => WhenLoading(),
      ),
    );
  }
}
