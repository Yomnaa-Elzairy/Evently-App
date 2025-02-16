import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:evently_app/models/category.dart';

class EventModel {
  String id;
  String title;
  CategoryModel category;
  String description;
  DateTime dateTime;

  EventModel({
    this.id = "",
    required this.title,
    required this.category,
    required this.description,
    required this.dateTime,
  });
  EventModel.fromJson(Map<String, dynamic> json)
      : this(
            id: json["id"],
            category: CategoryModel.categories
                .firstWhere((category) => category.id == json["categoryId"]),
            title: json["title"],
            description: json["description"],
            dateTime: (json["dateTime"] as Timestamp).toDate());
  Map<String, dynamic> toJson() => {
        "id": id,
        "categoryId": category.id,
        "title": title,
        "description": description,
        "dateTime": Timestamp.fromDate(dateTime)
      };
}
