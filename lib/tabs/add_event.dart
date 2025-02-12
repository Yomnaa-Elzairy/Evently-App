import 'package:evently_app/models/category.dart';
import 'package:evently_app/models/event.dart';
import 'package:evently_app/models/firebase_services.dart';
import 'package:evently_app/theme/app_theme.dart';
import 'package:evently_app/widgets/tab_item.dart';
import 'package:evently_app/widgets/custom_elevatedbutton.dart';
import 'package:evently_app/widgets/custom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AddEvent extends StatefulWidget {
  static String widgetName = "add event view";
  const AddEvent({super.key});

  @override
  State<AddEvent> createState() => _AddEventState();
}

class _AddEventState extends State<AddEvent> {
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  int currentIndex = 0;
  Category selectedCategory = Category.categories.first;
  DateTime? selectedDate;
  DateFormat dateFormat = DateFormat("d/M/yyyy");
  TimeOfDay? selectedTime;
  GlobalKey<FormState> key = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Create Event"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
        child: SingleChildScrollView(
          child: Form(
            key: key,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  // margin: EdgeInsets.all(10),
                  height: MediaQuery.sizeOf(context).height * 0.3,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(24),
                    image: DecorationImage(
                        image: AssetImage(
                            "assets/images/${selectedCategory.image}.png"),
                        fit: BoxFit.fill),
                  ),
                ),
                DefaultTabController(
                  length: Category.categories.length,
                  child: TabBar(
                      indicatorColor: Colors.transparent,
                      dividerColor: Colors.transparent,
                      tabAlignment: TabAlignment.start,
                      indicatorSize: TabBarIndicatorSize.tab,
                      unselectedLabelColor: AppTheme.white,
                      labelColor: AppTheme.white,
                      onTap: (index) {
                        currentIndex = index;
                        selectedCategory = Category.categories[currentIndex];
                        setState(() {});
                      },
                      labelStyle: Theme.of(context)
                          .textTheme
                          .titleMedium!
                          .copyWith(color: AppTheme.white),
                      isScrollable: true,
                      tabs: Category.categories
                          .map((category) => TabItem(
                                isHome: false,
                                category: category,
                                isSelected: currentIndex ==
                                    Category.categories.indexOf(category),
                              ))
                          .toList()),
                ),
                Text(
                  "Title",
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge!
                      .copyWith(color: AppTheme.black),
                ),
                SizedBox(
                  height: 8,
                ),
                CustomTextfield(
                    controller: titleController,
                    prefix: Icon(
                      Icons.edit_square,
                      color: Color(0xff7B7B7B),
                    ),
                    hintText: "Event Title",
                    isPassword: false),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "Description",
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge!
                      .copyWith(color: AppTheme.black),
                ),
                SizedBox(
                  height: 8,
                ),
                CustomTextfield(
                    maxLines: 4,
                    hintText: "Description",
                    isPassword: false,
                    controller: descriptionController),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Icon(Icons.date_range),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      "Event Date",
                      style: Theme.of(context)
                          .textTheme
                          .titleMedium!
                          .copyWith(color: AppTheme.black),
                    ),
                    Spacer(),
                    TextButton(
                        onPressed: () async {
                          DateTime? date = await showDatePicker(
                              context: context,
                              firstDate: DateTime.now(),
                              lastDate: DateTime.now().add(
                                Duration(days: 365),
                              ),
                              initialEntryMode:
                                  DatePickerEntryMode.calendarOnly);
                          if (date != null) {
                            selectedDate = date;
                            setState(() {});
                          }
                        },
                        child: Text(
                            selectedDate == null
                                ? "Choose Date"
                                : dateFormat.format(selectedDate!),
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium!
                                .copyWith(color: AppTheme.primary)))
                  ],
                ),
                Row(
                  children: [
                    Icon(Icons.av_timer),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      "Event Time",
                      style: Theme.of(context)
                          .textTheme
                          .titleMedium!
                          .copyWith(color: AppTheme.black),
                    ),
                    Spacer(),
                    TextButton(
                        onPressed: () async {
                          TimeOfDay? time = await showTimePicker(
                              context: context, initialTime: TimeOfDay.now());
                          if (time != null) {
                            selectedTime = time;
                            setState(() {});
                          }
                        },
                        child: Text(
                            selectedTime == null
                                ? "Choose Time"
                                : selectedTime!.format(context),
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium!
                                .copyWith(color: AppTheme.primary)))
                  ],
                ),
                CustomElevatedbutton(text: "Add Event", ontap: createEvent)
              ],
            ),
          ),
        ),
      ),
    );
  }

  void createEvent() {
    if (key.currentState!.validate() &&
        selectedDate != null &&
        selectedTime != null) {
      DateTime dateTime = DateTime(selectedDate!.year, selectedDate!.month,
          selectedDate!.day, selectedTime!.hour, selectedTime!.minute);
      Event event = Event(
        category: selectedCategory,
        title: titleController.text,
        description: descriptionController.text,
        dateTime: dateTime,
      );
      FirebaseServices.addEventToFirestore(event);
    }
  }
}
