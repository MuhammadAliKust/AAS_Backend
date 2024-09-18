// To parse this JSON data, do
//
//     final taskModel = taskModelFromJson(jsonString);

import 'dart:convert';

TaskModel taskModelFromJson(String str) => TaskModel.fromJson(json.decode(str));

String taskModelToJson(TaskModel data) => json.encode(data.toJson());

class TaskModel {
  final String? title;
  final String? description;
  final String? image;
  final String? docId;
  final String? time;
  final bool? isCompleted;

  TaskModel({
    this.title,
    this.description,
    this.image,
    this.docId,
    this.time,
    this.isCompleted,
  });

  factory TaskModel.fromJson(Map<String, dynamic> json) => TaskModel(
    title: json["title"],
    description: json["description"],
    image: json["image"],
    docId: json["docID"],
    time: json["time"],
    isCompleted: json["isCompleted"],
  );

  Map<String, dynamic> toJson() => {
    "title": title,
    "description": description,
    "image": image,
    "docID": docId,
    "time": time,
    "isCompleted": isCompleted,
  };
}
