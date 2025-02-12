import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:evently_app/models/category.dart';

class Event {
   String id;
   String title;
   Category category;
   String description;
   DateTime dateTime;

  Event({
    this.id = "",
    required this.title,
    required this.category,
    required this.description,
    required this.dateTime,
  });
  Event.fromJson(Map<String, dynamic> json)
      : this(
            id: json["id"],
            category: Category.categories
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
