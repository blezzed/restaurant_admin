import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:restaurant_admin/common/entities/entities.dart';
import 'package:restaurant_admin/pages/dashboard/index.dart';
import 'package:restaurant_admin/responsive.dart';
import 'package:restaurant_admin/theme.dart';

class CustomerReview extends GetView<DashboardController>  {
  const CustomerReview({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: SizedBox(
            height: Responsive.isMobile(context)?200.h: Responsive.isTablet(context)?300.h:250.h,
            width: double.maxFinite,
            child: ListView.separated(
              controller: controller.scrollController,
              separatorBuilder: (context, index) => SizedBox(width: 20.w,),
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: controller.customerReview.length,
              itemBuilder: (context, index){
                var _review = controller.customerReview[index];
                return review(context, _review);
              },
            ),
          ),
        ),
      ],
    );
  }

  Widget review(context, ReviewData reviewData) {
    return Container(
      width: (Responsive.isMobile(context))?400.w: Responsive.isTablet(context)?350.w: 400.w,
      child: Stack(
        children: [
          Container(
            height: Responsive.isMobile(context)?220.h: Responsive.isTablet(context)?220.h:200.h,
            width: (Responsive.isMobile(context))?300.w: Responsive.isTablet(context)?300.w: 350.w,
            margin: EdgeInsets.only(top: 50.h),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20.r)
            ),
          ),
          Positioned(
            top: 50.h,
            right: 0,
            child: Container(
              height: (Responsive.isMobile(context))?100.w: Responsive.isTablet(context)?100.w: 120.w,
              width: (Responsive.isMobile(context))?100.w: Responsive.isTablet(context)?100.w: 120.w,
              margin: EdgeInsets.only(top: 40.h),
              decoration: BoxDecoration(
                color: Theme.of(context).secondaryHeaderColor,
                borderRadius: BorderRadius.circular(1000.r),
                  boxShadow: [
                    BoxShadow(
                      color: Color(0xFFe8e8e8),
                      blurRadius: 2.0,
                      offset: Offset(0, 3),
                    ),
                  ],
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage(
                    reviewData.product_img!
                  )
                )
              ),
            ),
          ),
          Positioned(
            top: 40.h,
            left: 0,
            child: Container(
              height: Responsive.isMobile(context)?250.h: Responsive.isTablet(context)?250.h:200.h,
              width: (Responsive.isMobile(context))?250.w: Responsive.isTablet(context)?250.w: 280.w,
              constraints: BoxConstraints(
                  maxWidth: (Responsive.isMobile(context))?250.w: Responsive.isTablet(context)?250.w: 280.w
              ),
              padding: EdgeInsets.only(left: Responsive.isMobile(context)?40.w: 20.w, top: Responsive.isMobile(context)?40.w: 20.w, right: 10.w, bottom: 0.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                        width: (Responsive.isMobile(context))?35.w: Responsive.isTablet(context)?25.w:35.w,
                        height: (Responsive.isMobile(context))?35.w: Responsive.isTablet(context)?25.w:35.w,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100.r),
                            image: DecorationImage(
                                fit: BoxFit.cover,
                                image: AssetImage(
                                    reviewData.avatar!
                                )
                            )
                        ),
                      ),
                      SizedBox(width: 20.w,),
                      Text(
                        reviewData.name!,
                        style: Theme.of(context).textTheme.labelMedium!.copyWith(
                          overflow: TextOverflow.ellipsis,
                          fontSize: (Responsive.isMobile(context))?14.sp: Responsive.isTablet(context)?14.sp:18.sp
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: 10.h,),
                  SizedBox(
                    //height: 70.h,
                    child: Wrap(
                      children: [
                        Text(
                          reviewData.comment!,
                          maxLines: 4,
                          style: Theme.of(context).textTheme.labelSmall!.copyWith(
                            color: AppColors.paraColor,
                            overflow: TextOverflow.ellipsis,
                            fontSize: (Responsive.isMobile(context))?14.sp: Responsive.isTablet(context)?12.sp:14.sp,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 10.h,),
                  Row(
                    children: [
                      Container(
                        constraints: BoxConstraints(
                          maxWidth: (Responsive.isMobile(context))?150.w: Responsive.isTablet(context)?150.w: 200.w
                        ),
                        child: Text(
                          reviewData.product_name!,
                          style: Theme.of(context).textTheme.labelSmall!.copyWith(
                            fontWeight: FontWeight.bold,
                            overflow: TextOverflow.ellipsis,
                            color: AppColors.textGrey,
                            fontSize: (Responsive.isMobile(context))?12.sp: Responsive.isTablet(context)?12.sp:14.sp,
                          ),
                        ),
                      ),
                      SizedBox(width: 10.h,),
                      Text(
                        reviewData.created_at,
                        style: Theme.of(context).textTheme.labelSmall!.copyWith(
                            color: AppColors.paraColor,
                          fontSize: (Responsive.isMobile(context))?12.sp: Responsive.isTablet(context)?12.sp:14.sp,
                        ),
                      )
                    ],
                  ),
                  //SizedBox(height: 10.h,),
                  Row(
                    children: [
                      RatingBar.builder(
                        initialRating: reviewData.rating!,
                        minRating: 1,
                        direction: Axis.horizontal,
                        allowHalfRating: true,
                        itemCount: 5,
                        itemSize: (Responsive.isMobile(context))?60.w: Responsive.isTablet(context)?14.w:16.w,
                        ignoreGestures: true,
                        itemPadding: EdgeInsets.symmetric(horizontal: 0.w),
                        itemBuilder: (context, _) => Icon(
                          Icons.star,
                          color: AppColors.yellowColor,
                          size: (Responsive.isMobile(context))?12.w: Responsive.isTablet(context)?14.w:16.w,
                        ),
                        onRatingUpdate: (rating) {
                          print(rating);
                        },
                      ),
                      SizedBox(width: Responsive.isMobile(context)?40.w:15.w,),
                      Text(
                        reviewData.rating.toString(),
                        style: Theme.of(context).textTheme.labelSmall!.copyWith(
                          color: AppColors.paraColor,
                          fontSize: (Responsive.isMobile(context))?60.sp: Responsive.isTablet(context)?12.sp:14.sp
                        ),
                      )
                    ],
                  ),

                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
