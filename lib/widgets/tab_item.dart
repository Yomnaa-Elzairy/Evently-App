import 'package:evently_app/theme/app_theme.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class TabItem extends StatelessWidget {

  String label;
  IconData icon;
  bool isSelected;
  bool isHome;
  TabItem(
      {super.key,
      required this.label,
      required this.icon,
      required this.isSelected,
      required this.isHome});

  // bool isSelected = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 16),
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
          border: Border.all(color: isHome ? AppTheme.white : AppTheme.primary),
          color: isHome
              ? isSelected
                  ? AppTheme.white
                  : AppTheme.primary
              : isSelected
                  ? AppTheme.primary
                  : Colors.transparent,
          borderRadius: BorderRadius.circular(32)),
      // width: MediaQuery.sizeOf(context).width * 0.3,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Icon(
            icon,
            color: isHome
                ? isSelected
                    ? AppTheme.primary
                    : AppTheme.white
                : isSelected
                    ? AppTheme.white
                    : AppTheme.primary,
          ),
          SizedBox(
            width: 5,
          ),
          Text(
            label,
            style: Theme.of(context).textTheme.titleMedium!.copyWith(
                  color: isHome
                      ? isSelected
                          ? AppTheme.primary
                          : AppTheme.white
                      : isSelected
                          ? AppTheme.white
                          : AppTheme.primary,
                ),
          ),
        ],
      ),
    );
  }
}
