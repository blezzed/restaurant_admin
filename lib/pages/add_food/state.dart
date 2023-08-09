import 'dart:io';

import 'package:get/get.dart';
import 'package:restaurant_admin/common/entities/entities.dart';

class AddFoodState{
  var profile = UserData().obs;

  RxDouble appBarTitleOpacity = 0.0.obs;

  RxDouble appBarHeroTitleOpacity = 1.0.obs;

  final photo = Rx<File?>(null);

  final imgUrl = Rx<String?>(null);

}