import 'package:get/get.dart';
import 'package:restaurant_admin/common/entities/entities.dart';


enum StatusOrder {newOrder, onDelivery, delivered}

class OrderModel {
  int? id;
  UserData? customer;
  String? location;
  Rx<StatusOrder> status = StatusOrder.newOrder.obs;
  DateTime date = DateTime.now();
  List<CartModel> cart = [];

  OrderModel(
      {required this.id,
        required this.customer,
        this.location,
        required this.status,
        required this.date,
        required this.cart,
      });

  OrderModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    customer = UserData.fromJson(json['customer']);
    location = json['location'];
    status.value = StatusOrder.values[json['status']];
    date =  DateTime.parse(json['date']);
    cart = cartFromJsonList(json);
  }

  Map<String, dynamic> toJson(){
    return {
      "id":id,
      "customer":customer!.toJson(),
      "location":location,
      "status":status.value.index,
      "date":date.toString(),
      "cart":cartJsonList(),
    };
  }

  List<CartModel> cartFromJsonList (Map<String, dynamic> json){
    List<CartModel> _cartList = [];
    json["cart"].forEach((e) {
      _cartList.add(CartModel.fromJson(e));
    });
    return _cartList;
  }

  List cartJsonList (){
    List _cartList = [];
    cart.forEach((e) {
      _cartList.add(e.toJson());
    });
    return _cartList;
  }
}
