import 'package:get/get.dart';
import 'package:restaurant_admin/common/entities/entities.dart';
import 'package:restaurant_admin/pages/Reservations/widget/widget.dart';

class ReservationsState{
  var profile = UserData().obs;

  RxList<TableTile> reservationTitleList = <TableTile>[].obs;
}