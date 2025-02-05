import 'package:evently_app/models/category.dart';
import 'package:evently_app/theme/app_theme.dart';
import 'package:evently_app/widgets/tab_item.dart';
import 'package:evently_app/widgets/custom_elevatedbutton.dart';
import 'package:evently_app/widgets/custom_textfield.dart';
import 'package:flutter/material.dart';

class AddEvent extends StatefulWidget {
  static String widgetName = "add event view";
  const AddEvent({super.key});

  @override
  State<AddEvent> createState() => _AddEventState();
}

class _AddEventState extends State<AddEvent> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Create Event"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                // margin: EdgeInsets.all(10),
                height: MediaQuery.sizeOf(context).height * 0.3,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(24),
                  image: DecorationImage(
                      image: AssetImage(Category.categories[currentIndex].image),
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
                  prefix: Icons.edit_square,
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
              TextField(
                  minLines: 4,
                  maxLines: 11,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide: BorderSide(
                        color: Color(0xff7B7B7B),
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide: BorderSide(
                        color: Color(0xff7B7B7B),
                      ),
                    ),
                    hintText: "Event description",
                    hintStyle: TextStyle(
                      color: Color(0xff7B7B7B),
                    ),
                  )),
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
                      onPressed: () {},
                      child: Text("Choose Date",
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
                      onPressed: () {},
                      child: Text("Choose Time",
                          style: Theme.of(context)
                              .textTheme
                              .titleMedium!
                              .copyWith(color: AppTheme.primary)))
                ],
              ),
              CustomElevatedbutton(text: "Add Event", ontap: () {})
            ],
          ),
        ),
      ),
    );
  }
}
