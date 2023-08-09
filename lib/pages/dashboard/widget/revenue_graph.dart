import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:restaurant_admin/responsive.dart';
import 'package:restaurant_admin/theme.dart';

class RevenueGraph extends StatelessWidget {
  const RevenueGraph({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LineChart(
        LineChartData(
            minX: 0,
            maxX: 13,
            minY: 0,
            maxY: 6,
            titlesData: FlTitlesData(
              show: true,
              rightTitles: const AxisTitles(
                sideTitles: SideTitles(showTitles: false),
              ),
              topTitles: const AxisTitles(
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
              leftTitles: AxisTitles(
                sideTitles: SideTitles(
                  showTitles: true,
                  interval: 1,
                  getTitlesWidget: (double value, TitleMeta meta,) => leftTitleWidgets(value, meta, context),
                  reservedSize: 30,
                ),
              ),
            ),
            gridData: const FlGridData(
                show: true,
              drawHorizontalLine: false,
              drawVerticalLine: true,
            ),
            borderData: FlBorderData(
                show: false
            ),
            lineBarsData: [
              LineChartBarData(
                  isCurved: true,
                  color: Colors.red,
                  barWidth: 3.h,
                  dotData: const FlDotData(show: false),
                  spots: [
                    const FlSpot(1, 3),
                    const FlSpot(2, 2),
                    const FlSpot(3, 4),
                    const FlSpot(4, 2.5),
                    const FlSpot(5, 4),
                    const FlSpot(6, 3),
                    const FlSpot(7, 3.5),
                    const FlSpot(8, 2.5),
                    const FlSpot(9, 4),
                    const FlSpot(10, 3.2),
                    const FlSpot(11, 4),
                    const FlSpot(12, 4.5),
                  ]
              ),
              LineChartBarData(
                  isCurved: true,
                  color: Color(0xff23b6e6),
                  barWidth: 3.h,
                  dotData: const FlDotData(show: false),
                  spots: [
                    const FlSpot(1, 5),
                    const FlSpot(2, 3),
                    const FlSpot(3, 3.5),
                    const FlSpot(4, 2),
                    const FlSpot(5, 3.5),
                    const FlSpot(6, 2.7),
                    const FlSpot(7, 2.5),
                    const FlSpot(8, 3),
                    const FlSpot(9, 4),
                    const FlSpot(10, 3),
                    const FlSpot(11, 4),
                    const FlSpot(12, 5),
                  ]
              ),
            ]
        )
    );
  }

  Widget bottomTitleWidgets(double value, TitleMeta meta, BuildContext context) {
    var style = Theme.of(context).textTheme.labelSmall!.copyWith(
        fontSize: Responsive.isMobile(context)?12.sp: Responsive.isTablet(context)?12.sp:14.sp
    );
    Widget text;
    switch (value.toInt()) {
      case 2:
        text =  Text('Feb', style: style);
        break;
      case 4:
        text =  Text('Apr', style: style);
        break;
      case 6:
        text =  Text('Jun', style: style);
        break;
      case 8:
        text =  Text('Aug', style: style);
        break;
      case 10:
        text =  Text('Oct', style: style);
        break;
      case 12:
        text =  Text('Dec', style: style);
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

  Widget leftTitleWidgets(double value, TitleMeta meta, BuildContext context) {
    var style = Theme.of(context).textTheme.labelSmall!.copyWith(
        fontSize: Responsive.isMobile(context)?12.sp: Responsive.isTablet(context)?12.sp:14.sp
    );
    String text;
    switch (value.toInt()) {
      case 1:
        text = '10K';
        break;
      case 3:
        text = '30k';
        break;
      case 5:
        text = '50k';
        break;
      default:
        return Container();
    }

    return Text(text, style: style, textAlign: TextAlign.left);
  }
}
