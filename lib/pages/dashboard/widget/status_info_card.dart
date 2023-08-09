import 'package:flutter/material.dart';
import 'package:restaurant_admin/common/entities/entities.dart';
import 'package:restaurant_admin/pages/dashboard/index.dart';
import 'package:get/get.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:restaurant_admin/responsive.dart';
import 'package:restaurant_admin/theme.dart';

class StatusInfoCard extends GetView<DashboardController> {
  const StatusInfoCard( {Key? key, required this.info}) : super(key: key);

  final StatusStorageInfo info;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200.h,
      padding: EdgeInsets.all((Responsive.isMobile(context))? 10.w:20.w),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.onPrimary,
        borderRadius: BorderRadius.all(Radius.circular(10.r)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: EdgeInsets.all((Responsive.isMobile(context))? 10.w:20.w * 0.75),
                height: Responsive.isMobile(context)?40.w: Responsive.isTablet(context)?60.w: 70.w,
                width: Responsive.isMobile(context)?40.w: Responsive.isTablet(context)?60.w: 70.w,
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor.withOpacity(0.1),
                  borderRadius: BorderRadius.all(Radius.circular(50.r)),
                ),
                child: SvgPicture.asset(
                  info.svgSrc!,
                  //colorFilter: ColorFilter.mode(Theme.of(context).primaryColor ?? Colors.black, BlendMode.srcIn),
                ),
              ),
              Column(
                children: [
                  Text(
                    info.value!,
                    style: Theme.of(context)
                        .textTheme
                        .labelLarge!
                        .copyWith(
                      fontSize: Responsive.isMobile(context)?18.sp: Responsive.isTablet(context)?24.sp: 30.sp,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                  Text(
                    info.title!,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context)
                        .textTheme
                        .labelMedium!
                        .copyWith(
                        color: AppColors.paraColor,
                      fontSize: Responsive.isMobile(context)?12.sp: Responsive.isTablet(context)?14.sp: 18.sp,
                    )
                  ),
                ],
              )
            ],
          ),
          ProgressLine(
            color: Theme.of(context).primaryColor,
            percentage: info.percentage,
          ),
          if (!Responsive.isMobile(context))
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  "${info.percentage!}%",
                  style: Theme.of(context)
                      .textTheme
                      .bodySmall!
                      .copyWith(color: Theme.of(context).primaryColor.withOpacity(0.5), fontWeight: FontWeight.bold),
                ),
              ],
            )
        ],
      ),
    );
  }
}

class ProgressLine extends StatelessWidget {
  const ProgressLine({
    Key? key,
    this.color ,
    required this.percentage,
  }) : super(key: key);

  final Color? color;
  final int? percentage;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: 5.h,
          decoration: BoxDecoration(
            color: color!.withOpacity(0.1),
            borderRadius: BorderRadius.all(Radius.circular(10.r)),
          ),
        ),
        LayoutBuilder(
          builder: (context, constraints) => Container(
            width: constraints.maxWidth * (percentage! / 100),
            height: 5.h,
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.all(Radius.circular(10.r)),
            ),
          ),
        ),
      ],
    );
  }
}