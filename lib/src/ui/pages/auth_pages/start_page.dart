// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:master_brother/src/data/local/local_db_services.dart';
import 'package:master_brother/src/ui/pages/admin_pages/pages/admin_page.dart';
import 'package:master_brother/src/ui/pages/auth_pages/login_page.dart';
import 'package:master_brother/src/ui/pages/creator_pages/creator_page.dart';
import 'package:master_brother/src/ui/pages/director_pages/director_home.dart';
import 'package:master_brother/src/ui/pages/sclader_pages/sclader_home_page.dart';
import 'package:master_brother/src/ui/pages/seller_pages/seller_page_home.dart';
import 'package:master_brother/src/utils/constants/assets_paths.dart';
import 'package:master_brother/src/utils/constants/employees.dart';

class StartPage extends StatefulWidget {
  const StartPage({super.key});

  @override
  State<StartPage> createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
  Future<void> check() async {
    final model = await LocalDB().getUserFromLocal();
    if (model != null) {
      if (model.type == type(EmployeeType.DIRECTOR).id) {
        Navigator.pushReplacementNamed(context, DirectorHome.id);
      } else if (model.type == type(EmployeeType.ADMIN).id) {
        Navigator.pushReplacementNamed(context, AdiminPage.id);
      } else if (model.type == type(EmployeeType.SELLER).id) {
        Navigator.pushReplacementNamed(context, SellerPage.id);
      } else if (model.type == type(EmployeeType.SCLAD).id) {
        Navigator.pushReplacementNamed(context, ScladerHomePage.id);
      } else if (model.type == type(EmployeeType.CREATOR).id) {
        Navigator.pushReplacementNamed(context, CreatorPage.id);
      }
    } else {
      Navigator.pushReplacementNamed(context, LoginPage.id);
    }
  }

  @override
  void initState() {
    super.initState();
    check();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SizedBox(
          child: Lottie.asset(
            MyAssets.constructions,
          ),
        ),
      ),
    );
  }
}
