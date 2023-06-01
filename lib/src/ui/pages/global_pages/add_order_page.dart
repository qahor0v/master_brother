import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:master_brother/src/repo/models/product_model.dart';
import 'package:master_brother/src/ui/widgets/helper_box/sized_box.dart';
import 'package:master_brother/src/ui/widgets/helper_widgets/app_button.dart';
import 'package:master_brother/src/ui/widgets/helper_widgets/app_textfield.dart';
import 'package:master_brother/src/ui/widgets/title_text_widget.dart';
import 'package:master_brother/src/utils/constants/app_colors.dart';
import 'package:master_brother/src/utils/constants/test_resources.dart';

class AddOrderPage extends HookConsumerWidget {
  const AddOrderPage({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final haveClient = useState<bool>(false);
    final phone = useState<TextEditingController>(TextEditingController());
    final addRess = useState<TextEditingController>(TextEditingController());
    final name = useState<TextEditingController>(TextEditingController());
    final product = useState<ProductModel?>(null);
    final counter = useState<int>(0);
    List<Widget> dontClient = [
      AppTextField(
        controller: name.value,
        title: "Mijoz nomini kiriting",
      ),
      HBox(16.0),
      AppTextField(
        controller: phone.value,
        title: "Telefon raqamni kiriting",
      ),
      HBox(16.0),
      AppTextField(
        controller: addRess.value,
        title: "Mijoz mnzilini kiriting",
      ),
    ];

    Widget selectClient() => Row(
          children: [
            WBox(8.0),
            const Icon(
              Icons.person,
              color: mainColor,
            ),
            WBox(8.0),
            const Text(
              "Mijozni tanlash",
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            const Spacer(),
            const Icon(
              Icons.arrow_forward_ios_sharp,
              color: Colors.white,
            ),
            WBox(8.0),
          ],
        );

    return Scaffold(
      appBar: AppBar(
        title: const Text("Yangi buyurtma qo'shish"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              HBox(8.0),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: TitleText(title: "Mijoz ma'lumotlari", isSliver: false),
              ),
              HBox(8.0),
              if (haveClient.value)
                selectClient()
              else
                ...dontClient.map((e) {
                  return e;
                }),
              HBox(16.0),
              Center(
                child: AppButton(
                  title: !haveClient.value
                      ? "Mijoz allaqachon mavjud"
                      : "Yangi mijoz bu",
                  onTap: () {
                    haveClient.value = !haveClient.value;
                  },
                ),
              ),
              HBox(16.0),
              Container(
                width: double.infinity,
                height: 1,
                decoration: BoxDecoration(
                  color: secondaryColor,
                  borderRadius: BorderRadius.circular(1),
                ),
              ),
              HBox(24.0),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: TitleText(title: "Tovar ma'lumotlari", isSliver: false),
              ),
              HBox(8.0),
              SelectProduct(product: product),
              Container(
                margin: const EdgeInsets.only(
                  left: 8.0,
                  right: 8.0,
                  top: 4.0,
                  bottom: 16.0,
                ),
                height: 1,
                color: secondaryColor,
              ),
              ListTile(
                onTap: () {
                  counter.value = 0;
                },
                leading: const Icon(
                  Icons.clear,
                  color: mainColor,
                ),
                title: const Text(
                  "Buyurma soni",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                  ),
                ),
                trailing: Text(
                  counter.value.toString(),
                  style: const TextStyle(color: mainColor, fontSize: 20),
                ),
              ),
              Row(
                children: [
                  WBox(8.0),
                  Expanded(
                    child: AppButton(
                      title: '+1',
                      onTap: () {
                        counter.value++;
                      },
                    ),
                  ),
                  WBox(8.0),
                  Expanded(
                    child: AppButton(
                      title: '+10',
                      onTap: () {
                        counter.value += 10;
                      },
                    ),
                  ),
                  WBox(8.0),
                  Expanded(
                    child: AppButton(
                      title: '+100',
                      onTap: () {
                        counter.value += 100;
                      },
                    ),
                  ),
                  WBox(8.0),
                  Expanded(
                    child: AppButton(
                      title: '+1000',
                      onTap: () {
                        counter.value += 1000;
                      },
                    ),
                  ),
                  WBox(8.0),
                ],
              ),
              HBox(8.0),
              Row(
                children: [
                  WBox(8.0),
                  Expanded(
                    child: AppButton(
                      title: '-1',
                      onTap: () {
                        if (counter.value > 0) {
                          counter.value--;
                        }
                      },
                    ),
                  ),
                  WBox(8.0),
                  Expanded(
                    child: AppButton(
                      title: '-10',
                      onTap: () {
                        if (counter.value > 10) {
                          counter.value -= 10;
                        }
                      },
                    ),
                  ),
                  WBox(8.0),
                  Expanded(
                    child: AppButton(
                      title: '-100',
                      onTap: () {
                        if (counter.value > 100) {
                          counter.value -= 100;
                        }
                      },
                    ),
                  ),
                  WBox(8.0),
                  Expanded(
                    child: AppButton(
                      title: '-1000',
                      onTap: () {
                        if (counter.value > 1000) {
                          counter.value -= 1000;
                        }
                      },
                    ),
                  ),
                  WBox(8.0),
                ],
              ),
              HBox(16.0),
              AppTextField(
                controller: TextEditingController(),
                title: "To'lov summasini kiriting",
                type: TextInputType.number,
              ),
              SwitchListTile(
                activeColor: mainColor,
                value: true,
                onChanged: (value) {},
                title: const Text(
                  "Qarzga Yozish",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
              HBox(32.0),
              Center(
                child: AppButton(
                  title: "Buyurtmani Qo'shish".toUpperCase(),
                  onTap: () {},
                ),
              ),
              HBox(32.0),
            ],
          ),
        ),
      ),
    );
  }
}

class SelectProduct extends StatelessWidget {
  final ValueNotifier<ProductModel?> product;

  const SelectProduct({
    Key? key,
    required this.product,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap(product, context);
      },
      child: ListTile(
        title: Text(
          product.value == null ? "Tovarni tanlang" : product.value!.name,
          style: const TextStyle(color: Colors.white, fontSize: 16),
          maxLines: 1,
        ),
        leading: const Icon(
          Icons.format_color_fill_outlined,
          color: Colors.white,
        ),
        trailing: const Icon(
          Icons.arrow_drop_down_circle_outlined,
          color: Colors.white,
        ),
      ),
    );
  }

  void onTap(ValueNotifier<ProductModel?> product, BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          child: Container(
            padding: const EdgeInsets.all(8.0),
            color: kBgColor,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: TestSources.products.map((e) {
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
    );
  }
}
