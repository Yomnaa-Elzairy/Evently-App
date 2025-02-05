import 'package:evently_app/widgets/custom_elevatedbutton.dart';
import 'package:flutter/material.dart';

class ForgotPassword extends StatelessWidget {
  static String widgetName = "forgot password";
  const ForgotPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Forgot Password"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Image.asset("assets/images/forgot_password.png"),
            Padding(
              padding: const EdgeInsets.only(top: 32.0),
              child: CustomElevatedbutton(
                ontap: (){},
                text: "Reset Password"),
            )
          ],
        ),
      ),
    );
  }
}
