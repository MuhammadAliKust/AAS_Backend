// To parse this JSON data, do
//
//     final taskModel = taskModelFromJson(jsonString);

import 'dart:convert';

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

  Map<String, dynamic> toJson(String taskID) => {
        "docID": taskID,
        "title": title,
        "description": description,
        "isCompleted": isCompleted,
        "time": time,
      };
}
