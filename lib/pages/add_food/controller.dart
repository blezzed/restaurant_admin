import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restaurant_admin/common/entities/entities.dart';
import 'package:restaurant_admin/common/store/store.dart';
import 'package:restaurant_admin/pages/add_food/index.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddFoodController extends GetxController{
  AddFoodController();
  final state = AddFoodState();
  final user_id = UserStore.to.profile.id;

  late ScrollController _scrollController;
  ScrollController get scrollController => _scrollController;

  final nameController = TextEditingController();
  final descriptionController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  Category? category ;

  static double kExpandedHeight = 250.h;

  bool get _isSliverAppBarExpanded {
    return _scrollController.hasClients &&
        _scrollController.offset > kExpandedHeight - kToolbarHeight -50;
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