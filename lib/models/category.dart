import 'package:flutter/material.dart';

class Category {
  final String id;
  final String name;
  final String image;
  final IconData icon;
  Category(
      {required this.name,
      required this.id,
      required this.icon,
      required this.image});
  static List<Category> categories = [
    Category(
        name: "Sport",
        id: "1",
        icon: Icons.directions_bike,
        image: "Sport"),
    Category(
        name: "Birthday",
        id: "2",
        icon: Icons.cake_outlined,
        image: "Birthday"),
    Category(
        name: "Book CLub",
        id: "3",
        icon: Icons.menu_book_rounded,
        image: "Book CLub"),
    Category(
        name: "Eating",
        id: "4",
        icon: Icons.food_bank,
        image: "Eating"),
    Category(
        name: "Gaming",
        id: "5",
        icon: Icons.games_outlined,
        image: "Gaming"),
    Category(
        name: "Holiday",
        id: "6",
        icon: Icons.directions_bike_outlined,
        image: "Holiday"),
    Category(
        name: "Exhibition",
        id: "7",
        icon: Icons.holiday_village,
        image: "Exhibition"),
    Category(
        name: "Meeting",
        id: "8",
        icon: Icons.meeting_room,
        image: "Meeting"),
    Category(
        name: "WorkShop",
        id: "8",
        icon: Icons.meeting_room,
        image: "WorkShop"),
  ];
}
