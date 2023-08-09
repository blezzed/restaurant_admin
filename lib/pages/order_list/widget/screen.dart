import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:restaurant_admin/pages/order_list/index.dart';
import 'package:restaurant_admin/theme.dart';

class OrderListScreen extends GetView<OrderListController> {
  const OrderListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            stretch: true,
            elevation: 0,
            scrolledUnderElevation: 0,
            expandedHeight: OrderListController.kExpandedHeight,
            leading: const SizedBox(),
            flexibleSpace: FlexibleSpaceBar(
              expandedTitleScale: 1.0,
              titlePadding: EdgeInsets.only(left: 10.w, right: 10.w, bottom: 10.h),
              background: Center(
                child: AnimatedOpacity(
                  duration: const Duration(milliseconds: 200),
                  opacity: controller.state.appBarHeroTitleOpacity.value,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Your Orders",
                        style: Theme.of(context).textTheme.labelLarge!.copyWith(
                            fontSize: 26.sp
                        ),
                      ),
                      SizedBox(height: 5.h,),
                      RichText(
                        text: TextSpan(
                          style: Theme.of(context).textTheme.labelSmall!.copyWith(
                              color: AppColors.paraColor
                          ),
                          children: <TextSpan>[
                            TextSpan(text: '3 ', style: Theme.of(context).textTheme.labelSmall!.copyWith(color: AppColors.textGrey.withOpacity(0.9), fontWeight: FontWeight.bold)),
                            TextSpan(text: 'new orders  ', ),
                            TextSpan(text: '5 ', style: Theme.of(context).textTheme.labelSmall!.copyWith(color: AppColors.textGrey.withOpacity(0.9), fontWeight: FontWeight.bold)),
                            TextSpan(text: 'on delivery  ', ),
                            TextSpan(text: '10 ', style: Theme.of(context).textTheme.labelSmall!.copyWith(color: AppColors.textGrey.withOpacity(0.9), fontWeight: FontWeight.bold)),
                            TextSpan(text: 'delivered ', ),

                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AnimatedOpacity(
                    duration: const Duration(milliseconds: 200),
                    opacity: controller.state.appBarTitleOpacity.value,
                    child: Text(
                      "Your Orders",
                      style: Theme.of(context).textTheme.labelLarge!.copyWith(
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      Material(
                        borderRadius: BorderRadius.circular(10.r),
                        child: InkWell(
                          onTap: (){

                          },
                          borderRadius: BorderRadius.circular(10.r),
                          child: Container(
                            padding: EdgeInsets.all(7.h),
                            child: SvgPicture.asset(
                              "assets/icons/Search.svg",
                              colorFilter: const ColorFilter.mode(AppColors.textGrey, BlendMode.srcIn),
                              height: 20.h,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 5.w,),
                      Material(
                        borderRadius: BorderRadius.circular(5.r),
                        child: InkWell(
                          borderRadius: BorderRadius.circular(5.r),
                          onTap: (){
                            controller.controlMenu();
                          },
                          child: Container(
                            padding: EdgeInsets.all(7.h),
                            child: SvgPicture.asset(
                              "assets/icons/menu_navigation.svg",
                              colorFilter: ColorFilter.mode(AppColors.textGrey.withOpacity(0.9), BlendMode.srcIn),
                              height: 20.h,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    ));
  }
}
