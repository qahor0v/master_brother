// ignore_for_file: unused_result

import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:lottie/lottie.dart';
import 'package:master_brother/src/repo/providers/employee_providers.dart';
import 'package:master_brother/src/utils/constants/app_colors.dart';
import 'package:master_brother/src/utils/constants/assets_paths.dart';
import 'package:master_brother/src/repo/models/employee_model.dart';


class AddEmployeeLoadingWidget extends HookConsumerWidget {
  final EmployeeModel model;
  const AddEmployeeLoadingWidget({
    super.key,
    required this.model,
  });

  @override
  Widget build(BuildContext context, ref) {
    final result = ref.watch(addEmployee(model));
    return Dialog(
      backgroundColor: Colors.transparent,
      child: result.when(
        data: (data) {
          log("$data");
          if (data) {
            ref.refresh(getAllEmployeesProvider);
            Future.delayed(const Duration(seconds: 2), () {
              Navigator.pop(context);
            }).then((value) {
              Navigator.pop(context);
            });
            return Lottie.asset(MyAssets.done);
          } else {
            return Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: kBgColor,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                  color: Colors.redAccent,
                ),
              ),
              child: const Text(
                "Bunday xodim allaqachon mavjud. Iltimos, boshqa login bilan urinib ko'ring!",
                style: TextStyle(
                  color: Colors.white,
                ),
                textAlign: TextAlign.center,
              ),
            );
          }
        },
        error: (e, m) {
          log("$e", error: e, stackTrace: m);
          return Lottie.asset(MyAssets.error);
        },
        loading: () {
          return Lottie.asset(MyAssets.loading);
        },
      ),
    );
  }
}
