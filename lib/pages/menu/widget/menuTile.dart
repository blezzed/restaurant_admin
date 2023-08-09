import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:restaurant_admin/common/entities/entities.dart';
import 'package:restaurant_admin/pages/menu/index.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:restaurant_admin/theme.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class MenuTile extends GetView<MenuListController> {
  const MenuTile({Key? key, required this.product}) : super(key: key);

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Get.toNamed("/food_details",
            parameters: {
              "product": jsonEncode(product.toJson()),
            }
        );
      },
      child: Container(
        width: double.maxFinite,
        height: 300.h,
        margin: EdgeInsets.only(left: 10.w, right: 10.w),
        padding: EdgeInsets.only(left: 10.w, right: 10.w),
        child: Stack(
          children: [
            Container(
              width: double.maxFinite,
              height: 210.h,
              margin: EdgeInsets.only(top: 80.h),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.secondaryContainer.withOpacity(0.2),
                borderRadius: BorderRadius.circular(10.r),
              ),
            ),
            Positioned(
              top: 10.h,
              right: 30.w,
              child: Container(
                width: 180.w,
                height: 180.w,
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.secondaryContainer,
                  borderRadius: BorderRadius.circular(100.r),
                  boxShadow: const [
                    BoxShadow(
                      color: Color(0xFFa9a29f),
                      blurRadius: 5,
                      offset: Offset(5, 5)
                    )
                  ],
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage(
                      product.img!,
                    )
                  )
                ),
              ),
            ),
            Positioned(
              bottom: 20.h,
              left: 10.w,
              child: Container(
                height: 85.h,
                width: 290.w,
                constraints: BoxConstraints(
                  maxWidth: 280.w
                ),
                padding: EdgeInsets.only(top: 10.h),
                child: Column(
                  children: [
                    RatingBar.builder(
                      initialRating: product.stars!,
                      minRating: 1,
                      direction: Axis.horizontal,
                      allowHalfRating: true,
                      itemCount: 5,
                      itemSize: 20.w,
                      ignoreGestures: true,
                      itemPadding: EdgeInsets.symmetric(horizontal: 0.w),
                      itemBuilder: (context, _) => Icon(
                        Icons.star,
                        color: AppColors.yellowColor,
                        size: 15.w,
                      ),
                      onRatingUpdate: (rating) {
                      },
                    ),
                    Text(
                      product.name!,
                      style: Theme.of(context).textTheme.labelLarge,
                    ),
                    //SizedBox(height: 5.h,),
                    Text(
                      "Price: \$${product.price!.toStringAsFixed(2)}",
                      style: Theme.of(context).textTheme.labelSmall!.copyWith(
                        color: AppColors.paraColor
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              top: 90.h,
              left: 20.w,
              child: Column(
                children: [
                  Material(
                    borderRadius: BorderRadius.circular(10.r),
                    color: Colors.red[100],
                    child: InkWell(
                      onTap: (){
                        controller.removeMenu(product);
                      },
                      borderRadius: BorderRadius.circular(10.r),
                      child: Container(
                        padding: EdgeInsets.all(10.w),
                        decoration: const BoxDecoration(
                        ),
                        child: SvgPicture.asset(
                          "assets/icons/bin.svg",
                          colorFilter: const ColorFilter.mode(Colors.red, BlendMode.srcIn),
                          height: 20.h,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 15.h,),
                  Material(
                    borderRadius: BorderRadius.circular(10.r),
                    color: Colors.blue[100],
                    child: InkWell(
                      onTap: (){

                      },
                      borderRadius: BorderRadius.circular(10.r),
                      child: Container(
                        padding: EdgeInsets.all(10.w),
                        decoration: const BoxDecoration(
                        ),
                        child: SvgPicture.asset(
                          "assets/icons/edit_menu.svg",
                          colorFilter: const ColorFilter.mode(Colors.blue, BlendMode.srcIn),
                          height: 20.h,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
