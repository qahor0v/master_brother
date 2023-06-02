import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:master_brother/src/ui/screens/when/when_loading.dart';
import 'package:master_brother/src/ui/widgets/helper_box/sized_box.dart';
import 'package:master_brother/src/ui/widgets/helper_widgets/app_button.dart';
import 'package:master_brother/src/ui/widgets/helper_widgets/app_textfield.dart';
import 'package:master_brother/src/ui/widgets/title_text_widget.dart';
import 'package:master_brother/src/utils/methods/check_textfield.dart';

class AddCustomerPage extends HookConsumerWidget {
  const AddCustomerPage({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final phone = useState<TextEditingController>(TextEditingController());
    final addRess = useState<TextEditingController>(TextEditingController());
    final name = useState<TextEditingController>(TextEditingController());

    return Scaffold(
      appBar: AppBar(
        title: const Text("Mijoz Qo'shish"),
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
                child: TitleText(title: "Mijoz nomi", isSliver: false),
              ),
              AppTextField(
                controller: name.value,
                title: "Mijoz nomini kiriting",
              ),
              HBox(16.0),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child:
                    TitleText(title: "Mijoz telefon raqami", isSliver: false),
              ),
              AppTextField(
                controller: phone.value,
                title: "Telefon raqamni kiriting",
              ),
              HBox(16.0),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: TitleText(title: "Mijoz manzili", isSliver: false),
              ),
              AppTextField(
                controller: addRess.value,
                title: "Mijoz mnzilini kiriting",
              ),
              HBox(36.0),
              Center(
                child: AppButton(
                  title: "Qo'shish".toUpperCase(),
                  onTap: () async {
                    if (check(name) && check(phone) && check(addRess)) {
                    } else {

                    }
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
