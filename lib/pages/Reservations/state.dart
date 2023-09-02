import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restaurant_admin/common/entities/entities.dart';
import 'package:restaurant_admin/pages/Reservations/widget/widget.dart';

class ReservationsState{
  var profile = UserData().obs;

  RxList<TableTile> reservationTitleList = <TableTile>[].obs;

  Rx<DateTime> today = DateTime.now().obs;

  Rx<DateTime> focusDay = DateTime.now().obs;

  Rx<TimeOfDay> eventFrom = TimeOfDay.now().obs;

  Rx<TimeOfDay> eventTo = TimeOfDay.now().obs;

  RxBool eventWholeDay = true.obs;
}