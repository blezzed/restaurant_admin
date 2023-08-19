import 'package:easy_date_timeline/easy_date_timeline.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:restaurant_admin/pages/Reservations/index.dart';
import 'package:restaurant_admin/pages/Reservations/widget/widget.dart';

class TableReservations extends StatelessWidget {
  const TableReservations({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          toolbarHeight: 180.h,
          backgroundColor: Colors.transparent,
          title: EasyDateTimeLine(
            initialDate: DateTime.now(),
            onDateChange: (selectedDate) {
              //[selectedDate] the new date selected.
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
            childCount: 3,
                (context, index) {
              return TableTile();
            },
          ),
        )
      ],
    );
  }
}
