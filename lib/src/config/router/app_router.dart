import 'package:flutter/material.dart';
import 'package:master_brother/src/ui/pages/admin_pages/pages/admin_page.dart';
import 'package:master_brother/src/ui/pages/auth_pages/login_page.dart';
import 'package:master_brother/src/ui/pages/auth_pages/start_page.dart';
import 'package:master_brother/src/ui/pages/creator_pages/creator_page.dart';
import 'package:master_brother/src/ui/pages/director_pages/director_home.dart';
import 'package:master_brother/src/ui/pages/sclader_pages/sclader_home_page.dart';
import 'package:master_brother/src/ui/pages/seller_pages/seller_page_home.dart';

class AppRouter {
  static Map<String, Widget Function(BuildContext)> router(context) => {
        DirectorHome.id: (context) => const DirectorHome(),
        LoginPage.id: (context) => const LoginPage(),
        ScladerHomePage.id: (context) => const ScladerHomePage(),
        AdiminPage.id: (context) => const AdiminPage(),
        CreatorPage.id: (context) => const CreatorPage(),
        SellerPage.id: (context) => const SellerPage(),
        StartPage.id: (context) => const StartPage(),
      };
}
