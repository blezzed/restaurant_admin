import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:restaurant_admin/pages/food_details/index.dart';
import 'package:restaurant_admin/theme.dart';

class AboutTab extends GetView<FoodDetailsController> {
  const AboutTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 20.w, right: 10.w),
      margin: EdgeInsets.only(top: 10.h),
      height: 630.h,
      width: double.maxFinite,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              "Description",
              style: Theme.of(context).textTheme.labelMedium,
            ),
            SizedBox(height: 10,),
            Text(
              controller.product!.description!,
              style: Theme.of(context).textTheme.labelSmall!.copyWith(
                color: AppColors.paraColor,
                fontWeight: FontWeight.normal,
                fontSize: 14.sp
              ),
            ),
            SizedBox(height: 15,),
            Text(
              "Ingredients",
              style: Theme.of(context).textTheme.labelMedium,
            ),
            SizedBox(height: 10,),
            Text(
              controller.product!.description!,
              style: Theme.of(context).textTheme.labelSmall!.copyWith(
                  color: AppColors.paraColor,
                  fontWeight: FontWeight.normal,
                  fontSize: 14.sp
              ),
            ),
          ],
        ),
      ),
    );
  }
}
