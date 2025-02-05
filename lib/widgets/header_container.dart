import 'package:evently_app/models/category.dart';
import 'package:evently_app/theme/app_theme.dart';
import 'package:evently_app/widgets/tab_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class HeaderContainer extends StatefulWidget {
  const HeaderContainer({super.key});

  @override
  State<HeaderContainer> createState() => _HeaderContainerState();
}

class _HeaderContainerState extends State<HeaderContainer> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      height: MediaQuery.sizeOf(context).height * 0.23,
      decoration: BoxDecoration(
        color: AppTheme.primary,
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(24),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Welcome Back",
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  Text(
                    "John Safwat",
                    style: Theme.of(context)
                        .textTheme
                        .headlineSmall!
                        .copyWith(fontWeight: FontWeight.w700),
                  ),
                  Row(
                    children: [
                      SvgPicture.asset("assets/icons/Map_Pin.svg"),
                      Text(
                        "Cairo,Egypt",
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                    ],
                  ),
                ],
              ),
              Row(
                children: [
                  SvgPicture.asset(
                    "assets/icons/sun.svg",
                    height: 30,
                    width: 30,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Container(
                    alignment: Alignment.center,
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                        color: AppTheme.white,
                        borderRadius: BorderRadius.circular(8)),
                    child: Text(
                      "En",
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(
                          fontWeight: FontWeight.w700, color: AppTheme.primary),
                    ),
                  )
                ],
              )
            ],
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
                          isHome: true,
                          category: category,
                          isSelected: currentIndex ==
                              Category.categories.indexOf(category),
                        ))
                    .toList()),
          )
        ],
      ),
    );
  }
}
