import 'package:flutter/material.dart';
import 'package:master_brother/src/ui/widgets/helper_widgets/app_employee_tile.dart';

class AdminEmployeeStatsPage extends StatelessWidget {
  const AdminEmployeeStatsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Xodimlar"),
      ),
      body: ListView.builder(
        itemCount: 12,
        itemBuilder: (context, index) {
          return const EmployeeCard(
            job: "Employee Job",
            title: "Employe Name",
          );
        },
      ),
    );
  }
}

