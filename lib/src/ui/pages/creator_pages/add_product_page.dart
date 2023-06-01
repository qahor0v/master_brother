import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:master_brother/src/repo/models/product_model.dart';
import 'package:master_brother/src/ui/pages/global_pages/add_order_page.dart';
import 'package:master_brother/src/ui/widgets/helper_box/sized_box.dart';
import 'package:master_brother/src/ui/widgets/helper_widgets/app_button.dart';
import 'package:master_brother/src/ui/widgets/helper_widgets/app_textfield.dart';

class AddProductToSclad extends HookConsumerWidget {
  const AddProductToSclad({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final product = useState<ProductModel?>(null);
    final controller = useState<TextEditingController>(TextEditingController());
    return Scaffold(
      appBar: AppBar(
        title: const Text("Omborga tovar qo'shish"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SelectProduct(product: product),
            HBox(8.0),
            AppTextField(
              controller: controller.value,
              title: "Necha dona?",
              type: TextInputType.number,
            ),
            HBox(24.0),
            AppButton(title: "Qo'shish".toUpperCase(), onTap: () {}),
          ],
        ),
      ),
    );
  }
}
