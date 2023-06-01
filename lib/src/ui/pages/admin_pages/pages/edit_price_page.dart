import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:master_brother/src/utils/constants/app_colors.dart';

class EditPricePageAdmin extends StatelessWidget {
  const EditPricePageAdmin({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.8,
        title: const Text("Narxlarni o'zgartirish"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ProductPriceWidget(
              currentPrice: '129.000',
              title: "The Product Name",
              onTap: () {},
            ),
            ProductPriceWidget(
              currentPrice: '129.000',
              title: "The Product Name",
              onTap: () {},
            ),
            ProductPriceWidget(
              currentPrice: '129.000',
              title: "The Product Name",
              onTap: () {},
            ),
            ProductPriceWidget(
              currentPrice: '129.000',
              title: "The Product Name",
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}

class ProductPriceWidget extends HookWidget {
  final void Function() onTap;
  final String title;
  final String currentPrice;
  const ProductPriceWidget({
    super.key,
    required this.currentPrice,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final controller = useState<TextEditingController>(
      TextEditingController(text: currentPrice),
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
            title,
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
          Container(
            padding: const EdgeInsets.only(
              top: 12,
              bottom: 12,
              left: 40,
              right: 40,
            ),
            margin: const EdgeInsets.only(top: 16.0),
            decoration: BoxDecoration(
              color: mainColor,
              borderRadius: BorderRadius.circular(8),
            ),
            child: const Text("O'zgartirish"),
          ),
        ],
      ),
    );
  }
}
