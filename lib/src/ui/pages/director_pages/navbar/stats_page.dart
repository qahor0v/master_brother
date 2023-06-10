import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:master_brother/src/ui/widgets/helper_box/sized_box.dart';
import 'package:master_brother/src/utils/constants/app_colors.dart';

class StatsPage extends StatefulWidget {
  const StatsPage({super.key});

  @override
  State<StatsPage> createState() => _StatsPageState();
}

class _StatsPageState extends State<StatsPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Monitoring"),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              HBox(12.0),
              SizedBox(
                height: 400,
                width: double.infinity,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 16, right: 16),
                    child: SizedBox(
                      height: 400,
                      width: MediaQuery.of(context).size.width * 1,
                      child: const _LineChart(
                        isShowingMainData: false,
                      ),
                    ),
                  ),
                ),
              ),
              HBox(20.0),
              const Center(
                child: Text(
                  "Yaqinda ishga tushiriladi",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: 20,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class _LineChart extends StatelessWidget {
  const _LineChart({required this.isShowingMainData});

  final bool isShowingMainData;

  @override
  Widget build(BuildContext context) {
    ///
    Widget leftTitleWidgets(double value, TitleMeta meta) {
      const style = TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 14,
        color: Colors.white,
      );
      String text;
      text = value.toStringAsFixed(1);
      return Text("$text m", style: style, textAlign: TextAlign.center);
    }

    ///
    SideTitles leftTitles() => SideTitles(
          getTitlesWidget: leftTitleWidgets,
          showTitles: true,
          interval: 0.5,
          reservedSize: 40,
        );

    ///
    LineChartBarData lineChartBarData2_3 = LineChartBarData(
      isCurved: true,
      curveSmoothness: 0,
      color: Colors.cyan.withOpacity(0.5),
      barWidth: 2,
      isStrokeCapRound: true,
      dotData: FlDotData(show: true),
      belowBarData: BarAreaData(show: true),
      spots: const [
        FlSpot(1, 3.8),
        FlSpot(3, 1.9),
        FlSpot(6, 0.6),
        FlSpot(10, 3.3),
        FlSpot(13, 0.5),
        FlSpot(13.5, 5.8),
      ],
    );

    ///

    LineChartData sampleData1 = LineChartData(
      lineTouchData: LineTouchData(
        handleBuiltInTouches: true,
        touchTooltipData: LineTouchTooltipData(
          tooltipBgColor: Colors.blueGrey.withOpacity(0.8),
        ),
      ),
      gridData: FlGridData(show: false),
      titlesData: FlTitlesData(
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            reservedSize: 30,
            interval: 2,
            getTitlesWidget: bottomTitleWidgets,
          ),
        ),
        rightTitles: AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        topTitles: AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        leftTitles: AxisTitles(
          sideTitles: leftTitles(),
        ),
      ),
      borderData: FlBorderData(
        show: true,
        border: Border(
          bottom: BorderSide(color: mainColor.withOpacity(0.2), width: 4),
          left: const BorderSide(color: Colors.transparent),
          right: const BorderSide(color: Colors.transparent),
          top: const BorderSide(color: Colors.transparent),
        ),
      ),
      lineBarsData: [lineChartBarData2_3],
      minX: 0,
      maxX: 14,
      maxY: 4,
      minY: 0,
    );
    return LineChart(
      sampleData1,
      swapAnimationDuration: const Duration(milliseconds: 250),
    );
  }

  Widget bottomTitleWidgets(double value, TitleMeta meta) {
    const style = TextStyle(
      fontWeight: FontWeight.w400,
      fontSize: 12,
      color: mainColor,
    );
    Widget text;
    text = Text(value.toInt().toString(), style: style);

    return SideTitleWidget(
      axisSide: meta.axisSide,
      space: 10,
      child: text,
    );
  }
}
