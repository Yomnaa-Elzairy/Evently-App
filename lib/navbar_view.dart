import 'package:evently_app/tabs/add_event.dart';
import 'package:evently_app/tabs/favorite.dart';
import 'package:evently_app/tabs/home.dart';
import 'package:evently_app/tabs/location.dart';
import 'package:evently_app/tabs/profile.dart'; 
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class NavBarView extends StatefulWidget {
  static String widgetName = "navbar view";
  const NavBarView({super.key});

  @override
  State<NavBarView> createState() => _NavBarViewState();
}

class _NavBarViewState extends State<NavBarView> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    List<Widget> tabs = [Home(), Location(), Favorite(), Profile()];

    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,
        onTap: (value) {
          selectedIndex = value;
          setState(() {});
        },
        items: [
          BottomNavigationBarItem(
            label: "Home",
            activeIcon: SvgPicture.asset(
              "assets/icons/Home_selected.svg",
              height: 30,
              width: 30,
            ),
            icon: SvgPicture.asset(
              "assets/icons/Home.svg",
              height: 30,
              width: 30,
            ),
          ),
          BottomNavigationBarItem(
            label: "Map",
            activeIcon: SvgPicture.asset(
              "assets/icons/Map_Pin_selected.svg",
              height: 30,
              width: 30,
            ),
            icon: SvgPicture.asset(
              "assets/icons/Map_Pin.svg",
              height: 30,
              width: 30,
            ),
          ),
          BottomNavigationBarItem(
            label: "Favorite",
            activeIcon: SvgPicture.asset(
              "assets/icons/Heart_selected.svg",
              height: 30,
              width: 30,
            ),
            icon: SvgPicture.asset(
              "assets/icons/Favorite.svg",
              height: 30,
              width: 30,
            ),
          ),
          BottomNavigationBarItem(
            label: "Profile",
            activeIcon: SvgPicture.asset(
              "assets/icons/profile_selected.svg",
              height: 30,
              width: 30,
            ),
            icon: SvgPicture.asset(
              "assets/icons/profile.svg",
              height: 30,
              width: 30,
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, AddEvent.widgetName);
        },
        child: Icon(
          Icons.add,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: tabs[selectedIndex],
    );
  }
}
