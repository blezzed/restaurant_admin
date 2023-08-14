import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:restaurant_admin/common/entities/entities.dart';
import 'package:restaurant_admin/theme.dart';

class TableContents extends TableRow {
  OrderModel order;

  TableContents({Key? key, required this.order});

  TableRow build(BuildContext context) {
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
              "${order.name} ${order.lastName}",
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
            child: _statusOrderButton(context, order.status.value),
          ),
        ]
    );
  }
}


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
            "${order.name} ${order.lastName}",
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
          child: _statusOrderButton(context, order.status.value),
        ),
      ]
  );
}

TableRow orderIdColumn (BuildContext context, {required String id, VoidCallback? onTap}){
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
                        text: id,
                        recognizer: TapGestureRecognizer()..onTap = (){
                          print(id);
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

Widget _statusOrderButton(BuildContext context, StatusOrder status){
  Rx<Color> color = status == StatusOrder.newOrder ? Colors.orange.obs:
  status == StatusOrder.onDelivery ? Colors.blue.obs: Colors.teal.obs;

  return Obx(() => Container(
    //padding: EdgeInsets.symmetric(vertical: 0.h, horizontal: 9.w),
    decoration: BoxDecoration(
        color: color.value.withOpacity(0.2),
        borderRadius: BorderRadius.circular(15.r)
    ),
    child: DropdownButton<StatusOrder>(
      underline: SizedBox(),
      icon: SizedBox(),
      borderRadius: BorderRadius.circular(15.r),
      style: Theme.of(context).textTheme.labelSmall!.copyWith(
        color: color.value,
        fontSize: 12.sp,
      ),
      padding: EdgeInsets.symmetric(vertical: 0.w, horizontal: 9.w),
      value: status,
      elevation: 5,
      onChanged: (StatusOrder? newValue) {
        print(newValue);
        status = newValue!;
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