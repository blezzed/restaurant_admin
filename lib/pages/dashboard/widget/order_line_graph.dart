import 'package:flutter/material.dart';
import 'package:restaurant_admin/pages/dashboard/index.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:restaurant_admin/responsive.dart';
import 'package:restaurant_admin/theme.dart';

class OrderLineGraph extends GetView<DashboardController> {
  OrderLineGraph({Key? key}) : super(key: key);

  final List<Color> gradientColors = [
    const Color(0xff23b6e6),
    const Color(0xff02d39a)
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 10.w, right: 25.w, top: 10.w, bottom: 10.w),
      decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.onPrimary,
          borderRadius: BorderRadius.circular(20.r),
          boxShadow: [
            const BoxShadow(
              color: Color(0xFFe8e8e8),
              blurRadius: 1.0,
            ),
          ]
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Container(
                  padding: EdgeInsets.only(top: 10.h, left: 10.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Chart Order",
                        style: Theme.of(context).textTheme.labelLarge!.copyWith(
                            fontWeight: FontWeight.bold,
                            color: AppColors.textGrey.withOpacity(0.8),
                          fontSize: Responsive.isMobile(context)?14.sp: Responsive.isTablet(context)?14.sp: 20.sp,
                        ),
                      ),
                      Text(
                        "The weekly report of sales",
                        style: Theme.of(context).textTheme.labelMedium!.copyWith(
                            color: AppColors.paraColor,
                          fontSize: Responsive.isMobile(context)?12.sp: Responsive.isTablet(context)?12.sp: 18.sp,
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 10.w),
                child: Material(
                  color: Theme.of(context).colorScheme.secondaryContainer.withOpacity(0.5),
                  borderRadius: BorderRadius.circular(10.r),
                  child: InkWell(
                    onTap: (){

                    },
                    borderRadius: BorderRadius.circular(10.r),
                    child: Container(
                      padding: EdgeInsets.symmetric(
                          vertical: Responsive.isMobile(context)?6.h: Responsive.isTablet(context)?6.h: 8.h,
                          horizontal: Responsive.isMobile(context)?8.w: Responsive.isTablet(context)?8.w: 10.w,
                      ),
                      decoration: BoxDecoration(
                      ),
                      child: Text(
                        "Save Report",
                        style: Theme.of(context).textTheme.labelMedium!.copyWith(
                          color: Theme.of(context).primaryColor,
                          fontSize: Responsive.isMobile(context)?12.sp: Responsive.isTablet(context)? 12.sp: 18.sp,
                        ),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
          Expanded(
            child: LineChart(
              LineChartData(
                minX: 1,
                maxX: 7,
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
                  show: false
                ),
                borderData: FlBorderData(
                  show: false
                ),
                lineBarsData: [
                  LineChartBarData(
                    isCurved: true,
                    gradient: LinearGradient(
                      colors: gradientColors
                    ),
                    barWidth: Responsive.isMobile(context)? 2.h:5.h,
                    dotData: const FlDotData(show: false),
                    belowBarData: BarAreaData(
                      show: true,
                      gradient: LinearGradient(
                          colors: gradientColors.map((color) => color.withOpacity(0.1)).toList(),
                      )
                    ),
                    spots: [
                      const FlSpot(1, 3),
                      const FlSpot(2, 2),
                      const FlSpot(3, 5),
                      const FlSpot(4, 2.5),
                      const FlSpot(5, 4),
                      const FlSpot(6, 3),
                      const FlSpot(7, 4),
                    ]
                  )
                ]
              )
            ),
          ),
        ],
      ),
    );
  }

  Widget bottomTitleWidgets(double value, TitleMeta meta, BuildContext context) {
    var style = Theme.of(context).textTheme.labelSmall!.copyWith(
      fontSize: Responsive.isMobile(context)?11.sp: Responsive.isTablet(context)?12.sp: 16.sp
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
      case 7:
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

  Widget leftTitleWidgets(double value, TitleMeta meta, BuildContext context) {
    var style = Theme.of(context).textTheme.labelSmall!.copyWith(
        fontSize: Responsive.isMobile(context)?11.sp: Responsive.isTablet(context)?12.sp: 16.sp
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



