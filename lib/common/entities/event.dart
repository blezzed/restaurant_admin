import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EventModel {
  int? id;
  String? title;
  String? description;
  RxBool wholeDay = false.obs;
  TimeOfDay? from;
  TimeOfDay? to;

  EventModel({this.id ,required this.title, required this.description, required this.wholeDay, this.from, this.to});

  EventModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    description = json['description'];
    wholeDay.value = json['wholeDay'];
    from = TimeOfDay(hour:int.parse(json['from'].split(":")[0]),minute: int.parse(json['from'].split(":")[1]));
    to = TimeOfDay(hour:int.parse(json['to'].split(":")[0]),minute: int.parse(json['to'].split(":")[1]));
  }

  Map<String, dynamic> toJson(){
    return {
      "id":id,
      "title":title,
      "description":description,
      "wholeDay":wholeDay.value,
      "from":from.toString(),
      "to":to.toString(),
    };
  }
}