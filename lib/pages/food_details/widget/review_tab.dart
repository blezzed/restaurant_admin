import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:restaurant_admin/pages/food_details/index.dart';
import 'package:restaurant_admin/theme.dart';

class ReviewTab extends GetView<FoodDetailsController> {
  ReviewTab({Key? key}) : super(key: key);

  final Tween<Offset> _offset = Tween(begin: Offset(1,0), end: Offset(0, 0));

  @override
  Widget build(BuildContext context) {
    return Obx(() => AnimatedList(
      key: controller.animatedListKey,
        physics: controller.state.scrollReviewList.value? ScrollPhysics(): NeverScrollableScrollPhysics(),
        initialItemCount: controller.state.reviewTileList.length,
        itemBuilder: (context, index, animation){
          return SlideTransition(
            position: animation.drive(_offset),
            child: controller.state.reviewTileList[index]
          );
        }
    ));
  }
}
