import 'package:flutter/material.dart';
import 'package:master_brother/src/ui/pages/sclader_pages/get_product_page.dart';
import 'package:master_brother/src/utils/constants/app_colors.dart';


class ScladerHomePage extends StatelessWidget {
  static const String id = 'sclader1';
  const ScladerHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Omborxona"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => const GetProductFromSclad(),
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
