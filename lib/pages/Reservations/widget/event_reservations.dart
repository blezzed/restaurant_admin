import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:restaurant_admin/common/entities/entities.dart';
import 'package:restaurant_admin/pages/Reservations/index.dart';
import 'package:restaurant_admin/theme.dart';
import 'package:table_calendar/table_calendar.dart';

class EventReservations extends GetView<ReservationsController> {
  const EventReservations({Key? key}) : super(key: key);

  Widget _buildNameTextFormField(
      {context,
      required String hintText,
      required TextEditingController controller,
      TextInputType? keybordType,
      int maxLines = 1}) {
    return Container(
      margin: EdgeInsets.only(top: 15.h, left: 5.w, right: 5.w),
      padding: EdgeInsets.only(left: 10.w, right: 10.w),
      width: double.maxFinite,
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(20.w),
        //border: Border.all(color: Theme.of(context).primaryColor.withOpacity(0.5)),
      ),
      child: TextField(
        controller: controller,
        keyboardType: TextInputType.name,
        maxLines: maxLines,
        textCapitalization: TextCapitalization.words,
        style: Theme.of(context).textTheme.labelSmall,
        decoration: InputDecoration(
            hintText: hintText,
            enabledBorder: InputBorder.none,
            focusedBorder: InputBorder.none),
      ),
    );
  }

  Widget _eventTile(
      {required BuildContext context, required EventModel event}) {
    return Container(
      width: double.maxFinite,
      margin: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
      padding: EdgeInsets.all(10.h),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(10.r)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            event.title!,
            style: Theme.of(context).textTheme.labelMedium,
          ),
          SizedBox(
            height: 5.h,
          ),
          Container(
            constraints: BoxConstraints(maxWidth: 300.w),
            child: Wrap(
              children: [
                Text(
                  event.description!,
                  style: Theme.of(context)
                      .textTheme
                      .labelSmall!
                      .copyWith(color: AppColors.paraColor, fontSize: 14.sp),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 10.h,
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 6.h),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.r),
                color: Theme.of(context)
                    .colorScheme
                    .secondaryContainer
                    .withAlpha(60)),
            child: Text(
              event.from == null && event.to == null
                  ? "24 hours"
                  : "${event.from!.format(context)} - ${event.to!.format(context)}",
              style: Theme.of(context)
                  .textTheme
                  .labelSmall!
                  .copyWith(color: AppColors.paraColor, fontSize: 14.sp),
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    _showAddDialog() async {
      await showDialog(
          context: context,
          builder: (context) => AlertDialog(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.r))),
                backgroundColor: Colors.white,
                title: Text(
                  "Add Event",
                  style: Theme.of(context).textTheme.labelLarge,
                ),
                content: Builder(builder: (context) {
                  return Obx(() => SingleChildScrollView(
                        child: SizedBox(
                          height: controller.state.eventWholeDay.value
                              ? 250.h
                              : 380.h,
                          child: Column(
                            children: [
                              _buildNameTextFormField(
                                  context: context,
                                  hintText: "Title",
                                  controller: controller.eventTitleController,
                                  keybordType: TextInputType.name),
                              _buildNameTextFormField(
                                  context: context,
                                  hintText: "Description",
                                  controller:
                                      controller.eventDescriptionController,
                                  keybordType: TextInputType.multiline,
                                  maxLines: 5),
                              Row(
                                children: [
                                  Transform.scale(
                                    scale: 1.2,
                                    child: Checkbox(
                                        value: controller
                                            .state.eventWholeDay.value,
                                        onChanged: (bool? value) {
                                          controller.state.eventWholeDay.value =
                                              value!;
                                        }),
                                  ),
                                  SizedBox(
                                    width: 10.w,
                                  ),
                                  Text(
                                    "The whole day ",
                                    style: Theme.of(context)
                                        .textTheme
                                        .labelMedium!
                                        .copyWith(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .secondary,
                                        ),
                                  )
                                ],
                              ),
                              AnimatedSwitcher(
                                duration: const Duration(seconds: 1),
                                child: controller.state.eventWholeDay.value
                                    ? const SizedBox()
                                    : Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          SizedBox(
                                            height: 10.h,
                                          ),
                                          Text(
                                            "From",
                                            style: Theme.of(context)
                                                .textTheme
                                                .labelMedium!
                                                .copyWith(
                                                  color: Theme.of(context)
                                                      .colorScheme
                                                      .secondary
                                                      .withAlpha(40),
                                                ),
                                          ),
                                          InkWell(
                                            onTap: () {
                                              showTimePicker(
                                                      context: context,
                                                      initialTime:
                                                          TimeOfDay.now())
                                                  .then((value) {
                                                controller.state.eventFrom
                                                    .value = value!;
                                              });
                                            },
                                            child: Container(
                                              width: double.maxFinite,
                                              height: 35.h,
                                              decoration: BoxDecoration(
                                                  color: Theme.of(context)
                                                      .colorScheme
                                                      .surfaceVariant,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10.r)),
                                              child: Center(
                                                child: Text(
                                                  controller
                                                      .state.eventFrom.value
                                                      .format(context),
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .labelMedium!
                                                      .copyWith(
                                                          color: Theme.of(
                                                                  context)
                                                              .primaryColor),
                                                ),
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            height: 10.h,
                                          ),
                                          Text(
                                            "To ",
                                            style: Theme.of(context)
                                                .textTheme
                                                .labelMedium!
                                                .copyWith(
                                                  color: Theme.of(context)
                                                      .colorScheme
                                                      .secondary
                                                      .withAlpha(40),
                                                ),
                                          ),
                                          InkWell(
                                            onTap: () {
                                              showTimePicker(
                                                      context: context,
                                                      initialTime:
                                                          TimeOfDay.now())
                                                  .then((value) {
                                                controller.state.eventFrom
                                                    .value = value!;
                                              });
                                            },
                                            child: Container(
                                              width: double.maxFinite,
                                              height: 35.h,
                                              decoration: BoxDecoration(
                                                  color: Theme.of(context)
                                                      .colorScheme
                                                      .surfaceVariant,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10.r)),
                                              child: Center(
                                                child: Text(
                                                  controller.state.eventTo.value
                                                      .format(context),
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .labelMedium!
                                                      .copyWith(
                                                          color: Theme.of(
                                                                  context)
                                                              .primaryColor),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                              ),
                            ],
                          ),
                        ),
                      ));
                }),
                actions: <Widget>[
                  TextButton(
                    child: Text("Save",
                        style: Theme.of(context)
                            .textTheme
                            .labelMedium!
                            .copyWith(color: Theme.of(context).primaryColor)),
                    onPressed: () {
                      controller.addEvent();
                      Navigator.pop(context);
                    },
                  )
                ],
              ));
    }

    return Obx(() => Scaffold(
          backgroundColor: Colors.transparent,
          body: SingleChildScrollView(
            child: Column(
              children: [
                TableCalendar(
                  firstDay: DateTime.utc(2010, 10, 16),
                  lastDay: DateTime.utc(2030, 3, 14),
                  focusedDay: controller.state.today.value,
                  rowHeight: 40.h,
                  headerStyle: HeaderStyle(
                      formatButtonVisible: false,
                      titleCentered: true,
                      titleTextStyle: Theme.of(context).textTheme.labelSmall!),
                  calendarStyle: CalendarStyle(
                      defaultTextStyle: Theme.of(context)
                          .textTheme
                          .labelSmall!
                          .copyWith(fontSize: 12.sp)),
                  availableGestures: AvailableGestures.all,
                  selectedDayPredicate: (day) =>
                      isSameDay(day, controller.state.today.value),
                  calendarBuilders: CalendarBuilders(
                    selectedBuilder: (context, date, events) => Container(
                        margin: EdgeInsets.all(4.h),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            color: Theme.of(context).primaryColor,
                            borderRadius: BorderRadius.circular(10.r)),
                        child: Text(
                          date.day.toString(),
                          style: Theme.of(context)
                              .textTheme
                              .labelSmall!
                              .copyWith(color: Colors.white, fontSize: 12.sp),
                        )),
                    todayBuilder: (context, date, events) => Container(
                        margin: EdgeInsets.all(4.h),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            color: Theme.of(context).primaryColor.withAlpha(70),
                            borderRadius: BorderRadius.circular(10.r)),
                        child: Text(
                          date.day.toString(),
                          style: Theme.of(context)
                              .textTheme
                              .labelSmall!
                              .copyWith(
                                  color: Theme.of(context).primaryColor,
                                  fontSize: 12.sp),
                        )),
                  ),
                  onDaySelected: controller.onDaySelected,
                  eventLoader: controller.getEventsFromDay,
                ),
                SizedBox(
                  height: 10.h,
                ),
                ...controller
                    .getEventsFromDay(controller.state.today.value)
                    .map((EventModel event) =>
                        _eventTile(context: context, event: event))
              ],
            ),
          ),
          floatingActionButton: FloatingActionButton(
            backgroundColor: Theme.of(context).primaryColor,
            onPressed: _showAddDialog,
            child: const Icon(
              Icons.add,
              color: Colors.white,
            ),
          ),
        ));
  }
}
