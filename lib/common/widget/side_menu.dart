import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:restaurant_admin/responsive.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            child:
            Center(
              child: Text(
                "Restaurant",
                style: Theme.of(context).textTheme.labelLarge!.copyWith(
                  fontSize: Responsive.isMobile(context)?24.sp: Responsive.isTablet(context)?24.sp:28.sp,
                  color: Theme.of(context).primaryColor,
                  fontWeight: FontWeight.w700
                ),
              ),
            )
            //Image.asset("assets/images/webber.jpeg"),
          ),
          DrawerListTile(
            title: "Dashboard",
            svgSrc: "assets/icons/menu_home.svg",
            press: () {
              Get.offNamed("home");
            },
          ),
          DrawerListTile(
            title: "Orders",
            svgSrc: "assets/icons/menu_task.svg",
            press: () {
              Get.offNamed("order_list");
            },
          ),
          DrawerListTile(
            title: "Reservations",
            svgSrc: "assets/icons/menu_reserve.svg",
            press: () {
              Get.offNamed("reservations");
            },
          ),
          DrawerListTile(
            title: "Menu",
            svgSrc: "assets/icons/menu_list.svg",
            press: () {
              Get.offNamed("menu_list");
            },
          ),
          DrawerListTile(
            title: "Customers",
            svgSrc: "assets/icons/menu_users.svg",
            press: () {
              Get.offNamed("customers");
            },
          ),
          DrawerListTile(
            title: "Settings",
            svgSrc: "assets/icons/menu_setting.svg",
            press: () {},
          ),
        ],
      ),
    );
  }
}

class DrawerListTile extends StatelessWidget {
  const DrawerListTile({
    Key? key,
    // For selecting those three line once press "Command+D"
    required this.title,
    required this.svgSrc,
    required this.press,
  }) : super(key: key);

  final String title, svgSrc;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: press,
      horizontalTitleGap: 8.w,
      leading: SvgPicture.asset(
        svgSrc,
        colorFilter: ColorFilter.mode(Theme.of(context).primaryColor, BlendMode.srcIn),
        height: 20.w,
      ),
      title: Text(
        title,
        style: Theme.of(context).textTheme.labelLarge!.copyWith(
            color: Theme.of(context).primaryColor,
          fontWeight: FontWeight.normal,
          fontSize: Responsive.isMobile(context)?16.sp: Responsive.isTablet(context)?15.sp:20.sp
        ),
      ),
    );
  }
}
