import 'package:flutter/material.dart';
import 'package:master_brother/src/ui/pages/global_pages/add_worder.dart';

class AddEmployeePageAdmin extends StatelessWidget {
  const AddEmployeePageAdmin({super.key});

  @override
  Widget build(BuildContext context) {
    return const AddWorkerPage(isAdmin: true);
  }
}
