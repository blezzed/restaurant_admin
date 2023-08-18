import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restaurant_admin/common/entities/entities.dart';

class OrderDetailsState{
  var profile = UserData().obs;

  RxBool locationView = false.obs;

  RxBool orderView = true.obs;

  RxBool flipContainer = true.obs;


  Rx<Color> containerColor = Colors.transparent.obs;

  RxDouble orderOpacity = 1.0.obs;

  RxDouble locationOpacity = 0.0.obs;

  RxBool deleteOrder = false.obs;
}