import 'package:get/get.dart';
import 'package:restaurant_admin/common/entities/entities.dart';

class HomeState{
  var profile = UserData().obs;

  Rx<int> page = 0.obs;

  RxList<String> tabTitles = <String>[].obs;

}