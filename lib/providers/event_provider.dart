import 'package:evently_app/models/category.dart';
import 'package:evently_app/models/event_model.dart';
import 'package:evently_app/models/firebase_services.dart';
import 'package:flutter/foundation.dart';

class EventProvider with ChangeNotifier {
  List<EventModel> events = [];
  CategoryModel? selectedCategory;
  Future<void> getEvents() async {
    events = await FirebaseServices.getEventFromFireStore(selectedCategory?.id);
    notifyListeners();
  }

  void changeSelectedCategory(CategoryModel? category) {
    selectedCategory = category;
    getEvents();
  }
}
