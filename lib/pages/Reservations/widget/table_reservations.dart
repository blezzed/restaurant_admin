import 'package:easy_date_timeline/easy_date_timeline.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:restaurant_admin/pages/Reservations/index.dart';
import 'package:restaurant_admin/pages/Reservations/widget/widget.dart';

class TableReservations extends GetView<ReservationsController> {
  const TableReservations({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() => CustomScrollView(
      slivers: [
        SliverAppBar(
          toolbarHeight: 180.h,
          backgroundColor: Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(topLeft: Radius.circular(50.r))
          ),
          title: EasyDateTimeLine(
            initialDate: DateTime.now(),
            onDateChange: (selectedDate) {
              print(selectedDate);
              controller.renderReservationList(selectedDate);
            },
            activeColor: Theme.of(context).primaryColor,
            headerProps: const EasyHeaderProps(
              monthPickerType: MonthPickerType.switcher,
              selectedDateFormat: SelectedDateFormat.fullDateDMY,
            ),
            dayProps: EasyDayProps(
              activeBorderRadius: 32.0.r,
              inactiveBorderRadius: 32.0.r,
            ),
            timeLineProps: EasyTimeLineProps(
              hPadding: 15.h, // padding from left and right
              separatorPadding: 15.w, // padding between days
            ),
          ),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate(
            childCount: controller.state.reservationTitleList.length,
                (context, index) {
              return controller.state.reservationTitleList[index];
            },
          ),
        )
      ],
    ));
  }
}
