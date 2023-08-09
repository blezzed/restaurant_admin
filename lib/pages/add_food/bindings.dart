
import 'package:get/get.dart';
import 'package:restaurant_admin/pages/add_food/index.dart';
import 'package:restaurant_admin/pages/dashboard/index.dart';
import 'package:restaurant_admin/pages/home/index.dart';
import 'package:restaurant_admin/pages/order_list/index.dart';

class AddFoodBinding implements Bindings{
  @override
  void dependencies() {
    Get.lazyPut<AddFoodController>(() => AddFoodController());
  }

}