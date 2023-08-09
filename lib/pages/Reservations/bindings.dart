
import 'package:get/get.dart';
import 'package:restaurant_admin/pages/Reservations/index.dart';
import 'package:restaurant_admin/pages/dashboard/index.dart';
import 'package:restaurant_admin/pages/home/index.dart';
import 'package:restaurant_admin/pages/order_list/index.dart';

class ReservationsBinding implements Bindings{
  @override
  void dependencies() {
    Get.lazyPut<ReservationsController>(() => ReservationsController());
  }

}