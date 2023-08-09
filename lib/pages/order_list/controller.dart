import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restaurant_admin/common/entities/entities.dart';
import 'package:restaurant_admin/common/store/store.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:restaurant_admin/pages/order_list/index.dart';

class OrderListController extends GetxController{
  OrderListController();
  final state = OrderListState();
  final user_id = UserStore.to.profile.id;

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  GlobalKey<ScaffoldState> get scaffoldKey => _scaffoldKey;

  late ScrollController _scrollController;
  ScrollController get scrollController => _scrollController;

  static double kExpandedHeight = 250.h;

  bool get _isSliverAppBarExpanded {
    return _scrollController.hasClients &&
        _scrollController.offset > kExpandedHeight - kToolbarHeight -200;
  }

  void controlMenu() {
    if (!_scaffoldKey.currentState!.isDrawerOpen) {
      _scaffoldKey.currentState!.openDrawer();
    }
  }

  @override
  void onInit(){
    super.onInit();

    _scrollController = ScrollController()
      ..addListener(() {
        state.appBarTitleOpacity.value = _isSliverAppBarExpanded ? 1.0 : 0.0;
        state.appBarHeroTitleOpacity.value = _isSliverAppBarExpanded ? 0.0 : 1.0;
      });
  }

}