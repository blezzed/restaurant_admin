import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restaurant_admin/common/entities/entities.dart';
import 'package:restaurant_admin/common/store/store.dart';
import 'package:restaurant_admin/pages/food_details/index.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:restaurant_admin/pages/food_details/widget/review_tile.dart';

class FoodDetailsController extends GetxController with GetSingleTickerProviderStateMixin{
  FoodDetailsController();
  final state = FoodDetailsState();
  final user_id = UserStore.to.profile.id;
  ProductModel? product;

  static double kExpandedHeight = 280.h;

  late ScrollController _scrollController;
  ScrollController get scrollController => _scrollController;

  late GlobalKey<AnimatedListState> animatedListKey;

  late TabController tabController;

  final List<Tab> tabs = <Tab>[
    const Tab(text: "About",),
    const Tab(text: "Review",),
    const Tab(text: "Revenue",),
  ].obs;

  List customerReview = [
    ReviewData(id: 1, name: "James", avatar: "assets/images/james.jpg", comment: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.", product_name: "Pancakes", product_img: "assets/images/Pancakes.jpg", rating: 4.5, created_at: "2 days"),
    ReviewData(id: 2, name: "Rick", avatar: "assets/images/rick.jpg", comment: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.", product_name: "Chicken Tinga Tacos", product_img: "assets/images/Chicken_Tinga_Tacos.jpg", rating: 4.0, created_at: "2 days"),
    ReviewData(id: 3, name: "John", avatar: "assets/images/john.jpg", comment: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.", product_name: "Creamy tzatziki", product_img: "assets/images/Creamy_tzatziki.jpg", rating: 3.5, created_at: "2 days"),
    ReviewData(id: 4, name: "Amanda", avatar: "assets/images/amanda.jpg", comment: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.", product_name: "Jack Daniels Burgers", product_img: "assets/images/Jack_Daniels_Burgers.jpg", rating: 4.0, created_at: "2 days"),
    ReviewData(id: 5, name: "Melinda", avatar: "assets/images/melinda.jpg", comment: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.", product_name: "Tostadas Pizza", product_img: "assets/images/Tostadas_Pizza.jpg", rating: 3.0, created_at: "2 days"),
  ];

  bool get _isSliverAppBarExpanded {
    return _scrollController.hasClients &&
        _scrollController.offset > kExpandedHeight - kToolbarHeight -100;
  }

  @override
  void onInit(){
    super.onInit();

    _scrollController = ScrollController()
      ..addListener(() {
        state.appBarHeroOpacity.value = _isSliverAppBarExpanded ? 0.0 : 1.0;
        state.scrollReviewList.value = _isSliverAppBarExpanded ? true : false;
      });

    animatedListKey = GlobalKey();

    tabController = TabController(length: tabs.length, vsync: this);

    var data = Get.parameters;
    product = ProductModel.fromJson(jsonDecode(data["product"]!));

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      customerReview.forEach((element) {
        state.reviewTileList.add(ReviewTile(reviewData: element));
        animatedListKey.currentState?.insertItem(state.reviewTileList.length -1);
      });
    });
  }

  @override
  void onClose() {
    tabController.dispose();
    super.onClose();
  }

}