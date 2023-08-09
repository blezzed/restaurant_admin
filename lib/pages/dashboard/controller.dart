import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restaurant_admin/common/entities/entities.dart';
import 'package:restaurant_admin/common/store/store.dart';
import 'package:restaurant_admin/pages/dashboard/index.dart';

class DashboardController extends GetxController{
  DashboardController();
  final state = DashboardState();
  final user_id = UserStore.to.profile.id;

  late ScrollController scrollController;
  RxBool _scrollAccept = false.obs;

  void _reachEnd() {
    if (scrollController.offset>= scrollController.position.maxScrollExtent && !scrollController.position.outOfRange){
      _scrollAccept.value = true;
    }
  }


  List statusCard = [
    StatusStorageInfo(
      title: "Total Orders",
      svgSrc: "assets/icons/card_receipt.svg",
      value: "75",
      percentage: 35,
    ),
    StatusStorageInfo(
      title: "Total Delivery",
      svgSrc: "assets/icons/card_package.svg",
      value: "357",
      percentage: 35,
    ),
    StatusStorageInfo(
      title: "Total Canceled",
      svgSrc: "assets/icons/card_receipt_cancel.svg",
      value: "65",
      percentage: 10,
    ),
    StatusStorageInfo(
      title: "Total Revenue",
      svgSrc: "assets/icons/card_shopping_bag.svg",
      value: "\$128",
      percentage: 78,
    ),
  ];
  
  List customerReview = [
    ReviewData(id: 1, name: "James", avatar: "assets/images/james.jpg", comment: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.", product_name: "Pancakes", product_img: "assets/images/Pancakes.jpg", rating: 4.5, created_at: "2 days"),
    ReviewData(id: 2, name: "Rick", avatar: "assets/images/rick.jpg", comment: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.", product_name: "Chicken Tinga Tacos", product_img: "assets/images/Chicken_Tinga_Tacos.jpg", rating: 4.0, created_at: "2 days"),
    ReviewData(id: 3, name: "John", avatar: "assets/images/john.jpg", comment: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.", product_name: "Creamy tzatziki", product_img: "assets/images/Creamy_tzatziki.jpg", rating: 3.5, created_at: "2 days"),
    ReviewData(id: 4, name: "Amanda", avatar: "assets/images/amanda.jpg", comment: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.", product_name: "Jack Daniels Burgers", product_img: "assets/images/Jack_Daniels_Burgers.jpg", rating: 4.0, created_at: "2 days"),
    ReviewData(id: 5, name: "Melinda", avatar: "assets/images/melinda.jpg", comment: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.", product_name: "Tostadas Pizza", product_img: "assets/images/Tostadas_Pizza.jpg", rating: 3.0, created_at: "2 days"),
  ];

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  void onInit(){
    super.onInit();
    scrollController = ScrollController()..addListener(_reachEnd);
  }

}