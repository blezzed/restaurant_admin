import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:restaurant_admin/responsive.dart';

class ReserveBarChart extends StatelessWidget {
  ReserveBarChart({Key? key}) : super(key: key);

  List<double> weeklySummary = [
    4.40,
    2.50,
    42.42,
    10.50,
    100.20,
    88.99,
    90.10,
  ];

  @override
  Widget build(BuildContext context) {
    BarData myBarData = BarData(sunAmount: weeklySummary[0], monAmount: weeklySummary[1], tueAmount: weeklySummary[2], wedAmount: weeklySummary[3], thurAmount: weeklySummary[4], friAmount: weeklySummary[5], satAmount: weeklySummary[6]);
    myBarData.initializeBarData();

    return BarChart(
      BarChartData(
        maxY: 100,
        minY: 0,
        gridData: FlGridData(show: false),
        borderData: FlBorderData(show: false),
        titlesData: FlTitlesData(
          show: true,
          rightTitles: const AxisTitles(
            sideTitles: SideTitles(showTitles: false),
          ),
          topTitles: const AxisTitles(
            sideTitles: SideTitles(showTitles: false),
          ),
          leftTitles: const AxisTitles(
            sideTitles: SideTitles(showTitles: false),
          ),
          bottomTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              reservedSize: 25,
              interval: 1,
              getTitlesWidget: (double value, TitleMeta meta,) => bottomTitleWidgets(value, meta, context),
            ),
          ),
        ),
        barGroups: myBarData.barData
          .map((data) => BarChartGroupData(
            x: data.x,
          barRods: [BarChartRodData(
            toY: data.y,
            color: Theme.of(context).primaryColor,
            width: Responsive.isMobile(context)?20.w: Responsive.isTablet(context)?20.w:30.w,
            borderRadius: BorderRadius.circular(5.r),
            backDrawRodData: BackgroundBarChartRodData(
              show: true,
              toY: 100,
              color: Theme.of(context).primaryColor.withOpacity(0.1)
            )
          )]
        )).toList(),
      )
    );
  }

  Widget bottomTitleWidgets(double value, TitleMeta meta, BuildContext context) {
    var style = Theme.of(context).textTheme.labelSmall!.copyWith(
        fontSize: Responsive.isMobile(context)?12.sp: Responsive.isTablet(context)?12.sp:14.sp
    );
    Widget text;
    switch (value.toInt()) {
      case 1:
        text =  Text('Mon', style: style);
        break;
      case 2:
        text =  Text('Tue', style: style);
        break;
      case 3:
        text =  Text('Wed', style: style);
        break;
      case 4:
        text =  Text('Thu', style: style);
        break;
      case 5:
        text =  Text('Fri', style: style);
        break;
      case 6:
        text =  Text('Sat', style: style);
        break;
      case 0:
        text =  Text('Sun', style: style);
        break;
      default:
        text =  Text('', style: style);
        break;
    }

    return SideTitleWidget(
      axisSide: meta.axisSide,
      child: text,
    );
  }
}

class IndividualBar{
  final int x;
  final double y;

  IndividualBar({required this.x, required this.y});
}

class BarData {
  final double sunAmount;
  final double monAmount;
  final double tueAmount;
  final double wedAmount;
  final double thurAmount;
  final double friAmount;
  final double satAmount;

  BarData(
      {required this.sunAmount,
      required this.monAmount,
      required this.tueAmount,
      required this.wedAmount,
      required this.thurAmount,
      required this.friAmount,
      required this.satAmount
  });

  List<IndividualBar> barData = [];

  void initializeBarData() {
    barData = [
      IndividualBar(x: 0, y: sunAmount),
      IndividualBar(x: 1, y: monAmount),
      IndividualBar(x: 2, y: tueAmount),
      IndividualBar(x: 3, y: wedAmount),
      IndividualBar(x: 4, y: thurAmount),
      IndividualBar(x: 5, y: friAmount),
      IndividualBar(x: 6, y: satAmount),
    ];
  }


}
