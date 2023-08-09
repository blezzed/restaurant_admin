import 'package:flutter/material.dart';
import 'package:restaurant_admin/pages/dashboard/controller.dart';
import 'package:get/get.dart';
import 'package:restaurant_admin/pages/dashboard/widget/widget.dart';
import 'package:restaurant_admin/responsive.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class StatusCards extends GetView<DashboardController> {
  const StatusCards({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size _size = MediaQuery.of(context).size;
    return Column(
      children: [
        SizedBox(height: 20.h),
        Responsive(
          mobile: FileInfoCardGridView(
            crossAxisCount: _size.width < 850 ? 2 : 4,
            childAspectRatio: _size.width < 850 ? 2.0 : 1,
          ),
          tablet: FileInfoCardGridView(),
          desktop: FileInfoCardGridView(
            childAspectRatio: _size.width < 1300 ? 1.8 : 2.0,
          ),
        ),
      ],
    );
  }
}

class FileInfoCardGridView extends GetView<DashboardController> {
  const FileInfoCardGridView({
    Key? key,
    this.crossAxisCount = 4,
    this.childAspectRatio = 1.8,
  }) : super(key: key);

  final int crossAxisCount;
  final double childAspectRatio;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: controller.statusCard.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
        crossAxisSpacing: 20.h,
        mainAxisSpacing: 20.h,
        childAspectRatio: childAspectRatio,
      ),
      itemBuilder: (context, index) => StatusInfoCard(info: controller.statusCard[index]),
    );
  }
}
