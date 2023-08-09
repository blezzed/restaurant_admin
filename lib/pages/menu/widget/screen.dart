import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:restaurant_admin/pages/menu/index.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:restaurant_admin/pages/menu/widget/widget.dart';
import 'package:restaurant_admin/theme.dart';

class MenuListScreen extends GetView<MenuListController> {
  const MenuListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
      body: CustomScrollView(
        controller: controller.scrollController,
        slivers: [
          SliverAppBar(
            pinned: true,
            stretch: true,
            elevation: 0,
            scrolledUnderElevation: 0,
            expandedHeight: MenuListController.kExpandedHeight,
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
                        "Menu",
                        style: Theme.of(context).textTheme.labelLarge!.copyWith(
                            fontSize: 26.sp
                        ),
                      ),
                      Text(
                        "${controller.state.menuTitleList.length} Food Items",
                        style: Theme.of(context).textTheme.labelSmall!.copyWith(
                          color: AppColors.paraColor
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
                      "Menu",
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
                            controller.controlMenuList();
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
          SliverList(
            delegate: SliverChildBuilderDelegate(
              childCount: controller.state.menuTitleList.length,
                  (context, index) {
                return controller.state.menuTitleList[index];
              },
            ),
          )
        ],
      ),
      floatingActionButton: GestureDetector(
        onTap: (){
          Get.toNamed("/add_food");
        },
        child: Container(
          padding: EdgeInsets.all(15.w),
          decoration: BoxDecoration(
            color: Theme.of(context).primaryColor,
            borderRadius: BorderRadius.circular(20.r)
          ),
          child: SvgPicture.asset(
            "assets/icons/add_menu.svg",
            colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn),
            height: 20.h,
          ),
        ),
      ),
    ));
  }
}
