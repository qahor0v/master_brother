import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:master_brother/src/data/remote/reserve_services.dart';
import 'package:master_brother/src/repo/models/product_model.dart';
import 'package:master_brother/src/repo/models/reserved_product_model.dart';
import 'package:master_brother/src/repo/providers/local_user_provider.dart';
import 'package:master_brother/src/repo/providers/reserve_providers.dart';
import 'package:master_brother/src/ui/pages/global_pages/add_order_page.dart';
import 'package:master_brother/src/ui/pages/sclader_pages/sclader_home_page.dart';
import 'package:master_brother/src/ui/widgets/helper_box/sized_box.dart';
import 'package:master_brother/src/ui/widgets/helper_widgets/app_button.dart';
import 'package:master_brother/src/ui/widgets/helper_widgets/app_textfield.dart';
import 'package:master_brother/src/ui/widgets/toast/main.dart';
import 'package:master_brother/src/utils/extensions/date_time.dart';
import 'package:master_brother/src/utils/methods/navigators.dart';

class GetProductFromSclad extends HookConsumerWidget {
  const GetProductFromSclad({super.key});

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
            AppButton(
              title: "Qo'shish".toUpperCase(),
              onTap: () async {
                if (controller.value.text.isNotEmpty && product.value != null) {
                  try {
                    await Reserve.addToReserve(
                      ReserveProductModel(
                        productID: product.value!.id,
                        count: int.parse(controller.value.text.trim()),
                        productName: product.value!.name,
                        addedTime: Time.getNow(),
                        employeeID: ref.watch(localUser)!.login,
                      ),
                    ).then((value) {
                      ScaffoldMessage.success(context, message: "Qo'shildi!");
                      pop(context);
                      ref.refresh(getAllReservedProductsProvider);
                      Navigator.pushReplacementNamed(
                        context,
                        ScladerHomePage.id,
                      );
                    });
                  } catch (e) {
                    log("Error in adding to reserve: ", error: e);
                  }
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
