import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:restaurant_admin/pages/Reservations/index.dart';
import 'package:restaurant_admin/pages/Reservations/widget/widget.dart';
import 'package:restaurant_admin/pages/food_details/widget/widget.dart';
import 'package:restaurant_admin/theme.dart';

class ReservationsScreen extends GetView<ReservationsController> {
  const ReservationsScreen({Key? key}) : super(key: key);

  Widget _tabBar(BuildContext context){
    return TabBar(
      labelPadding: EdgeInsets.only(left: 15.w, right: 15.w),
      dividerColor: Theme.of(context).scaffoldBackgroundColor,
      controller: controller.tabController,
      labelColor: Colors.black,
      labelStyle: Theme.of(context).textTheme.labelMedium!.copyWith(
          fontWeight: FontWeight.w600,
          fontSize: 14.sp
      ),
      unselectedLabelColor: Colors.grey,
      unselectedLabelStyle: Theme.of(context).textTheme.labelSmall,
      isScrollable: true,
      indicatorSize: TabBarIndicatorSize.label,
      splashBorderRadius: BorderRadius.circular(20.r),
      indicator:
      LineTabIndicator(color: Theme.of(context).primaryColor, radius: 5),
      indicatorWeight: 1,
      tabs: controller.tabs,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            title: Text(
              "Reservations",
              style: Theme.of(context).textTheme.labelLarge!.copyWith(
                fontWeight: FontWeight.bold,
                color:  AppColors.textGrey.withOpacity(0.9)
              ),
            ),
            leading: Material(
              borderRadius: BorderRadius.circular(10.r),
              child: InkWell(
                borderRadius: BorderRadius.circular(10.r),
                onTap: (){
                  controller.controlMenu();
                },
                child: Container(
                  padding: EdgeInsets.all(12.h),
                  child: SvgPicture.asset(
                    "assets/icons/menu_navigation.svg",
                    colorFilter: ColorFilter.mode(AppColors.textGrey.withOpacity(0.9), BlendMode.srcIn),
                    height: 14.h,
                  ),
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              height: 650.h,
              width: double.maxFinite,
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColorLight.withAlpha(60),
                borderRadius: BorderRadius.only(topLeft: Radius.circular(50.r))
              ),
              child: Stack(
                children: [
                  Positioned(
                    top: 5.h,
                    left: 30.w,
                    right: 0,
                    child: Container(
                      height: 40.h,
                      width: double.maxFinite,
                      child: _tabBar(context),
                    ),
                  ),
                  Positioned(
                    top: 50.h,
                    left: 0,
                    right: 0,
                    child: Container(
                      height: 590.h,
                      width: double.maxFinite,
                      decoration: BoxDecoration(
                        //color: Theme.of(context).primaryColor.withAlpha(30),
                        gradient: LinearGradient(
                          colors: [
                            Theme.of(context).primaryColor.withAlpha(30),
                            Theme.of(context).primaryColor.withAlpha(40),
                            Theme.of(context).primaryColor.withAlpha(20),
                          ]
                        ),
                        borderRadius: BorderRadius.only(topLeft: Radius.circular(50.r))
                      ),
                      child: TabBarView(
                        controller: controller.tabController,
                        children: [
                          TableReservations(),
                          Center(child: Text("events")),
                        ],
                      ),
                    ),
                  ),

                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
