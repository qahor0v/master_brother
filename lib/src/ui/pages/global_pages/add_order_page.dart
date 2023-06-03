import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:master_brother/src/data/remote/order_services.dart';
import 'package:master_brother/src/repo/models/customer_model.dart';
import 'package:master_brother/src/repo/models/order_model.dart';
import 'package:master_brother/src/repo/models/product_model.dart';
import 'package:master_brother/src/repo/providers/customer_providers.dart';
import 'package:master_brother/src/repo/providers/local_user_provider.dart';
import 'package:master_brother/src/repo/providers/order_providers.dart';
import 'package:master_brother/src/ui/screens/global_screens/product_list_builder.dart';
import 'package:master_brother/src/ui/screens/search_screens/search_bar.dart';
import 'package:master_brother/src/ui/widgets/helper_box/sized_box.dart';
import 'package:master_brother/src/ui/widgets/helper_widgets/app_button.dart';
import 'package:master_brother/src/ui/widgets/helper_widgets/app_textfield.dart';
import 'package:master_brother/src/ui/widgets/title_text_widget.dart';
import 'package:master_brother/src/ui/widgets/toast/main.dart';
import 'package:master_brother/src/utils/constants/app_colors.dart';
import 'package:master_brother/src/utils/extensions/date_time.dart';
import 'package:master_brother/src/utils/extensions/order_status.dart';
import 'package:master_brother/src/utils/extensions/payment_status.dart';
import 'package:master_brother/src/utils/methods/id_generator.dart';

class AddOrderPage extends HookConsumerWidget {
  const AddOrderPage({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final allClients = ref.watch(getAllCustomers);
    final haveClient = useState<bool>(true);
    final phone = useState<TextEditingController>(TextEditingController());
    final addRess = useState<TextEditingController>(TextEditingController());
    final name = useState<TextEditingController>(TextEditingController());
    final summa = useState<TextEditingController>(TextEditingController());
    final count = useState<TextEditingController>(TextEditingController());
    final product = useState<ProductModel?>(null);
    final selectedCustomer = useState<CustomerModel?>(null);
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

    Widget selectClient(
      List<CustomerModel> customers,
      ValueNotifier<CustomerModel?> selected,
    ) =>
        GestureDetector(
          onTap: () {
            showSearch(
              context: context,
              delegate: CustomSearchDelegate(
                customers: customers,
                selected: selected,
              ),
            );
          },
          child: Row(
            children: [
              WBox(8.0),
              const Icon(
                Icons.person,
                color: mainColor,
              ),
              WBox(8.0),
              Expanded(
                child: Text(
                  selectedCustomer.value == null
                      ? "Mijozni tanlash"
                      : selectedCustomer.value!.name,
                  maxLines: 1,
                  style: const TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
              const Spacer(),
              WBox(8.0),
              Text(
                selectedCustomer.value == null ? " " : "Boshqa Mijoz",
                style: const TextStyle(
                  color: Colors.white70,
                  fontSize: 12,
                ),
              ),
              const Icon(
                Icons.arrow_forward_ios_sharp,
                color: Colors.white70,
              ),
              WBox(8.0),
            ],
          ),
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
                allClients.when(
                  data: (data) {
                    return selectClient(data, selectedCustomer);
                  },
                  error: (e, m) {
                    return const Text("Xatolik");
                  },
                  loading: () {
                    return const Center(
                      child: CircularProgressIndicator(color: mainColor),
                    );
                  },
                )
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
              HBox(16.0),
              AppTextField(
                controller: count.value,
                title: "Buyurtma qiligan tovar soni",
                type: TextInputType.number,
              ),
              HBox(16.0),
              AppTextField(
                controller: summa.value,
                title: "To'langan summani kiriting",
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
                  onTap: () async {
                    try {
                      Order.addOrder(
                        context,
                        OrderModel(
                          id: generateID(),
                          createTime: Time.getNow(),
                          customerID: selectedCustomer.value == null
                              ? name.value.text.trim()
                              : selectedCustomer.value!.id,
                          customerName: selectedCustomer.value!.name,
                          sellerID: ref.watch(localUser)!.login,
                          productCount: int.parse(count.value.text.trim()),
                          paidSumma: int.parse(summa.value.text.trim()),
                          productID: product.value!.id,
                          productName: product.value!.name,
                          productPrice: int.parse(product.value!.price),
                          paymentStatus: paymentStatus(
                            price: product.value!.price,
                            payed: summa.value.text.trim(),
                            count: int.parse(count.value.text.trim()),
                          ),
                          orderStatus: OrderStatus.progress,
                        ),
                      ).then((value){
                        ref.refresh(getAllOrdersProvider);
                      });
                    } catch (e) {
                      ScaffoldMessage.error(
                        context,
                        message:
                            "Qandaydir xatolik mavjud. Iltimos, ma'lumotlarni tekshirib qaytadan urinib ko'ring!",
                      );
                    }
                  },
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

class SelectProduct extends HookConsumerWidget {
  final ValueNotifier<ProductModel?> product;

  const SelectProduct({
    Key? key,
    required this.product,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    return GestureDetector(
      onTap: () {
        onTap(product, context, ref);
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

  void onTap(ValueNotifier<ProductModel?> product, BuildContext context,
      WidgetRef ref) {
    showDialog(
      context: context,
      builder: (context) {
        return ProductDialogListWidget(product: product);
      },
    );
  }
}
