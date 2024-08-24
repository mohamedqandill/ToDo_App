




import 'package:flutter/material.dart';

class TaskModel{

  String id;
  String userId;
  String title;
  String desc;
  int date;
  String time;
  bool isDone;
  // Color color;
  // Color color;

  TaskModel({
    this.id="",
    this.userId="",
    required this.title,
    required this.desc,
    required this.date,
    required this.time,
    required this.isDone,
    // required this.color
});

  factory TaskModel.fromJson(Map<String,dynamic> json){
    return TaskModel(
        title: json["title"],
        desc: json["desc"],
        id: json["id"],
        userId: json["userId"],
        date: json["date"],
        time: json["time"],
        isDone: json["isDone"],
        // color:json["color"]

    );
  }


  Map<String,dynamic> toJson(){

    return {
      "id":id,
      "userId":userId,
      "title":title,
      "desc":desc,
      "date":date,
      "time":time,
      "isDone":isDone,
      // "color":color
    };

  }





}