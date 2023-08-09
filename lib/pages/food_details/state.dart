import 'package:get/get.dart';
import 'package:restaurant_admin/common/entities/entities.dart';
import 'package:restaurant_admin/pages/food_details/widget/widget.dart';

class FoodDetailsState{
  var profile = UserData().obs;

  RxDouble appBarHeroOpacity = 1.0.obs;

  RxBool scrollReviewList = false.obs;

  RxList<ReviewTile> reviewTileList = <ReviewTile>[].obs;

}