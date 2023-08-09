import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:restaurant_admin/pages/dashboard/controller.dart';
import 'package:restaurant_admin/pages/home/controller.dart';
import 'package:restaurant_admin/responsive.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:restaurant_admin/theme.dart';

class Header extends GetView<DashboardController> {
  const Header({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        if (!Responsive.isDesktop(context))
          Material(
            borderRadius: BorderRadius.circular(5.r),
            child: InkWell(
              borderRadius: BorderRadius.circular(5.r),
              onTap: (){
                Get.find<HomeController>().controlMenu();
              },
              child: Container(
                padding: EdgeInsets.all(2.h),
                child: SvgPicture.asset(
                  "assets/icons/sidebar_icon.svg",
                  colorFilter: ColorFilter.mode(AppColors.textGrey.withOpacity(0.9), BlendMode.srcIn),
                  height: 30.h,
                ),
              ),
            ),
          ),
        SizedBox(width: 20.w,),
        if (!Responsive.isMobile(context))
          Expanded(
              flex: 4,
              child: SearchField()),
          Spacer(flex: 1),
        if (Responsive.isMobile(context))
          Material(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10.r),
            child: InkWell(
              onTap: () {},
              borderRadius: BorderRadius.circular(10.r),
              child: Container(
                padding: EdgeInsets.all(8.h),
                child: SvgPicture.asset(
                  "assets/icons/Search.svg",
                  colorFilter: ColorFilter.mode(Theme.of(context).primaryColor, BlendMode.srcIn),
                  height: 20.h,
                ),
              ),
            ),
          ),
          SizedBox(width: 10.h,),
        Material(
          color: Theme.of(context).colorScheme.secondaryContainer,
          borderRadius: BorderRadius.circular(10.r),
          child: InkWell(
            onTap: () {},
            borderRadius: BorderRadius.circular(10.r),
            child: Container(
              //height: Responsive.isMobile(context)?30.w: Responsive.isTablet(context)?30.w: 40.w,
              //width: Responsive.isMobile(context)?30.w: Responsive.isTablet(context)?30.w: 40.w,
              padding: EdgeInsets.all(8.h),
              child: SvgPicture.asset(
                "assets/icons/menu_notification.svg",
                colorFilter: ColorFilter.mode(Theme.of(context).primaryColor, BlendMode.srcIn),
                height: 20.h,
              ),
            ),
          ),
        ),
        SizedBox(width: 10.h,),
        Container(
          width: 1.w,
          height: (Responsive.isMobile(context))? 30.h :40.h,
          color: Theme.of(context).primaryColor.withOpacity(0.7),
        ),
        ProfileCard()
      ],
    );
  }

}

class SearchField extends StatelessWidget {
  const SearchField({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Responsive.isMobile(context)?40.w: Responsive.isTablet(context)?40.h: 40.h,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.onPrimary,
        borderRadius: BorderRadius.circular(20.r),
        boxShadow: [
          BoxShadow(
            color: Color(0xFFe8e8e8),
            //spreadRadius: 1,
            blurRadius: 1.0,
            offset: Offset(0, 1),
          ),
          BoxShadow(
            color: Theme.of(context).colorScheme.onPrimary,
            //spreadRadius: 1,
            blurRadius: 1.0,
            offset: Offset(-1, -1),
          ),
        ]
      ),
      child: Row(
        children: [
          Expanded(
            child: Container(
              height: Responsive.isMobile(context)?40.h: Responsive.isTablet(context)?40.h: 40.h,
              padding: EdgeInsets.only(left: 15.w, right: 15.w, top: 10.h),
              child: TextField(
                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                  color: Theme.of(context).primaryColor,
                  fontSize: Responsive.isMobile(context)?12.sp: Responsive.isTablet(context)?12.sp: 16.sp
                ),
                decoration: InputDecoration(
                  hintText: "Search",
                  hintStyle: Theme.of(context).textTheme.labelMedium!.copyWith(
                    color: Theme.of(context).colorScheme.primary.withOpacity(0.5),
                    fontSize: Responsive.isMobile(context)?12.sp: Responsive.isTablet(context)?12.sp: 16.sp
                  ),
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
            ),
          ),
          Material(
            child: InkWell(
              onTap: () {},
              borderRadius: BorderRadius.circular(10.r),
              child: Container(
                height: 50.w,
                width: 50.w,
                padding: EdgeInsets.all(Responsive.isMobile(context)?7.w: Responsive.isTablet(context)?7.w:10.w),
                margin: EdgeInsets.only(right: 10.w, left: 10.w),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10.r)),
                ),
                child: SvgPicture.asset(
                    "assets/icons/Search.svg",
                  colorFilter: ColorFilter.mode(Theme.of(context).primaryColor, BlendMode.srcIn),
                  height: 25.w,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ProfileCard extends StatelessWidget {
  const ProfileCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: (Responsive.isMobile(context))? 0:15.w),
      padding: EdgeInsets.symmetric(
        horizontal: (Responsive.isMobile(context))? 5.w:15.w,
        vertical: 8.w,
      ),
      child: Row(
        children: [
          if (!Responsive.isMobile(context))
            Padding(
              padding:
              EdgeInsets.symmetric(horizontal:8.w),
              child: Text(
                  "Angelina Jolie",
                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                  fontSize: Responsive.isMobile(context)?12.sp: Responsive.isTablet(context)?12.sp: 16.sp
                ),
              ),
            ),
            SizedBox(width: 15.w,),
          Container(
            height: Responsive.isMobile(context)?40.w: Responsive.isTablet(context)?30.w: 40.w,
            width: Responsive.isMobile(context)?40.w: Responsive.isTablet(context)?30.w: 40.w,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(200.r),
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage(
                      "assets/images/profile_p.jpg",
                    )
                )
            ),
          ),
        ],
      ),
    );
  }
}
