import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:master_brother/src/data/local/local_db_services.dart';
import 'package:master_brother/src/ui/pages/auth_pages/start_page.dart';
import 'package:master_brother/src/ui/pages/global_pages/add_order_page.dart';
import 'package:master_brother/src/ui/pages/global_pages/add_worder.dart';
import 'package:master_brother/src/ui/widgets/helper_box/sized_box.dart';
import 'package:master_brother/src/ui/widgets/toast/main.dart';
import 'package:master_brother/src/utils/methods/navigators.dart';

class EditsPage extends StatefulHookConsumerWidget {
  const EditsPage({super.key});

  @override
  ConsumerState<EditsPage> createState() => _EditsPageState();
}

class _EditsPageState extends ConsumerState<EditsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Boshqaruv"),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              myTile("Buyurtma qo'shish", () {
                goTo(context, const AddOrderPage());
              }),
              myTile("Ishchi qo'shish", () {
                goTo(context, const AddWorkerPage());
              }),
              myTile(
                "Ishchini o'chirish",
                () {},
                icon: Icons.delete_outline,
              ),
              myTile("Tovar qo'shish", () {}),
              myTile(
                "Tovar narxini o'zgartirish",
                () {},
                icon: Icons.edit_note_rounded,
              ),
              myTile(
                "Xodimlar davomati",
                () {
                  ScaffoldMessage.info(context, message: "Yaqinda Qo'shiladi");
                },
                icon: Icons.done_all,
              ),
              HBox(40.0),
              myTile("Chiqish", () async {
                await LocalDB().logout().then((value) {
                  Navigator.pushReplacementNamed(context, StartPage.id);
                });
              }, icon: Icons.logout),
            ],
          ),
        ));
  }

  Widget myTile(String title, void Function() onTap, {IconData? icon}) {
    return ListTile(
      leading: Icon(
        icon ?? Icons.add_rounded,
        color: Colors.white,
      ),
      title: Text(
        title,
        style: const TextStyle(
          color: Colors.white,
        ),
      ),
      trailing: const Icon(
        Icons.arrow_forward_ios,
        color: Colors.white,
      ),
      onTap: onTap,
    );
  }
}
