import 'package:flutter/material.dart';
import 'package:restaurant_admin/common/entities/entities.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:restaurant_admin/common/widget/widget.dart';
import 'package:restaurant_admin/pages/food_details/index.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:restaurant_admin/theme.dart';

class ReviewTile extends StatelessWidget {
  ReviewTile({Key? key, required this.reviewData}) : super(key: key);

  ReviewData reviewData;

  @override
  Widget build(BuildContext context) {
    return Card(
      //color: Theme.of(context).primaryColorLight,
      margin: EdgeInsets.only(left: 5.w, right: 5.w, bottom: 10.h),
      child: Container(
        width: double.maxFinite,
        padding: EdgeInsets.all(15.h),
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  height: 50.w,
                  width: 50.w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(40.r),
                    color: Theme.of(context).primaryColorLight,
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage(
                            reviewData.avatar!
                        )
                    )
                  ),
                ),
                SizedBox(width: 15.w,),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      reviewData.name!,
                      style: Theme.of(context).textTheme.labelMedium,
                    ),
                    Text(
                      reviewData.created_at,
                      style: Theme.of(context).textTheme.labelSmall!.copyWith(
                        fontSize: 14.sp,
                        color: AppColors.paraColor
                      ),
                    )
                  ],
                )
              ],
            ),
            SizedBox(height: 10.h,),
            ExpandableTextWidget(text: reviewData.comment!,),
            SizedBox(height: 5.h,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(),
                RatingBar.builder(
                  initialRating: reviewData.rating!,
                  minRating: 1,
                  direction: Axis.horizontal,
                  allowHalfRating: true,
                  itemCount: 5,
                  itemSize: 15.h,
                  ignoreGestures: true,
                  itemPadding: EdgeInsets.symmetric(horizontal: 0.w),
                  itemBuilder: (context, _) => Icon(
                    Icons.star,
                    color: AppColors.yellowColor,
                    size: 15.h,
                  ),
                  onRatingUpdate: (rating) {
                    print(rating);
                  },
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
