
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:restaurant_admin/pages/food_details/index.dart';
import 'package:restaurant_admin/pages/food_details/widget/widget.dart';
import 'package:restaurant_admin/theme.dart';

class FoodDetailsPage extends GetView<FoodDetailsController> {
  const FoodDetailsPage({Key? key}) : super(key: key);

  Widget _heroCard(BuildContext context){
    return SafeArea(
      child: Container(
        width: double.maxFinite,
        padding: EdgeInsets.only(left: 10.w, right: 10.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Flexible(
              flex: 5,
              child: SizedBox(
                height: 50.h,
                child: Row(
                  children: [
                    Material(
                      borderRadius: BorderRadius.circular(5.r),
                      child: InkWell(
                        borderRadius: BorderRadius.circular(5.r),
                        onTap: (){
                          Get.back();
                        },
                        child: Container(
                          padding: EdgeInsets.only(left: 7.w, right: 7.w),
                          child: Center(
                            child: Icon(
                              Icons.arrow_back_ios_new_rounded,
                              color: AppColors.textDark.withOpacity(0.8),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Text(
                      "Detail Menus",
                      style: Theme.of(context).textTheme.labelMedium,
                    ),
                    Spacer(flex: 3,),
                    Text(
                      "Category: ",
                      style: Theme.of(context).textTheme.labelMedium!.copyWith(
                        fontWeight: FontWeight.w100,
                        color: AppColors.paraColor,
                        fontSize: 14.sp
                      )
                    ),
                    Text(
                      controller.product!.category!.name.capitalize!,
                      style: Theme.of(context).textTheme.labelMedium!.copyWith(
                        fontWeight: FontWeight.w100,
                        color: Theme.of(context).primaryColor,
                        fontSize: 14.sp
                      )
                    ),

                  ],
                ),
              ),
            ),
            Flexible(
              flex: 5,
              child: Row(
                children: [
                  Flexible(
                    flex: 2,
                    child: Container(
                      height: 200.w,
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.secondaryContainer,
                        borderRadius: BorderRadius.circular(20.r),
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage(
                            controller.product!.img!,
                          )
                        )
                      ),
                    ),
                  ),
                  SizedBox(width: 10.w,),
                  Flexible(
                    flex: 3,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          ". Stock Available",
                          style: Theme.of(context).textTheme.labelSmall!.copyWith(
                            color: Theme.of(context).primaryColor,
                            fontSize: 11.sp
                          ),
                        ),
                        Text(
                          controller.product!.name!,
                          maxLines: 2,
                          style: Theme.of(context).textTheme.labelLarge!.copyWith(
                            fontWeight: FontWeight.w700,
                            fontSize: 22.sp,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        Text(
                          controller.product!.description!,
                          maxLines: 1,
                          style: Theme.of(context).textTheme.labelSmall!.copyWith(
                            fontSize: 13.sp,
                            color: AppColors.paraColor,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        SizedBox(height: 10.h,),
                        Row(
                          children: [
                            Material(
                              color: Theme.of(context).primaryColor,
                              borderRadius: BorderRadius.circular(10.r),
                              child: InkWell(
                                onTap: (){},
                                borderRadius: BorderRadius.circular(10.r),
                                child: Container(
                                  padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 15.w),
                                  child: Text(
                                    "Add Menu",
                                    style: Theme.of(context).textTheme.labelSmall!.copyWith(
                                      fontSize: 12.sp,
                                      color: Colors.white
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(width: 10.w,),
                            Material(
                              color: Colors.grey[200],
                              borderRadius: BorderRadius.circular(10.r),
                              child: InkWell(
                                onTap: (){},
                                borderRadius: BorderRadius.circular(10.r),
                                child: Container(
                                  padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 15.w),
                                  child: Text(
                                    "Edit Menu",
                                    style: Theme.of(context).textTheme.labelSmall!.copyWith(
                                        fontSize: 12.sp,
                                        color: AppColors.textGrey
                                    ),
                                  ),
                                ),
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  )
                ],
            ))
          ],
        ),
      ),
    );
  }

  Widget _tabBar(BuildContext context){
    return TabBar(
      labelPadding: const EdgeInsets.only(left: 20, right: 20),
      dividerColor: Theme.of(context).scaffoldBackgroundColor,
      controller: controller.tabController,
      labelColor: Colors.black,
      labelStyle: Theme.of(context).textTheme.labelMedium!.copyWith(
          fontWeight: FontWeight.w600,
          fontSize: 14.sp
      ),
      unselectedLabelColor: Colors.grey,
      unselectedLabelStyle: Theme.of(context).textTheme.labelSmall,
      isScrollable: false,
      indicatorSize: TabBarIndicatorSize.label,
      splashBorderRadius: BorderRadius.circular(20.r),
      indicator:
      LineTabIndicator(color: Theme.of(context).primaryColor, radius: 4),
      tabs: controller.tabs,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
      body:  CustomScrollView(
        controller: controller.scrollController,
        slivers: [
          SliverAppBar(
            pinned: true,
            stretch: true,
            elevation: 0,
            scrolledUnderElevation: 0,
            expandedHeight: 270.h,
            leading: const SizedBox(),
            flexibleSpace: FlexibleSpaceBar(
              expandedTitleScale: 1.0,
              titlePadding: EdgeInsets.only(left: 10.w, right: 10.w,),
              background: AnimatedOpacity(
                duration: const Duration(milliseconds: 200),
                opacity: controller.state.appBarHeroOpacity.value,
                child: _heroCard(context),
              ),
              title: Container(
                  color: Theme.of(context).scaffoldBackgroundColor,
                  child: _tabBar(context)),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              padding: EdgeInsets.only(left: 10.w, right: 10.w),
              margin: EdgeInsets.only(top: 10.h),
              height: 630.h,
              width: double.maxFinite,
              child: TabBarView(
                controller: controller.tabController,
                children: [
                  AboutTab(),
                  ReviewTab(),
                  RevenueTab(),
                ],
              ),
            ),
          ),
        ],
      ),
    ));
  }
}

