import 'package:evently_app/theme/app_theme.dart';
import 'package:evently_app/widgets/event_card.dart';
import 'package:evently_app/widgets/header_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Home extends StatelessWidget {
  static String widgetName = "home view";
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            HeaderContainer(),
            Expanded(
                child: ListView.builder(
                    itemCount: 5, itemBuilder: (context, index) => EventCard()))
          ],
        ),
      ),
    );
  }
}
