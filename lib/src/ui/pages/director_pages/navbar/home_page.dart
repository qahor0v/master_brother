import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:master_brother/src/ui/widgets/helper_box/sliver_box.dart';
import 'package:master_brother/src/ui/widgets/selled_product_widget.dart';
import 'package:master_brother/src/ui/widgets/title_text_widget.dart';
import 'package:master_brother/src/ui/widgets/today_monitoring_widget.dart';

class DirectorHomePage extends StatefulHookConsumerWidget {
  const DirectorHomePage({super.key});

  @override
  ConsumerState<DirectorHomePage> createState() => _DirectorHomePageState();
}

class _DirectorHomePageState extends ConsumerState<DirectorHomePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.only(
            left: 16.0,
            right: 16.0,
          ),
          child: CustomScrollView(
            slivers: [
              SBox(12.0),
              const TitleText(
                title: 'Bugungi hisobot',
              ),
              SBox(8.0),
              const TodayMonitoringWidgetDirector(),
              SBox(24.0),
              const TitleText(
                title: 'Moliyaviy hisobot',
              ),
              SBox(8.0),
              const TodayMonitoringWidgetDirectorSumma(),
              SBox(24.0),
              const TitleText(
                title: 'Bugun sotilgan tovarlar',
              ),
              SBox(8.0),
              SliverList(
                delegate: SliverChildBuilderDelegate(
                  childCount: 10,
                  (context, index) {
                    return const SelledProductCard();
                  },
                ),
              ),
              SBox(16.0),
              const TitleText(
                title: 'Oylik hisobot',
              ),
              SBox(8.0),
              const TodayMonitoringWidgetDirector(),
              SBox(24.0),
              const TitleText(
                title: 'Oylik moliyaviy hisobot',
              ),
              SBox(8.0),
              const TodayMonitoringWidgetDirectorSumma(
                isMonth: true,
              ),
              SBox(24.0),
              const TitleText(
                title: 'Sotilgan tovarlar',
              ),
              SBox(8.0),
              SliverList(
                delegate: SliverChildBuilderDelegate(
                  childCount: 10,
                  (context, index) {
                    return const SelledProductCard();
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
