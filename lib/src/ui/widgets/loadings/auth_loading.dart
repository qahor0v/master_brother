import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:lottie/lottie.dart';
import 'package:master_brother/src/repo/providers/employee_providers.dart';
import 'package:master_brother/src/ui/pages/admin_pages/pages/admin_page.dart';
import 'package:master_brother/src/ui/pages/creator_pages/creator_page.dart';
import 'package:master_brother/src/ui/pages/director_pages/director_home.dart';
import 'package:master_brother/src/ui/pages/sclader_pages/sclader_home_page.dart';
import 'package:master_brother/src/ui/pages/seller_pages/seller_page_home.dart';
import 'package:master_brother/src/utils/constants/app_colors.dart';
import 'package:master_brother/src/utils/constants/assets_paths.dart';
import 'package:master_brother/src/utils/constants/employee_model.dart';
import 'package:master_brother/src/utils/constants/employees.dart';


class AuthLoadingWidget extends HookConsumerWidget {
  final EmployeeModel model;
  const AuthLoadingWidget({super.key, required this.model});

  @override
  Widget build(BuildContext context, ref) {
    final result = ref.watch(authProvider(model));
    return Dialog(
      backgroundColor: Colors.transparent,
      child: result.when(
        data: (data) {
          log("$data");
          if (data) {
            Future.delayed(const Duration(seconds: 2), () {
              if (model.type == type(EmployeeType.DIRECTOR).id) {
                Navigator.pop(context);
                Navigator.pushReplacementNamed(context, DirectorHome.id);
              } else if (model.type == type(EmployeeType.ADMIN).id) {
                Navigator.pop(context);
                Navigator.pushReplacementNamed(context, AdiminPage.id);
              } else if (model.type == type(EmployeeType.SELLER).id) {
                Navigator.pop(context);
                Navigator.pushReplacementNamed(context, SellerPage.id);
              } else if (model.type == type(EmployeeType.SCLAD).id) {
                Navigator.pop(context);
                Navigator.pushReplacementNamed(context, ScladerHomePage.id);
              } else if (model.type == type(EmployeeType.CREATOR).id) {
                Navigator.pop(context);
                Navigator.pushReplacementNamed(context, CreatorPage.id);
              }
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
                "Bunday fordalanuvchi topilmadi. Login yoki parolni tekshirib qaytadan urinib ko'ring!",
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
