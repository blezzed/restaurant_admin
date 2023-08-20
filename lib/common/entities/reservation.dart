import 'package:get/get.dart';
import 'package:restaurant_admin/common/entities/entities.dart';


enum Reason {business, date, family, birthday, others}

class ReservationModel {
  int? id;
  UserData? customer;
  int? people = 1;
  int? tableNumber;
  String? slot;
  Rx<Reason> status = Reason.others.obs;
  DateTime? reservationDate;
  DateTime createdAt = DateTime.now();
  List<CartModel> cart = [];

  ReservationModel(
      {required this.id,
        required this.customer,
        this.people,
        this.tableNumber,
        this.slot,
        required this.status,
        required this.reservationDate,
        required this.createdAt,
        required this.cart,
      });

  ReservationModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    customer = UserData.fromJson(json['customer']);
    people = json['people'];
    tableNumber = json['tableNumber'];
    slot = json['slot'];
    status.value = Reason.values[json['status']];
    reservationDate =  DateTime.parse(json['reservationDate']);
    createdAt =  DateTime.parse(json['createdAt']);
    cart = cartFromJsonList(json);
  }

  Map<String, dynamic> toJson(){
    return {
      "id":id,
      "customer":customer!.toJson(),
      "people":people,
      "tableNumber":tableNumber,
      "slot":slot,
      "status":status.value.index,
      "reservationDate":reservationDate.toString(),
      "createdAt":createdAt.toString(),
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
