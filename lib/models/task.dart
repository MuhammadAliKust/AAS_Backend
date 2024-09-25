// To parse this JSON data, do
//
//     final taskModel = taskModelFromJson(jsonString);

import 'dart:convert';

TaskModel taskModelFromJson(String str) => TaskModel.fromJson(json.decode(str));

String taskModelToJson(TaskModel data) => json.encode(data.toJson());

class TaskModel {
  final String? docId;
  final String? title;
  final String? description;
  final bool? isCompleted;
  final int? time;

  TaskModel({
    this.docId,
    this.title,
    this.description,
    this.isCompleted,
    this.time,
  });

  factory TaskModel.fromJson(Map<String, dynamic> json) => TaskModel(
    docId: json["docID"],
    title: json["title"],
    description: json["description"],
    isCompleted: json["isCompleted"],
    time: json["time"],
  );

  Map<String, dynamic> toJson() => {
    "docID": docId,
    "title": title,
    "description": description,
    "isCompleted": isCompleted,
    "time": time,
  };
}
