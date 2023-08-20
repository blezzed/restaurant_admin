import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restaurant_admin/common/entities/entities.dart';
import 'package:restaurant_admin/common/store/store.dart';
import 'package:restaurant_admin/pages/Reservations/index.dart';
import 'package:restaurant_admin/pages/Reservations/widget/table_tile.dart';
import 'package:restaurant_admin/pages/home/index.dart';
import 'package:restaurant_admin/pages/order_list/index.dart';

class ReservationsController extends GetxController with GetTickerProviderStateMixin{
  ReservationsController();
  final state = ReservationsState();
  final user_id = UserStore.to.profile.id;

  late RxList<ReservationModel> reservationList;

  late TabController tabController;

  final List<Tab> tabs = <Tab>[
    const Tab(text: "Tables",),
    const Tab(text: "Events",),
  ].obs;

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  GlobalKey<ScaffoldState> get scaffoldKey => _scaffoldKey;

  void controlMenu() {
    if (!_scaffoldKey.currentState!.isDrawerOpen) {
      _scaffoldKey.currentState!.openDrawer();
    }
  }

  List<CartModel> cartList = [
    CartModel(id: 1, quantity: 2.obs,product: ProductModel(id: 1, name: "Pancakes", img: "assets/images/Pancakes.jpg", stars: 4.5, price: 10.0, category: Category.food, description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged."),),
    CartModel(id: 2, quantity: 3.obs,product: ProductModel(id: 2, name: "Chicken Tinga Tacos", img: "assets/images/Chicken_Tinga_Tacos.jpg", stars: 4.0, price: 10.0, category: Category.food, description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged."),),
    CartModel(id: 3, quantity: 5.obs,product: ProductModel(id: 3, name: "Creamy tzatziki", img: "assets/images/Creamy_tzatziki.jpg", stars: 3.5, price: 10.0, category: Category.food, description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged."),),
    CartModel(id: 4, quantity: 1.obs,product: ProductModel(id: 4, name: "Jack Daniels Burgers", img: "assets/images/Jack_Daniels_Burgers.jpg", stars: 4.0, price: 10.0, category: Category.food, description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged."),),
    CartModel(id: 5, quantity: 2.obs,product: ProductModel(id: 5, name: "Tostadas Pizza", img: "assets/images/Tostadas_Pizza.jpg", stars: 3.0, price: 10.0, category: Category.food, description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged."),),
  ];

  void renderReservationList(DateTime day){
    state.reservationTitleList.value =[];
    reservationList.sort((a, b) {
      var aName = a.slot!.toLowerCase();
      var bName = b.slot!.toLowerCase();
      return aName.compareTo(bName);
    });
    var reservationDay = reservationList.where((i) => i.reservationDate == day).toList();
    for (var element in reservationDay) {
      state.reservationTitleList.add(TableTile(reservation: element));
    }
  }

  @override
  void onInit(){
    super.onInit();
    tabController = TabController(length: tabs.length, vsync: this);

    reservationList = [
      ReservationModel(id: 1, customer: UserData(name: "Putra", surname: "Reuss",), people: 2, tableNumber: 1, slot: "12:00 - 13:00", status: Reason.business.obs, reservationDate: DateTime.parse("2023-08-20 00:00:00.000"), createdAt: DateTime.now(), cart: cartList),
      ReservationModel(id: 2, customer: UserData(name: "Mikasa", surname: "Ackerman",), people: 3, tableNumber: 1, slot: "12:00 - 13:00", status: Reason.others.obs, reservationDate: DateTime.parse("2023-08-21 00:00:00.000"), createdAt: DateTime.now(), cart: cartList),
      ReservationModel(id: 3, customer: UserData(name: "Ronald", surname: "Jamez",), people: 4, tableNumber: 2, slot: "12:00 - 13:00", status: Reason.business.obs, reservationDate: DateTime.parse("2023-08-20 00:00:00.000"), createdAt: DateTime.now(), cart: cartList),
      ReservationModel(id: 4, customer: UserData(name: "Levi", surname: "Snow",), people: 4, tableNumber: 3, slot: "18:00 - 19:00", status: Reason.business.obs, reservationDate: DateTime.parse("2023-08-20 00:00:00.000"), createdAt: DateTime.now(), cart: cartList),
      ReservationModel(id: 5, customer: UserData(name: "Ronald", surname: "Jamez",), people: 2, tableNumber: 3, slot: "13:00 - 14:00", status: Reason.date.obs, reservationDate: DateTime.parse("2023-08-20 00:00:00.000"), createdAt: DateTime.now(), cart: cartList),
      ReservationModel(id: 6, customer: UserData(name: "Linda", surname: "Reuss",), people: 4, tableNumber: 2, slot: "15:00 - 18:00", status: Reason.business.obs, reservationDate: DateTime.parse("2023-08-21 00:00:00.000"), createdAt: DateTime.now(), cart: cartList),
      ReservationModel(id: 7, customer: UserData(name: "Linda", surname: "Reuss",), people: 1, tableNumber: 1, slot: "10:00 - 11:00", status: Reason.others.obs, reservationDate: DateTime.parse("2023-08-23 00:00:00.000"), createdAt: DateTime.now(), cart: cartList),
      ReservationModel(id: 8, customer: UserData(name: "Amanda", surname: "Yeager",), people: 4, tableNumber: 2, slot: "20:00 - 21:00", status: Reason.family.obs, reservationDate: DateTime.parse("2023-08-20 00:00:00.000"), createdAt: DateTime.now(), cart: cartList),
      ReservationModel(id: 9, customer: UserData(name: "Putra", surname: "Reuss",), people: 2, tableNumber: 1, slot: "20:00 - 21:00", status: Reason.date.obs, reservationDate: DateTime.parse("2023-08-21 00:00:00.000"), createdAt: DateTime.now(), cart: cartList),
    ].obs;

    renderReservationList(DateTime.now().copyWith(
      hour: 0,
      minute: 0,
      second: 0,
      microsecond: 0,
      millisecond: 0
    ));
  }

  @override
  void onClose() {
    tabController.dispose();
    super.onClose();
  }

}