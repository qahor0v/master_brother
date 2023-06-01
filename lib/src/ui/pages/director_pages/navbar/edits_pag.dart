import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:master_brother/src/data/local/local_db_services.dart';
import 'package:master_brother/src/ui/widgets/helper_widgets/app_button.dart';

class EditsPage extends StatefulHookConsumerWidget {
  const EditsPage({super.key});

  @override
  ConsumerState<EditsPage> createState() => _EditsPageState();
}

class _EditsPageState extends ConsumerState<EditsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: AppButton(
          onTap: () async {
            await LocalDB().logout().then((value) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(value ? "Successfully logout" : "Error"),
                ),
              );
            });
          },
          title: 'Log out',
        ),
      ),
    );
  }
}
