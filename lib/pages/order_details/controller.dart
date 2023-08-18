import 'dart:convert';
import 'dart:io';
import 'dart:math' show pi;

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restaurant_admin/common/entities/entities.dart';
import 'package:restaurant_admin/common/store/store.dart';
import 'package:restaurant_admin/pages/order_details/index.dart';

class OrderDetailsController extends GetxController with GetTickerProviderStateMixin {
  OrderDetailsController();
  final state = OrderDetailsState();
  final user_id = UserStore.to.profile.id;
  late  OrderModel order;

  late AnimationController _animationController;
  AnimationController get animationController => _animationController;

  late Animation<double> _animation;
  Animation<double> get animation => _animation;

  late AnimationController _counterClockwiseRotationController;
  AnimationController get counterClockwiseRotationController => _counterClockwiseRotationController;

  late Animation<double> _counterClockwiseRotationAnimation;
  Animation<double> get counterClockwiseRotationAnimation => _counterClockwiseRotationAnimation;

  late AnimationController _flipController;
  AnimationController get flipController => _flipController;

  late Animation<double> _flipAnimation;
  Animation<double> get flipAnimation => _flipAnimation;

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  GlobalKey<ScaffoldState> get scaffoldKey => _scaffoldKey;

  void controlMenu() {
    if (!_scaffoldKey.currentState!.isDrawerOpen) {
      _scaffoldKey.currentState!.openDrawer();
    }
  }

  void switchCards() {
    if(state.flipContainer.isTrue){
      state.orderOpacity.value = 0;
      state.containerColor.value = Colors.teal.shade200;
      state.orderView.value = !state.orderView.value;
      state.flipContainer.value = !state.flipContainer.value;

      _animationController..reset()..forward.delayed(Duration(seconds: 1));
      _animationController.addStatusListener((status) {
        if(status == AnimationStatus.completed){
          state.containerColor.value = Colors.transparent;
          state.locationOpacity.value = 1;
          state.locationView.value = !state.locationView.value;
        }
      });

    }else{
      state.locationOpacity.value = 0;
      state.containerColor.value = Colors.teal.shade200;
      state.locationView.value = !state.locationView.value;
      state.flipContainer.value = !state.flipContainer.value;

      _animationController..reset()..forward.delayed(Duration(seconds: 1));
      _animationController.addStatusListener((status) {
        if(status == AnimationStatus.completed){
          state.containerColor.value = Colors.transparent;
          state.orderOpacity.value = 1;
          state.orderView.value = !state.orderView.value;

        }
      });

    }
  }

  void deleteOrder(){
    state.deleteOrder.value = true;
    _flipController.addStatusListener((status) {
      if(status == AnimationStatus.completed){
        dispose();
        Get.back();
      }
    });
  }
  @override
  void onInit(){
    super.onInit();

    var data = Get.arguments;
    order = OrderModel.fromJson(jsonDecode(data["order"]!));

    _animationController = AnimationController(
        vsync: this,
      duration:  Duration(seconds: 1)
    );

    _animation = Tween<double>(begin: 0.0, end: 2*pi).animate(_animationController);
    //_animationController.animateTo(0.5);

    _counterClockwiseRotationController = AnimationController(
        vsync: this,
        duration:  Duration(seconds: 1)
    );

    _counterClockwiseRotationAnimation = Tween<double>(begin: 0, end: - (pi / 2))
        .animate(CurvedAnimation(
        parent: _counterClockwiseRotationController,
        curve: Curves.bounceOut
    ));

    _flipController = AnimationController(
        vsync: this,
        duration:  Duration(seconds: 1)
    );

    _flipAnimation = Tween<double>(begin: 0, end: pi)
        .animate(CurvedAnimation(
        parent: _flipController,
        curve: Curves.bounceOut
    ));

    // state listeners
    _counterClockwiseRotationController.addStatusListener((status) {
      if (status == AnimationStatus.completed){
        _flipAnimation = Tween<double>(begin: _flipAnimation.value, end: _flipAnimation.value + pi)
            .animate(CurvedAnimation(
            parent: _flipController,
            curve: Curves.bounceOut
        ));
        // reset the flip controller and start the animation
        _flipController..reset()..forward();
      }

    });

    _flipController.addStatusListener((status) {
      if (status == AnimationStatus.completed){
        _counterClockwiseRotationAnimation = Tween<double>(
            begin: _counterClockwiseRotationAnimation.value,
            end: _counterClockwiseRotationAnimation.value + - (pi / 2))
            .animate(CurvedAnimation(
            parent: _counterClockwiseRotationController,
            curve: Curves.bounceOut
        ));
        _counterClockwiseRotationController..reset()..forward();
      }

    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    _counterClockwiseRotationController.dispose();
    _flipController.dispose();
    super.dispose();
  }

}

extension on VoidCallback {
  Future<void> delayed(Duration duration) =>
      Future.delayed(duration, this);
}