import 'dart:convert';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:restaurant_admin/common/entities/entities.dart';
import 'package:restaurant_admin/theme.dart';


TableRow tableContents (BuildContext context, OrderModel order){
  var tableCellStyle = Theme.of(context).textTheme.labelSmall!.copyWith( fontSize: 12.sp,);

  return TableRow(
      decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.secondaryContainer.withOpacity(0.1)
      ),
      children: [
        Padding(
          padding: EdgeInsets.symmetric(vertical: 20.w, horizontal: 10.w),
          child: Text(
            "26 Mar 23, 12:42",
            style: tableCellStyle,
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 5.w),
          child: Text(
            "${order.customer!.name} ${order.customer!.surname}",
            style: tableCellStyle,
          ),
        ),
        Text(
          order.location!,
          style: tableCellStyle,
        ),
        Text(
          "\$154.53",
          style: tableCellStyle,
        ),
        Center(
          child: _statusOrderButton(context, order),
        ),
      ]
  );
}

TableRow orderIdColumn (BuildContext context, {required OrderModel order, }){
  var tableCellStyle = Theme.of(context).textTheme.labelSmall!.copyWith( fontSize: 12.sp,);
  return TableRow(
      decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.secondaryContainer.withOpacity(0.1),
          border: Border(right: BorderSide(
              color: Theme.of(context).primaryColor.withOpacity(0.5)
          ))
      ),
      children: [
        Container(
          padding: EdgeInsets.symmetric(vertical: 20.w),
          child: Center(
              child: RichText(
                text: TextSpan(
                  style: Theme.of(context).textTheme.labelSmall!.copyWith(
                      color: AppColors.paraColor
                  ),
                  children: <TextSpan>[
                    TextSpan(text: '#', style: tableCellStyle),
                    TextSpan(
                        text: order.id.toString(),
                        recognizer: TapGestureRecognizer()..onTap = (){
                          Get.toNamed("/order_details",
                            arguments: {
                            "order": jsonEncode(order.toJson())
                            }
                          );
                        },
                        style: Theme.of(context).textTheme.labelSmall!.copyWith(
                            color: Colors.blue,
                            fontSize: 12.sp
                        )),
                  ],
                ),
              )
          ),
        ),
      ]
  );
}

Widget _statusOrderButton(BuildContext context, OrderModel order){
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