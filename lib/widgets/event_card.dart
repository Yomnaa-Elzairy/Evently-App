import 'package:evently_app/theme/app_theme.dart';
import 'package:flutter/material.dart';

class EventCard extends StatelessWidget {
  const EventCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      height: MediaQuery.sizeOf(context).height * 0.23,
      decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/Birthday.png"),
            fit: BoxFit.fill,
          ),
          borderRadius: BorderRadius.circular(16)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            alignment: Alignment.center,
            margin: EdgeInsets.all(8),
            height: 45,
            width: 45,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Color(0xffF2FEFF)),
            child: Text(
              textAlign: TextAlign.center,
              "21 Nov",
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                  color: AppTheme.primary, fontWeight: FontWeight.w700),
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
                  "This is a Birthday Party",
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
