import 'package:flutter/material.dart';

class CategoryModel {
  final String id;
  final String name;
  final String image;
  final IconData icon;
  CategoryModel(
      {required this.name,
      required this.id,
      required this.icon,
      required this.image});
  static List<CategoryModel> categories = [
    CategoryModel(
        name: "Sport", id: "1", icon: Icons.directions_bike, image: "Sport"),
    CategoryModel(
        name: "Birthday",
        id: "2",
        icon: Icons.cake_outlined,
        image: "Birthday"),
    CategoryModel(
        name: "Book CLub",
        id: "3",
        icon: Icons.menu_book_rounded,
        image: "Book CLub"),
    CategoryModel(
        name: "Eating", id: "4", icon: Icons.food_bank, image: "Eating"),
    CategoryModel(
        name: "Gaming", id: "5", icon: Icons.games_outlined, image: "Gaming"),
    CategoryModel(
        name: "Holiday",
        id: "6",
        icon: Icons.directions_bike_outlined,
        image: "Holiday"),
    CategoryModel(
        name: "Exhibition",
        id: "7",
        icon: Icons.holiday_village,
        image: "Exhibition"),
    CategoryModel(
        name: "Meeting", id: "8", icon: Icons.meeting_room, image: "Meeting"),
    CategoryModel(
        name: "WorkShop", id: "8", icon: Icons.meeting_room, image: "WorkShop"),
  ];
}
