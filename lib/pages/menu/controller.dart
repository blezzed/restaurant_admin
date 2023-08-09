
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restaurant_admin/common/entities/entities.dart';
import 'package:restaurant_admin/common/store/store.dart';
import 'package:restaurant_admin/pages/menu/index.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:restaurant_admin/pages/menu/widget/widget.dart';

class MenuListController extends GetxController{
  MenuListController();
  final state = MenuListState();
  final user_id = UserStore.to.profile.id;

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  GlobalKey<ScaffoldState> get scaffoldKey => _scaffoldKey;

  late ScrollController _scrollController;
  ScrollController get scrollController => _scrollController;

  static double kExpandedHeight = 250.h;

  void controlMenuList() {
    if (!_scaffoldKey.currentState!.isDrawerOpen) {
      _scaffoldKey.currentState!.openDrawer();
    }
  }

  RxList<ProductModel> foodList = [
    ProductModel(id: 1, name: "Pancakes", img: "assets/images/Pancakes.jpg", stars: 4.5, price: 10.0, category: Category.food, description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged."),
    ProductModel(id: 2, name: "Chicken Tinga Tacos", img: "assets/images/Chicken_Tinga_Tacos.jpg", stars: 4.0, price: 10.0, category: Category.food, description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged."),
    ProductModel(id: 3, name: "Creamy tzatziki", img: "assets/images/Creamy_tzatziki.jpg", stars: 3.5, price: 10.0, category: Category.food, description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged."),
    ProductModel(id: 4, name: "Jack Daniels Burgers", img: "assets/images/Jack_Daniels_Burgers.jpg", stars: 4.0, price: 10.0, category: Category.food, description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged."),
    ProductModel(id: 5, name: "Tostadas Pizza", img: "assets/images/Tostadas_Pizza.jpg", stars: 3.0, price: 10.0, category: Category.food, description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged."),
  ].obs;

  bool get _isSliverAppBarExpanded {
    return _scrollController.hasClients &&
        _scrollController.offset > kExpandedHeight - kToolbarHeight -200;
  }

  void removeMenu(ProductModel productModel){
    foodList.remove(productModel);
    state.menuTitleList.value=[];
    foodList.forEach((element) {
      state.menuTitleList.add(MenuTile(product: element,));
    });
  }

  @override
  void onInit(){
    super.onInit();

    _scrollController = ScrollController()
      ..addListener(() {
        state.appBarTitleOpacity.value = _isSliverAppBarExpanded ? 1.0 : 0.0;
        state.appBarHeroTitleOpacity.value = _isSliverAppBarExpanded ? 0.0 : 1.0;
      });

    foodList.forEach((element) {
      state.menuTitleList.add(MenuTile(product: element,));
    });
  }

}