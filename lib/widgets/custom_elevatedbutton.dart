import 'package:evently_app/theme/app_theme.dart';
import 'package:flutter/material.dart';

class CustomElevatedbutton extends StatelessWidget {
  final String text;
  final VoidCallback ontap;
  const CustomElevatedbutton({super.key, required this.text, required this.ontap});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: ontap,
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.all(16),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        backgroundColor: AppTheme.primary,
      ),
      child: Text(text, style: Theme.of(context).textTheme.titleLarge),
    );
  }
}
