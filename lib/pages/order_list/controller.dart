
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

  List<CartModel> cartList = [
    CartModel(id: 1, quantity: 2.obs,product: ProductModel(id: 1, name: "Pancakes", img: "assets/images/Pancakes.jpg", stars: 4.5, price: 10.0, category: Category.food, description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged."),),
    CartModel(id: 2, quantity: 3.obs,product: ProductModel(id: 2, name: "Chicken Tinga Tacos", img: "assets/images/Chicken_Tinga_Tacos.jpg", stars: 4.0, price: 10.0, category: Category.food, description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged."),),
    CartModel(id: 3, quantity: 5.obs,product: ProductModel(id: 3, name: "Creamy tzatziki", img: "assets/images/Creamy_tzatziki.jpg", stars: 3.5, price: 10.0, category: Category.food, description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged."),),
    CartModel(id: 4, quantity: 1.obs,product: ProductModel(id: 4, name: "Jack Daniels Burgers", img: "assets/images/Jack_Daniels_Burgers.jpg", stars: 4.0, price: 10.0, category: Category.food, description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged."),),
    CartModel(id: 5, quantity: 2.obs,product: ProductModel(id: 5, name: "Tostadas Pizza", img: "assets/images/Tostadas_Pizza.jpg", stars: 3.0, price: 10.0, category: Category.food, description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged."),),
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
      OrderModel(id: 333237, customer: UserData(name: "Putra", surname: "Reuss", avatar: "assets/images/james.jpg"), status: StatusOrder.newOrder.obs, date: DateTime.timestamp(),  location: "Corner Street 5th Bulawayo", cart: cartList),
      OrderModel(id: 333237, customer: UserData(name: "Mikasa", surname: "Ackerman", avatar: "assets/images/rick.jpg"), status: StatusOrder.newOrder.obs, date: DateTime.timestamp(),  location: "Corner Street 5th Bulawayo", cart: cartList),
      OrderModel(id: 333237, customer: UserData(name: "Ronald", surname: "Jamez", avatar: "assets/images/john.jpg"), status: StatusOrder.onDelivery.obs, date: DateTime.timestamp(),  location: "Corner Street 5th Bulawayo", cart: cartList),
      OrderModel(id: 333237, customer: UserData(name: "Levi", surname: "Snow", avatar: "assets/images/james.jpg"), status: StatusOrder.delivered.obs, date: DateTime.timestamp(),  location: "Corner Street 5th Bulawayo", cart: cartList),
      OrderModel(id: 333237, customer: UserData(name: "John", surname: "Reuss", avatar: "assets/images/rick.jpg"), status: StatusOrder.onDelivery.obs, date: DateTime.timestamp(),  location: "Corner Street 5th Bulawayo", cart: cartList),
      OrderModel(id: 333237, customer: UserData(name: "Amanda", surname: "Yeager", avatar: "assets/images/amanda.jpg"), status: StatusOrder.delivered.obs, date: DateTime.timestamp(),  location: "Corner Street 5th Bulawayo", cart: cartList),
      OrderModel(id: 333237, customer: UserData(name: "Linda", surname: "Reuss", avatar: "assets/images/melinda.jpg"), status: StatusOrder.delivered.obs, date: DateTime.timestamp(),  location: "Corner Street 5th Bulawayo", cart: cartList),
    ];

    dataContents = [];

    BuildContext context = Get.key.currentContext!;
    for (var element in _orderList) {
      idDataContents.add(orderIdColumn(context, order: element));
      dataContents.add(tableContents(context, element));
    }

  }

}