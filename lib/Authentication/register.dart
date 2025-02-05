import 'package:evently_app/Authentication/signin.dart';
import 'package:evently_app/theme/app_theme.dart';
import 'package:evently_app/widgets/custom_elevatedbutton.dart';
import 'package:evently_app/widgets/custom_textfield.dart';
import 'package:flutter/material.dart';

class RegisterView extends StatelessWidget {
  static String widgetName = "register";
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Register",
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Image.asset(
                "assets/images/Logo.png",
                height: MediaQuery.sizeOf(context).height * 0.2,
                fit: BoxFit.contain,
              ),
              SizedBox(
                height: 15,
              ),
              CustomTextfield(
                prefix: Icons.person_2,
                hintText: "Name",
                isPassword: false,
              ),
              const SizedBox(
                height: 15,
              ),
              CustomTextfield(
                prefix: Icons.email,
                hintText: "Email",
                isPassword: false,
              ),
              const SizedBox(
                height: 15,
              ),
              CustomTextfield(
                prefix: Icons.lock,
                hintText: "Password",
                isPassword: true,
              ),
              const SizedBox(
                height: 15,
              ),
              CustomTextfield(
                prefix: Icons.lock,
                hintText: "Re_Password",
                isPassword: true,
              ),
              const SizedBox(
                height: 30,
              ),
              CustomElevatedbutton(
                ontap: (){},
                text: "Create Account",
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Already have an acoount?",
                      style: Theme.of(context)
                          .textTheme
                          .titleMedium!
                          .copyWith(color: AppTheme.black)),
                  TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, SigninView.widgetName);
                    },
                    child: Text("Log in",
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium!
                            .copyWith(
                                color: AppTheme.primary,
                                fontStyle: FontStyle.italic,
                                decoration: TextDecoration.underline,
                                decorationColor: AppTheme.primary)),
                  ),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
