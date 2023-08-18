import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:restaurant_admin/common/entities/entities.dart';

Widget statusOrderButton(BuildContext context, OrderModel order){
  Rx<Color> color = order.status.value == StatusOrder.newOrder ? Colors.orange.obs:
  order.status.value == StatusOrder.onDelivery ? Colors.blue.obs: Colors.teal.obs;

  return Obx(() => Container(
    height: 30.h,
    decoration: BoxDecoration(
        color: color.value.withOpacity(0.2),
        borderRadius: BorderRadius.circular(10.r)
    ),
    child: DropdownButton<StatusOrder>(
      underline: SizedBox(),
      icon: SizedBox(),
      borderRadius: BorderRadius.circular(10.r),

      padding: EdgeInsets.symmetric(vertical: 0.w, horizontal: 9.w),
      value: order.status.value,
      elevation: 8,
      alignment: AlignmentDirectional.center,
      dropdownColor: Theme.of(context).scaffoldBackgroundColor,
      style: Theme.of(context).textTheme.labelSmall!.copyWith(
        color: color.value,
        fontSize: 12.sp,
      ),
      onChanged: (StatusOrder? newValue) {
        print(newValue);
        order.status.value = newValue!;
        color.value = newValue == StatusOrder.newOrder ? Colors.orange:
        newValue == StatusOrder.onDelivery ? Colors.blue: newValue == StatusOrder.delivered? Colors.teal: Colors.red;
      },
      items: <StatusOrder>{StatusOrder.newOrder, StatusOrder.onDelivery,StatusOrder.delivered,}
          .map<DropdownMenuItem<StatusOrder>>((StatusOrder value) {
        return DropdownMenuItem<StatusOrder>(
          value: value,
          child: Text(
              value.name == StatusOrder.newOrder.name ? "New Order":
              value.name == StatusOrder.onDelivery.name ? "On Delivery": value.name == StatusOrder.delivered.name?"Delivered":"",
              style: Theme.of(context).textTheme.labelSmall!.copyWith(
                color: color.value,
                fontSize: 12.sp,
              )
          ),
        );
      }).toList(),
    ),
  ));
}