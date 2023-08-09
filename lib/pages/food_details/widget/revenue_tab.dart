import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:restaurant_admin/pages/food_details/index.dart';
import 'package:restaurant_admin/theme.dart';
import 'package:fl_chart/fl_chart.dart';

class RevenueTab extends GetView<FoodDetailsController> {
  RevenueTab({Key? key}) : super(key: key);

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
                  padding: EdgeInsets.only(top: 10.h, left: 20.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Revenue",
                        style: Theme.of(context).textTheme.labelLarge!.copyWith(
                          fontWeight: FontWeight.bold,
                          color: AppColors.textGrey.withOpacity(0.8),
                          //fontSize: 12.sp
                        ),
                      ),
                      Text(
                        "The weekly report of sales",
                        style: Theme.of(context).textTheme.labelMedium!.copyWith(
                          color: AppColors.paraColor,
                          fontSize: 12.sp,
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
                        vertical: 6.h,
                        horizontal: 8.w,
                      ),
                      decoration: BoxDecoration(
                      ),
                      child: Text(
                        "Save Report",
                        style: Theme.of(context).textTheme.labelMedium!.copyWith(
                          color: Theme.of(context).primaryColor,
                          fontSize: 12.sp,
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
                    maxY: 11,
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
                          barWidth: 2.h,
                          dotData: const FlDotData(show: false),
                          belowBarData: BarAreaData(
                              show: true,
                              gradient: LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [const Color(0xff23b6e6).withOpacity(0.2), Colors.white],
                              )
                          ),
                          spots: [
                            const FlSpot(1, 3),
                            const FlSpot(2, 6),
                            const FlSpot(3, 5),
                            const FlSpot(4, 8.5),
                            const FlSpot(5, 6),
                            const FlSpot(6, 7.5),
                            const FlSpot(7, 5),
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
        fontSize: 11.sp
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
        fontSize: 11.sp
    );
    String text;
    switch (value.toInt()) {
      case 1:
        text = '10K';
        break;
      case 2:
        text = '20k';
        break;
      case 3:
        text = '30k';
        break;
      case 4:
        text = '40k';
        break;
      case 5:
        text = '50k';
        break;
      case 6:
        text = '60k';
        break;
      case 7:
        text = '70k';
        break;
      case 8:
        text = '80k';
        break;
      case 9:
        text = '90k';
        break;
      case 10:
        text = '100k';
        break;

      default:
        return Container();
    }

    return Text(text, style: style, textAlign: TextAlign.left);
  }
}
