import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restaurant_admin/common/entities/entities.dart';
import 'package:restaurant_admin/common/store/store.dart';
import 'package:restaurant_admin/pages/home/index.dart';

class HomeController extends GetxController{
  HomeController();
  final state = HomeState();
  final user_id = UserStore.to.profile.id;

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  GlobalKey<ScaffoldState> get scaffoldKey => _scaffoldKey;

  late final PageController pageController;
  late final List<BottomNavigationBarItem> bottomTabs;

  void controlMenu() {
    if (!_scaffoldKey.currentState!.isDrawerOpen) {
      _scaffoldKey.currentState!.openDrawer();
    }
  }

  void handlePageChanged (int index){
    state.page.value = index;
  }

  void handleNavBarTap(int index){
    pageController.jumpToPage(index);
  }


  @override
  void onInit(){
    super.onInit();
    state.tabTitles.value = ["Home", "Order", "Chat", "Profile"];

    pageController = PageController(initialPage: state.page.value);
  }

}