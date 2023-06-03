import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:master_brother/src/data/remote/product_services.dart';
import 'package:master_brother/src/repo/models/product_model.dart';
import 'package:master_brother/src/repo/providers/product_providers.dart';
import 'package:master_brother/src/ui/widgets/helper_widgets/app_button.dart';
import 'package:master_brother/src/ui/widgets/loadings/dialog_loading.dart';
import 'package:master_brother/src/ui/widgets/toast/main.dart';
import 'package:master_brother/src/utils/constants/app_colors.dart';
import 'package:master_brother/src/utils/methods/check_textfield.dart';
import 'package:master_brother/src/utils/methods/navigators.dart';

class ProductPriceWidget extends HookConsumerWidget {
  final ProductModel product;

  const ProductPriceWidget({
    super.key,
    required this.product,
  });

  @override
  Widget build(BuildContext context, ref) {
    final controller = useState<TextEditingController>(
      TextEditingController(text: product.price),
    );
    return Container(
      margin: const EdgeInsets.only(
        top: 8,
        bottom: 24.0,
        left: 8.0,
        right: 8.0,
      ),
      padding: const EdgeInsets.all(12.0),
      child: Column(
        children: [
          Text(
            product.name,
            style: const TextStyle(
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 0.0),
          Container(
            margin: const EdgeInsets.only(top: 8.0),
            padding: const EdgeInsets.only(left: 8, right: 8),
            decoration: BoxDecoration(
              border: Border.all(
                color: mainColor,
              ),
              borderRadius: BorderRadius.circular(8),
            ),
            child: TextField(
              cursorColor: mainColor,
              decoration: const InputDecoration(border: InputBorder.none),
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w400,
              ),
              controller: controller.value,
              keyboardType: TextInputType.number,
            ),
          ),
          AppButton(
            title: "O'zgartirish",
            onTap: () async {
              if (check(controller)) {
                loadingDialog(context);
                await ProductServices.editPrice(
                  product,
                  controller.value.text.trim(),
                ).then((value) {
                  pop(context);
                  ScaffoldMessage.success(context, message: "O'zgartirildi!");
                  ref.refresh(getAllProductsProvider);
                });
              } else {
                ScaffoldMessage.error(
                  context,
                  message: "Iltimos, narxni kiriting!",
                );
              }
            },
          ),
        ],
      ),
    );
  }
}
