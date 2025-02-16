import 'package:evently_app/models/event_model.dart';
import 'package:evently_app/models/firebase_services.dart';
import 'package:evently_app/providers/event_provider.dart';
import 'package:evently_app/widgets/event_card.dart';
import 'package:evently_app/widgets/header_container.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  static String widgetName = "home view";
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    EventProvider eventProvider = Provider.of<EventProvider>(context);
    // eventProvider.getEvents;
    // if (events.isEmpty) {
    //   getEvents();
    // }
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            HeaderContainer(),
            Expanded(
              child: ListView.builder(
                itemCount: eventProvider.events.length,
                itemBuilder: (context, index) => EventCard(
                  event: eventProvider.events[index],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
