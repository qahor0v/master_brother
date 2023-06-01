import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:master_brother/src/repo/models/product_model.dart';
import 'package:master_brother/src/repo/providers/product_providers.dart';
import 'package:master_brother/src/ui/screens/when/when_error.dart';
import 'package:master_brother/src/ui/screens/when/when_loading.dart';
import 'package:master_brother/src/utils/constants/app_colors.dart';

class ProductDialogListWidget extends HookConsumerWidget {
  final ValueNotifier<ProductModel?> product;

  const ProductDialogListWidget({
    Key? key,
    required this.product,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    final all = ref.watch(getAllProductsProvider);
    return Dialog(
      backgroundColor: kBgColor,
      child: all.when(
        data: (data) {
          return Container(
            padding: const EdgeInsets.all(8.0),
            color: kBgColor,
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: data.map((e) {
                  return ListTile(
                    leading: const Icon(
                      Icons.format_color_fill_rounded,
                      color: Colors.white,
                    ),
                    title: Text(
                      e.name,
                      style: const TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    subtitle: Text(
                      "${e.price} so'm/dona",
                      style:
                          const TextStyle(color: Colors.white70, fontSize: 12),
                    ),
                    onTap: () {
                      product.value = e;
                      Navigator.pop(context);
                    },
                  );
                }).toList(),
              ),
            ),
          );
        },
        error: (e, m) {
          return WhenError();
        },
        loading: () {
          return WhenLoading();
        },
      ),
    );
  }
}
