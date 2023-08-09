
import 'package:get/get.dart';
import 'package:restaurant_admin/pages/dashboard/index.dart';
import 'package:restaurant_admin/pages/home/index.dart';

class HomeBinding implements Bindings{
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(() => HomeController());
    Get.lazyPut<DashboardController>(() => DashboardController());
  }

}