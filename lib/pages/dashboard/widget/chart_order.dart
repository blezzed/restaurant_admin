import 'package:flutter/material.dart';
import 'package:restaurant_admin/pages/dashboard/index.dart';
import 'package:restaurant_admin/pages/dashboard/widget/widget.dart';
import 'package:restaurant_admin/responsive.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ChartOrder extends StatelessWidget {
  const ChartOrder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size _size = MediaQuery.of(context).size;
    return Column(
      children: [
        SizedBox(height: 20.h),
        Responsive(
          mobile: ChartCardGridView(
            crossAxisCount: _size.width < 850 ? 1 : 2,
            childAspectRatio: _size.width < 850 ? 1.5 : 1,
          ),
          tablet: ChartCardGridView(),
          desktop: ChartCardGridView(
            childAspectRatio: _size.width < 1300 ? 1.8 : 2.0,
          ),
        ),
      ],
    );
  }
}

class ChartCardGridView extends GetView<DashboardController> {
  const ChartCardGridView({Key? key,
    this.crossAxisCount = 2,
    this.childAspectRatio = 1.8
  }) : super(key: key);

  final int crossAxisCount;
  final double childAspectRatio;

  @override
  Widget build(BuildContext context) {
    return GridView(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
        crossAxisSpacing: 20.h,
        mainAxisSpacing: 20.h,
        childAspectRatio: childAspectRatio,
      ),
      children: [
        ProgressPieChart(),
        OrderLineGraph(),
      ],
    );
  }
}

