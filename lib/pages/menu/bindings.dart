
import 'package:get/get.dart';
import 'package:restaurant_admin/pages/dashboard/index.dart';
import 'package:restaurant_admin/pages/home/index.dart';
import 'package:restaurant_admin/pages/menu/index.dart';
import 'package:restaurant_admin/pages/order_list/index.dart';

class MenuListBinding implements Bindings{
  @override
  void dependencies() {
    Get.lazyPut<MenuListController>(() => MenuListController());
  }

}