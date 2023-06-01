import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:master_brother/src/ui/screens/when/when_error.dart';
import 'package:master_brother/src/ui/screens/when/when_loading.dart';
import 'package:master_brother/src/ui/widgets/helper_box/sized_box.dart';
import 'package:master_brother/src/ui/widgets/helper_widgets/app_employee_tile.dart';
import 'package:master_brother/src/utils/constants/employees.dart';

import '../../../../repo/providers/employee_providers.dart';

class AdminEmployeeStatsPage extends HookConsumerWidget {
  const AdminEmployeeStatsPage({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final alls = ref.watch(getAllEmployeesProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Xodimlar"),
      ),
      body: Padding(
        padding: const EdgeInsets.only(
          left: 8.0,
          right: 8.0,
        ),
        child: alls.when(
          data: (data) {
            return CustomScrollView(
              slivers: [
                SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (context, index) {
                      if (data[index].type != "main") {
                        return EmployeeCard(
                          title: data[index].login,
                          job: type(
                            employe(
                              Employee(
                                name: data[index].login,
                                id: data[index].type,
                              ),
                            ),
                          ).name,
                        );
                      } else {
                        return WBox(0.0);
                      }
                    },
                    childCount: data.length,
                  ),
                ),
              ],
            );
          },
          error: (e, m) {
            return WhenError();
          },
          loading: () {
            return WhenLoading();
          },
        ),
      ),
    );
  }
}
