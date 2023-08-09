
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:restaurant_admin/common/widget/widget.dart';
import 'package:restaurant_admin/pages/dashboard/index.dart';
import 'package:restaurant_admin/pages/dashboard/widget/widget.dart';
import 'package:restaurant_admin/pages/home/index.dart';
import 'package:restaurant_admin/responsive.dart';
import 'package:restaurant_admin/theme.dart';

class DashboardPage extends GetView<DashboardController> {
  const DashboardPage({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return SafeArea(child: SingleChildScrollView(
      primary: false,
      padding: EdgeInsets.only(left: Responsive.isMobile(context)?10.w:40.w, right: Responsive.isMobile(context)?5.w:40.w, bottom: 20.h),
      child: Column(
        children: [
          Header(),
          // status cards
          Container(
            padding: EdgeInsets.only(top: 10.h),
            width: double.maxFinite,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Dashboard",
                  style: Theme.of(context).textTheme.labelLarge!.copyWith(
                    fontSize: Responsive.isMobile(context)?20.sp: Responsive.isTablet(context)?20.sp: 26.sp,
                    fontWeight: FontWeight.bold
                  ),
                ),
                Text(
                  "Hi Angelina, welcome back to Restaurant Admin!",
                  style: Theme.of(context).textTheme.labelMedium!.copyWith(
                    color: AppColors.paraColor,
                    fontSize: Responsive.isMobile(context)?13.sp: Responsive.isTablet(context)?14.sp: 16.sp,
                  ),
                )
              ],
            ),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 5,
                child: StatusCards(),
              ),
            ],
          ),
          // pie chart and chart order
          ChartOrder(),
          // total revenue multi line graph and reserved table report section
          TotalRevenueSection(),
          // customer review
          if (!Responsive.isMobile(context))
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: EdgeInsets.only(top: 20.h),
                  //width: double.maxFinite,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Customer Review",
                        style: Theme.of(context).textTheme.labelLarge!.copyWith(
                            fontWeight: FontWeight.bold,
                          color: AppColors.textGrey.withOpacity(0.8),
                          fontSize: Responsive.isMobile(context)?14.sp: Responsive.isTablet(context)?14.sp:20.sp
                        ),
                      ),
                      Text(
                        "Neque porro quisquam est qui dolorem ipsum quia dolor sit amet",
                        style: Theme.of(context).textTheme.labelMedium!.copyWith(
                            color: AppColors.paraColor,
                          fontSize: Responsive.isMobile(context)?12.sp: Responsive.isTablet(context)?12.sp:18.sp
                        ),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 20.w),
                  child: Row(
                    children: [
                      Material(
                        color: Theme.of(context).colorScheme.onPrimary,
                        borderRadius: BorderRadius.circular(10.r),
                        child: InkWell(
                          onTap: (){
                            controller.scrollController.animateTo(controller.scrollController.position.minScrollExtent,
                                duration: const Duration(milliseconds: 1000),
                                curve: Curves.easeInOut);
                          },
                          borderRadius: BorderRadius.circular(10.r),
                          child: Container(
                            padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 10.w),
                            child: Icon(
                              Icons.arrow_back_ios_rounded,
                              color: Theme.of(context).primaryColor.withOpacity(0.7),
                              size: Responsive.isMobile(context)?15.w: Responsive.isTablet(context)?15.w:20.w,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 8.w,),
                      Material(
                        color: Theme.of(context).colorScheme.onPrimary,
                        borderRadius: BorderRadius.circular(10.r),
                        child: InkWell(
                          onTap: (){
                            controller.scrollController.animateTo(controller.scrollController.position.maxScrollExtent,
                                duration: const Duration(milliseconds: 1000),
                                curve: Curves.easeInOut);
                          },
                          borderRadius: BorderRadius.circular(10.r),
                          child: Container(
                            padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 10.w),
                            child: Icon(
                              Icons.arrow_forward_ios_rounded,
                              color: Theme.of(context).primaryColor.withOpacity(0.7),
                              size: Responsive.isMobile(context)?15.w: Responsive.isTablet(context)?15.w:20.w,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          if (!Responsive.isMobile(context))
            CustomerReview(),

        ],
      ),
    ));
  }
}
