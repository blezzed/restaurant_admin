import 'package:get/get.dart';
import 'package:restaurant_admin/common/entities/entities.dart';


enum StatusOrder {newOrder, onDelivery, delivered}

class OrderModel {
  int? id;
  String? name;
  String? lastName;
  String? location;
  Rx<StatusOrder> status = StatusOrder.newOrder.obs;
  DateTime date = DateTime.now();
  List<ProductModel> product = [];

  OrderModel(
      {required this.id,
        required this.name,
        required this.lastName,
        this.location,
        required this.status,
        required this.date,
        required this.product,
      });

  OrderModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    lastName = json['lastName'];
    location = json['location'];
    status = json['status'];
    date = json['date'] as DateTime;
    product = productFromJsonList(json);
  }

  Map<String, dynamic> toJson(){
    return {
      "id":id,
      "name":name,
      "lastName":lastName,
      "location":location,
      "status":status,
      "date":date.toString(),
      "product":productJsonList(),
    };
  }

  List<ProductModel> productFromJsonList (Map<String, dynamic> json){
    List<ProductModel> _productList = [];
    json["product"].forEach((e) {
      _productList.add(ProductModel.fromJson(e));
    });
    return _productList;
  }

  List productJsonList (){
    List _productList = [];
    product.forEach((e) {
      _productList.add(e.toJson());
    });
    return _productList;
  }
}
