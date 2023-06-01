import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:lottie/lottie.dart';
import 'package:master_brother/src/repo/providers/employee_providers.dart';
import 'package:master_brother/src/ui/pages/global_pages/add_worder.dart';
import 'package:master_brother/src/ui/widgets/helper_box/sized_box.dart';
import 'package:master_brother/src/ui/widgets/helper_widgets/app_employee_tile.dart';
import 'package:master_brother/src/utils/constants/app_colors.dart';
import 'package:master_brother/src/utils/constants/assets_paths.dart';
import 'package:master_brother/src/utils/constants/employees.dart';

class WorkersPage extends StatefulHookConsumerWidget {
  const WorkersPage({super.key});

  @override
  ConsumerState<WorkersPage> createState() => _WorkersPageState();
}

class _WorkersPageState extends ConsumerState<WorkersPage> {
  @override
  Widget build(BuildContext context) {
    final alls = ref.watch(getAllEmployeesProvider);
    return Scaffold(
      appBar: AppBar(
        elevation: 0.8,
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
            return Lottie.asset(MyAssets.error);
          },
          loading: () {
            return Lottie.asset(MyAssets.loading);
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: mainColor,
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const AddWorkerPage(),
            ),
          );
        },
        child: const Icon(
          Icons.add,
          color: bgColor,
          size: 32,
        ),
      ),
    );
  }
}
