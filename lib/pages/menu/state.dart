import 'package:get/get.dart';
import 'package:restaurant_admin/common/entities/entities.dart';
import 'package:restaurant_admin/pages/menu/widget/widget.dart';

class MenuListState{
  var profile = UserData().obs;

  RxDouble appBarTitleOpacity = 0.0.obs;

  RxDouble appBarHeroTitleOpacity = 1.0.obs;

  RxList<MenuTile> menuTitleList = <MenuTile>[].obs;
}