
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:restaurant_admin/common/widget/widget.dart';
import 'package:restaurant_admin/pages/dashboard/index.dart';
import 'package:restaurant_admin/pages/home/index.dart';
import 'package:restaurant_admin/responsive.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: controller.scaffoldKey,
      drawer: SideMenu(),
      body:  SafeArea(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // We want this side menu only for large screen
            if (Responsive.isDesktop(context))
              Expanded(
                // default flex = 1
                // and it takes 1/6 part of the screen
                child: SideMenu(),
              ),
            Expanded(
              // It takes 5/6 part of the screen
              flex: 5,
              child: DashboardPage(),
            ),
          ],
        ),
      ),
    );
  }
}
