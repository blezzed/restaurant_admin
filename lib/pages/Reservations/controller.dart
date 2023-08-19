import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restaurant_admin/common/entities/entities.dart';
import 'package:restaurant_admin/common/store/store.dart';
import 'package:restaurant_admin/pages/Reservations/index.dart';
import 'package:restaurant_admin/pages/home/index.dart';
import 'package:restaurant_admin/pages/order_list/index.dart';

class ReservationsController extends GetxController with GetTickerProviderStateMixin{
  ReservationsController();
  final state = ReservationsState();
  final user_id = UserStore.to.profile.id;

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

  @override
  void onInit(){
    super.onInit();
    tabController = TabController(length: tabs.length, vsync: this);
  }

  @override
  void onClose() {
    tabController.dispose();
    super.onClose();
  }

}