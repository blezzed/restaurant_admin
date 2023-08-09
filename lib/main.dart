import 'package:flutter/material.dart';
import 'package:restaurant_admin/common/routes/pages.dart';
import 'package:restaurant_admin/global.dart';
import 'package:restaurant_admin/responsive.dart';
import 'package:restaurant_admin/theme.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

void main() async {
  await Global.init();
  runApp(MyApp(
      appTheme: AppTheme()
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.appTheme,});

  final AppTheme appTheme;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    print(Get.height);
    print(Get.width);
    return ScreenUtilInit(
        designSize: Responsive.isMobile(context)?Size(360, 720): Responsive.isTablet(context)?Size(1000, 800): Size(1600, 877),
      builder: (context, child) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Restaurant Admin',
          theme: appTheme.light,
          darkTheme: appTheme.dark,
          themeMode: ThemeMode.light,
          initialRoute: AppPages.getInitial(),
          initialBinding: GlobalBindings(),
          getPages: AppPages.routes,
          //home: ,
        );
      }
    );
  }
}

