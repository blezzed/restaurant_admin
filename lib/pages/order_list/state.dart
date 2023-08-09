import 'package:get/get.dart';
import 'package:restaurant_admin/common/entities/entities.dart';

class OrderListState{
  var profile = UserData().obs;

  RxDouble appBarTitleOpacity = 0.0.obs;

  RxDouble appBarHeroTitleOpacity = 1.0.obs;
}