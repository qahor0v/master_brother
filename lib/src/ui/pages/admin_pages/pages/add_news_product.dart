import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:lottie/lottie.dart';
import 'package:master_brother/src/data/remote/firestore_services.dart';
import 'package:master_brother/src/repo/models/product_model.dart';
import 'package:master_brother/src/ui/widgets/helper_box/sized_box.dart';
import 'package:master_brother/src/ui/widgets/helper_widgets/app_button.dart';
import 'package:master_brother/src/ui/widgets/helper_widgets/app_textfield.dart';
import 'package:master_brother/src/utils/constants/app_colors.dart';
import 'package:master_brother/src/utils/constants/assets_paths.dart';


class AddNewProductPage extends HookConsumerWidget {
  const AddNewProductPage({super.key});

  @override
  Widget build(BuildContext context, ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Barcha tovarlar"),
      ),
      body: FutureBuilder(
        future: ProductServices.getAllProducts(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Lottie.asset(MyAssets.loading);
          } else if (snapshot.hasError) {
            return Lottie.asset(MyAssets.error);
          } else if (snapshot.hasData) {
            final data = snapshot.data ?? [];
            return ListView.builder(
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(data[index].name),
                );
              },
              itemCount: data.length,
            );
          }
          return HBox(0.0);
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
