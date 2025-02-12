// ignore_for_file: use_build_context_synchronously

import 'package:evently_app/Authentication/signin.dart';
import 'package:evently_app/models/firebase_services.dart';
import 'package:evently_app/theme/app_theme.dart';
import 'package:evently_app/widgets/custom_elevatedbutton.dart';
import 'package:evently_app/widgets/custom_textfield.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class RegisterView extends StatefulWidget {
  static String widgetName = "register";

  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  TextEditingController nameController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

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
          child: Form(
            key: formKey,
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
                  controller: nameController,
                  prefix: Icon(Icons.person_2, color: Color(0xff7B7B7B)),
                  hintText: "Name",
                  isPassword: false,
                ),
                const SizedBox(
                  height: 15,
                ),
                CustomTextfield(
                  controller: emailController,
                  prefix: Icon(Icons.email, color: Color(0xff7B7B7B)),
                  hintText: "Email",
                  isPassword: false,
                ),
                const SizedBox(
                  height: 15,
                ),
                CustomTextfield(
                  controller: passwordController,
                  prefix: Icon(Icons.lock, color: Color(0xff7B7B7B)),
                  hintText: "Password",
                  isPassword: true,
                ),
                const SizedBox(
                  height: 15,
                ),
                CustomTextfield(
                  controller: passwordController,
                  prefix: Icon(Icons.lock, color: Color(0xff7B7B7B)),
                  hintText: "Re_Password",
                  isPassword: true,
                ),
                const SizedBox(
                  height: 30,
                ),
                CustomElevatedbutton(
                  ontap: () async {
                    bool success = await FirebaseServices.register(
                        emailController.text, passwordController.text);
                    if (formKey.currentState!.validate()) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                            backgroundColor: AppTheme.primary,
                            duration: Duration(seconds: 3),
                            content: Text('Processing Data')),
                      );
                    }
                    if (success) {
                      Navigator.pushReplacementNamed(
                          context, SigninView.widgetName);
                    } else {
                      SnackBar(
                          backgroundColor: AppTheme.primary,
                          duration: Duration(seconds: 3),
                          content: Text("Email already in use"));
                      setState(() {});
                    }
                  },
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
      ),
    );
  }
}
