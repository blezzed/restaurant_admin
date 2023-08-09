import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:restaurant_admin/responsive.dart';
import 'package:restaurant_admin/theme.dart';

class ProgressPieChart extends StatelessWidget {
  const ProgressPieChart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all((Responsive.isMobile(context))? 10.w:20.w),
      decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.onPrimary,
          borderRadius: BorderRadius.circular(20.r),
          boxShadow: [
            BoxShadow(
              color: Color(0xFFe8e8e8),
              blurRadius: 1.0,
            ),
          ]
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Pie Chart",
            style: Theme.of(context).textTheme.labelLarge!.copyWith(
              fontWeight: FontWeight.bold,
              fontSize: Responsive.isMobile(context)?16.sp: Responsive.isTablet(context)?18.sp: 20.sp,
            ),
          ),
          SizedBox(height: Responsive.isMobile(context)? 20.h:40.w,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              pieCharts(context, percent: 40, color: Colors.red, title: "Total Order"),
              pieCharts(context, percent: 50, color: Color(0xff02d39a), title: "Customer Growth"),
              pieCharts(context, percent: 60, color: Color(0xff23b6e6), title: "Total Revenue"),
            ],
          ),
        ],
      ),
    );
  }

  Widget pieCharts(BuildContext context, {required int percent, required Color color, required String title}){
    return Column(
      children: [
        CircularPercentIndicator(
            radius: Responsive.isMobile(context)?40.r: Responsive.isTablet(context)?60.r: 70.r,
          lineWidth: Responsive.isMobile(context)?20.w: Responsive.isTablet(context)?20.w: 40.w,
          animation: true,
          percent: percent/100,
          progressColor: color,
          backgroundColor: color.withOpacity(0.2),
          center: Text(
            "$percent%",
            style: Theme.of(context).textTheme.labelMedium!.copyWith(
              fontWeight: FontWeight.bold,
              fontSize: Responsive.isMobile(context)?12.sp: Responsive.isTablet(context)?14.sp: 18.sp,
            ),
          ),
        ),
        SizedBox(height: Responsive.isMobile(context)? 20.h:10.h,),
        Text(
          title,
          style: Theme.of(context).textTheme.labelMedium!.copyWith(
            fontSize: Responsive.isMobile(context)?12.sp: Responsive.isTablet(context)?14.sp: 18.sp,
          ),
        ),
      ],
    );
  }
}
