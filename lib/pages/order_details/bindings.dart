
import 'package:get/get.dart';
import 'package:restaurant_admin/pages/order_details/index.dart';

class OrderDetailsBinding implements Bindings{
  @override
  void dependencies() {
    Get.lazyPut<OrderDetailsController>(() => OrderDetailsController());
  }

}