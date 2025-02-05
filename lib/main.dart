import 'package:evently_app/Authentication/forgot_password.dart';
import 'package:evently_app/Authentication/register.dart';
import 'package:evently_app/Authentication/signin.dart';
import 'package:evently_app/navbar_view.dart';
import 'package:evently_app/tabs/add_event.dart';
import 'package:evently_app/tabs/favorite.dart';
import 'package:evently_app/tabs/home.dart';
import 'package:evently_app/tabs/location.dart';
import 'package:evently_app/tabs/profile.dart';
import 'package:evently_app/theme/app_theme.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: SigninView.widgetName,
      routes: {
        SigninView.widgetName: (_) => SigninView(),
        RegisterView.widgetName: (_) => RegisterView(),
        ForgotPassword.widgetName: (_) => ForgotPassword(),
        NavBarView.widgetName: (_) => NavBarView(),
        Home.widgetName: (_) => Home(),
        Favorite.widgetName: (_) => Favorite(),
        AddEvent.widgetName: (_) => AddEvent(),
        Location.widgetName: (_) => Location(),
        Profile.widgetName: (_) => Profile(),
        AddEvent.widgetName:(_)=>AddEvent()
      },
      theme: AppTheme.lightTheme,
    );
  }
}
