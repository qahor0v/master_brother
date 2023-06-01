import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:lottie/lottie.dart';
import 'package:master_brother/src/data/remote/product_services.dart';
import 'package:master_brother/src/repo/models/product_model.dart';
import 'package:master_brother/src/repo/providers/product_providers.dart';
import 'package:master_brother/src/ui/widgets/helper_box/sized_box.dart';
import 'package:master_brother/src/ui/widgets/helper_widgets/app_button.dart';
import 'package:master_brother/src/ui/widgets/helper_widgets/app_textfield.dart';
import 'package:master_brother/src/utils/constants/assets_paths.dart';

class ProductAdderpage extends HookConsumerWidget {
  const ProductAdderpage({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final name = useTextEditingController();
    final price = useTextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Yangi tovar qo'shish"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              AppTextField(
                controller: name,
                title: "Tovar nomi",
              ),
              HBox(16.0),
              AppTextField(
                controller: price,
                title: "Tovar narxi",
                type: TextInputType.number,
              ),
              HBox(16.0),
              AppButton(
                title: "Ba'zaga Qo'shish",
                onTap: () async {
                  if (name.text.trim().isNotEmpty &&
                      price.text.trim().isNotEmpty) {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return Lottie.asset(MyAssets.loading);
                      },
                    );

                    ProductServices.addNewProduct(
                      ProductModel(
                        name: name.text.trim(),
                        id: name.text.toLowerCase().trim(),
                        price: int.parse(
                          price.text.trim(),
                        ),
                      ),
                    ).then((value) {
                      Navigator.pop(context);
                      showDialog(
                        context: context,
                        builder: (context) {
                          Future.delayed(const Duration(milliseconds: 1200),
                              () {
                            Navigator.pop(context);
                            Navigator.pop(context);
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text("Qo'shildi!"),
                              ),
                            );
                            ref.refresh(getAllProductsProvider);
                          });
                          return Lottie.asset(MyAssets.done);
                        },
                      );
                    });
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text("Maydonni to'ldiring, iltimos!"),
                      ),
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
