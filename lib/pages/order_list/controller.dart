import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restaurant_admin/common/entities/entities.dart';
import 'package:restaurant_admin/common/store/store.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:restaurant_admin/pages/order_list/index.dart';
import 'package:restaurant_admin/pages/order_list/widget/widget.dart';

class OrderListController extends GetxController{
  OrderListController();
  final state = OrderListState();
  final user_id = UserStore.to.profile.id;

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  GlobalKey<ScaffoldState> get scaffoldKey => _scaffoldKey;

  late ScrollController _scrollController;
  ScrollController get scrollController => _scrollController;

  ScrollController tableScrollController1 = ScrollController();
  ScrollController tableScrollController2 = ScrollController();

  static double kExpandedHeight = 250.h;

  late List<OrderModel> _orderList;

  List<TableRow> dataContents = <TableRow>[].obs;
  RxList<TableRow> idDataContents = <TableRow>[].obs;

  List<ProductModel> _productList = [
    ProductModel(id: 1, name: "Pancakes", img: "assets/images/Pancakes.jpg", stars: 4.5, price: 10.0, category: Category.food, description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged."),
    ProductModel(id: 2, name: "Chicken Tinga Tacos", img: "assets/images/Chicken_Tinga_Tacos.jpg", stars: 4.0, price: 10.0, category: Category.food, description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged."),
    ProductModel(id: 3, name: "Creamy tzatziki", img: "assets/images/Creamy_tzatziki.jpg", stars: 3.5, price: 10.0, category: Category.food, description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged."),
    ProductModel(id: 4, name: "Jack Daniels Burgers", img: "assets/images/Jack_Daniels_Burgers.jpg", stars: 4.0, price: 10.0, category: Category.food, description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged."),
    ProductModel(id: 5, name: "Tostadas Pizza", img: "assets/images/Tostadas_Pizza.jpg", stars: 3.0, price: 10.0, category: Category.food, description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged."),
  ];

  bool get _isSliverAppBarExpanded {
    return _scrollController.hasClients &&
        _scrollController.offset > kExpandedHeight - kToolbarHeight -150;
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

    _orderList = [
      OrderModel(id: 333231, name: "Mikasa", lastName: "Ackerman", status: StatusOrder.newOrder.obs, date: DateTime.timestamp(),  location: "Corner Street 5th Bulawayo", product: _productList),
      OrderModel(id: 333232, name: "Levi", lastName: "Ackerman", status: StatusOrder.onDelivery.obs, date: DateTime.timestamp(),  location: "Corner Street 5th Bulawayo", product: _productList),
      OrderModel(id: 333233, name: "Ronald", lastName: "Jamez", status: StatusOrder.newOrder.obs, date: DateTime.timestamp(),  location: "Corner Street 5th Bulawayo", product: _productList),
      OrderModel(id: 333234, name: "John", lastName: "Snow", status: StatusOrder.delivered.obs, date: DateTime.timestamp(),  location: "Corner Street 5th Bulawayo", product: _productList),
      OrderModel(id: 333235, name: "Amanda", lastName: "Ackerman", status: StatusOrder.delivered.obs, date: DateTime.timestamp(),  location: "Corner Street 5th Bulawayo", product: _productList),
      OrderModel(id: 333236, name: "Mikasa", lastName: "Yeager", status: StatusOrder.newOrder.obs, date: DateTime.timestamp(),  location: "Corner Street 5th Bulawayo", product: _productList),
      OrderModel(id: 333237, name: "Putra", lastName: "Reuss", status: StatusOrder.onDelivery.obs, date: DateTime.timestamp(),  location: "Corner Street 5th Bulawayo", product: _productList),
      OrderModel(id: 333237, name: "Putra", lastName: "Reuss", status: StatusOrder.onDelivery.obs, date: DateTime.timestamp(),  location: "Corner Street 5th Bulawayo", product: _productList),
      OrderModel(id: 333237, name: "Putra", lastName: "Reuss", status: StatusOrder.onDelivery.obs, date: DateTime.timestamp(),  location: "Corner Street 5th Bulawayo", product: _productList),
      OrderModel(id: 333237, name: "Putra", lastName: "Reuss", status: StatusOrder.onDelivery.obs, date: DateTime.timestamp(),  location: "Corner Street 5th Bulawayo", product: _productList),
      OrderModel(id: 333237, name: "Putra", lastName: "Reuss", status: StatusOrder.onDelivery.obs, date: DateTime.timestamp(),  location: "Corner Street 5th Bulawayo", product: _productList),
      OrderModel(id: 333237, name: "Putra", lastName: "Reuss", status: StatusOrder.onDelivery.obs, date: DateTime.timestamp(),  location: "Corner Street 5th Bulawayo", product: _productList),
      OrderModel(id: 333237, name: "Putra", lastName: "Reuss", status: StatusOrder.onDelivery.obs, date: DateTime.timestamp(),  location: "Corner Street 5th Bulawayo", product: _productList),
      OrderModel(id: 333237, name: "Putra", lastName: "Reuss", status: StatusOrder.onDelivery.obs, date: DateTime.timestamp(),  location: "Corner Street 5th Bulawayo", product: _productList),
      OrderModel(id: 333237, name: "Putra", lastName: "Reuss", status: StatusOrder.onDelivery.obs, date: DateTime.timestamp(),  location: "Corner Street 5th Bulawayo", product: _productList),
      OrderModel(id: 333238, name: "Putra", lastName: "Reuss", status: StatusOrder.onDelivery.obs, date: DateTime.timestamp(),  location: "Corner Street 5th Bulawayo", product: _productList),
    ];

    dataContents = [];

    BuildContext context = Get.key.currentContext!;
    for (var element in _orderList) {
      idDataContents.add(orderIdColumn(context, id: element.id.toString()));
      dataContents.add(tableContents(context, element));
    }

  }

}