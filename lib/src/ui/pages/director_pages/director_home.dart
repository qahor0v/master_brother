import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:iconly/iconly.dart';
import 'package:master_brother/src/ui/pages/director_pages/navbar/edits_pag.dart';
import 'package:master_brother/src/ui/pages/director_pages/navbar/home_page.dart';
import 'package:master_brother/src/ui/pages/director_pages/navbar/stats_page.dart';
import 'package:master_brother/src/ui/pages/director_pages/navbar/workers_page.dart';
import 'package:master_brother/src/utils/constants/app_colors.dart';

class DirectorHome extends HookConsumerWidget {
  static const String id = "d13";
  const DirectorHome({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final controller = useState<PageController>(PageController());
    final currentIndex = useState<int>(0);
    return Scaffold(
      body: PageView(
        onPageChanged: (int i) {
          currentIndex.value = i;
        },
        controller: controller.value,
        children: const [
          DirectorHomePage(),
          WorkersPage(),
          StatsPage(),
          EditsPage()
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex.value,
        selectedIconTheme: const IconThemeData(color: mainColor),
        backgroundColor: kBgColor,
        onTap: (int index) {
          currentIndex.value = index;
          controller.value.jumpToPage(index);
        },
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: const [
          BottomNavigationBarItem(
            backgroundColor: Colors.transparent,
            icon: Icon(
              IconlyLight.home,
            ),
            label: "",
          ),
          BottomNavigationBarItem(
            backgroundColor: Colors.transparent,
            icon: Icon(
              IconlyLight.user_1,
            ),
            label: "",
          ),
          BottomNavigationBarItem(
            backgroundColor: Colors.transparent,
            icon: Icon(
              IconlyLight.activity,
            ),
            label: "",
          ),
          BottomNavigationBarItem(
            backgroundColor: Colors.transparent,
            icon: Icon(
              IconlyLight.lock,
            ),
            label: "",
          ),
        ],
      ),
    );
  }
}
