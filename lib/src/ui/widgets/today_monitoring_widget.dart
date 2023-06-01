import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iconly/iconly.dart';
import 'package:master_brother/src/ui/widgets/helper_box/sized_box.dart';

class TodayMonitoringWidgetDirector extends ConsumerWidget {
  const TodayMonitoringWidgetDirector({super.key});

  @override
  Widget build(BuildContext context, ref) {
    return SliverToBoxAdapter(
      child: Container(
        padding: const EdgeInsets.all(12.0),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.green.shade900,
              Colors.greenAccent.shade700,
            ],
            begin: Alignment.topLeft,
            tileMode: TileMode.mirror,
          ),
          borderRadius: BorderRadius.circular(8.0),
        ),
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  IconlyLight.shield_done,
                  color: Colors.blue.shade600,
                ),
                WBox(8.0),
                const Text(
                  "Bajarilgan buyurtmalar",
                  style: TextStyle(color: Colors.white),
                ),
                const Spacer(),
                Text(
                  "319",
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.blue.shade800,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const Text(
                  " ta",
                  style: TextStyle(color: Colors.white),
                ),
              ],
            ),
            HBox(12.0),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Icon(
                  IconlyLight.close_square,
                  color: Colors.redAccent,
                ),
                WBox(8.0),
                const Text(
                  "Bekor qilinganlar",
                  style: TextStyle(color: Colors.white),
                ),
                const Spacer(),
                Text(
                  "21",
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.red.shade500,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const Text(
                  " ta",
                  style: TextStyle(color: Colors.white),
                ),
              ],
            ),
            HBox(12.0),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Icon(
                  IconlyLight.time_circle,
                  color: Colors.yellowAccent,
                ),
                WBox(8.0),
                const Text(
                  "Kutilayotgan buyurtmalar",
                  style: TextStyle(color: Colors.white),
                ),
                const Spacer(),
                Text(
                  "73",
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.yellow.shade600,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const Text(
                  " ta",
                  style: TextStyle(color: Colors.white),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class TodayMonitoringWidgetDirectorSumma extends ConsumerWidget {
  final bool isMonth;
  const TodayMonitoringWidgetDirectorSumma({super.key, this.isMonth = false});

  @override
  Widget build(BuildContext context, ref) {
    return SliverToBoxAdapter(
      child: Container(
        padding: const EdgeInsets.all(12.0),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.green.shade900,
              Colors.greenAccent.shade700,
            ],
            begin: Alignment.topLeft,
            tileMode: TileMode.mirror,
          ),
          borderRadius: BorderRadius.circular(8.0),
        ),
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  Icons.attach_money_outlined,
                  color: Colors.blue.shade600,
                ),
                WBox(8.0),
                Text(
                  isMonth ? "Ushbu oydagi foyda" : "Bugungi foyda",
                  style: const TextStyle(color: Colors.white),
                ),
                const Spacer(),
                Text(
                  "999999999",
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.blue.shade800,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const Text(
                  " UZS",
                  style: TextStyle(color: Colors.white),
                ),
              ],
            ),
            HBox(12.0),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Icon(
                  Icons.timelapse,
                  color: Colors.yellowAccent,
                ),
                WBox(8.0),
                const Text(
                  "Kutilayotgan foyda",
                  style: TextStyle(color: Colors.white),
                ),
                const Spacer(),
                Text(
                  "1000000000",
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.yellow.shade600,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const Text(
                  " UZS",
                  style: TextStyle(color: Colors.white),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
