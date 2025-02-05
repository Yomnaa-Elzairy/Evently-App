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
        image: "assets/images/Sport.png"),
    Category(
        name: "Birthday",
        id: "2",
        icon: Icons.cake_outlined,
        image: "assets/images/Birthday.png"),
    Category(
        name: "Book CLub",
        id: "3",
        icon: Icons.menu_book_rounded,
        image: "assets/images/Book CLub.png"),
    Category(
        name: "Eating",
        id: "4",
        icon: Icons.food_bank,
        image: "assets/images/Eating.png"),
    Category(
        name: "Gaming",
        id: "5",
        icon: Icons.games_outlined,
        image: "assets/images/Gaming.png"),
    Category(
        name: "Holiday",
        id: "6",
        icon: Icons.directions_bike_outlined,
        image: "assets/images/Holiday.png"),
    Category(
        name: "Exhibition",
        id: "7",
        icon: Icons.holiday_village,
        image: "assets/images/Exhibition.png"),
    Category(
        name: "Meeting",
        id: "8",
        icon: Icons.meeting_room,
        image: "assets/images/Meeting.png"),
    Category(
        name: "WorkShop",
        id: "8",
        icon: Icons.meeting_room,
        image: "assets/images/WorkShop.png"),
  ];
}
