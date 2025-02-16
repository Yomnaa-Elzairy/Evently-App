import 'package:evently_app/models/event_model.dart';
import 'package:evently_app/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

// ignore: must_be_immutable
class EventCard extends StatelessWidget {
  EventCard({super.key, required this.event});
  EventModel event;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      height: MediaQuery.sizeOf(context).height * 0.23,
      decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/${event.category.image}.png"),
            fit: BoxFit.fill,
          ),
          borderRadius: BorderRadius.circular(16)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            alignment: Alignment.center,
            margin: EdgeInsets.all(8),
            height: 50,
            width: 50,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Color(0xffF2FEFF)),
            child: Column(
              children: [
                Text(
                  textAlign: TextAlign.center,
                  "${event.dateTime.day}",
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      color: AppTheme.primary, fontWeight: FontWeight.w700),
                ),
                Text(
                  textAlign: TextAlign.center,
                  DateFormat("MMM").format(event.dateTime),
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      color: AppTheme.primary, fontWeight: FontWeight.w700),
                ),
              ],
            ),
          ),
          Spacer(),
          Container(
            margin: EdgeInsets.all(8),
            padding: EdgeInsets.all(8),
            height: 40,
            decoration: BoxDecoration(
              color: Color(0xffF2FEFF),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  event.description,
                  style: Theme.of(context).textTheme.titleSmall!.copyWith(
                      color: AppTheme.black, fontWeight: FontWeight.w700),
                ),
                Icon(
                  Icons.favorite_border,
                  color: AppTheme.primary,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
