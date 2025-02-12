// ignore_for_file: use_build_context_synchronously

import 'package:evently_app/Authentication/forgot_password.dart';
import 'package:evently_app/Authentication/register.dart';
import 'package:evently_app/models/firebase_services.dart';
import 'package:evently_app/navbar_view.dart';
import 'package:evently_app/theme/app_theme.dart';
import 'package:evently_app/widgets/custom_elevatedbutton.dart';
import 'package:evently_app/widgets/custom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SigninView extends StatefulWidget {
  static String widgetName = "sign in";

  SigninView({super.key});

  @override
  State<SigninView> createState() => _SigninViewState();
}

class _SigninViewState extends State<SigninView> {
  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                    controller: emailController,
                    prefix: Icon(Icons.email,color: Color(0xff7B7B7B)),
                    hintText: "Email",
                    isPassword: false,
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  CustomTextfield(
                    controller: passwordController,
                    prefix: Icon(Icons.lock,color: Color(0xff7B7B7B)),
                    hintText: "Password",
                    isPassword: true,
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                        onPressed: () {
                          Navigator.pushNamed(
                              context, ForgotPassword.widgetName);
                        },
                        child: Text("Forgot Password?",
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium!
                                .copyWith(
                                    color: AppTheme.primary,
                                    fontStyle: FontStyle.italic,
                                    fontWeight: FontWeight.w700,
                                    decoration: TextDecoration.underline,
                                    decorationColor: AppTheme.primary))),
                  ),
                  CustomElevatedbutton(
                    ontap: () async {
                      bool success = await FirebaseServices.login(
                          emailController.text, passwordController.text);
                      if (formKey.currentState!.validate()) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                              backgroundColor: AppTheme.primary,
                              duration: Duration(seconds: 3),
                              content: Text('Logged in successfully')),
                        );
                      }
                      if (success) {
                        Navigator.pushReplacementNamed(
                            context, NavBarView.widgetName);
                      } else {
                        SnackBar(
                            backgroundColor: AppTheme.primary,
                            duration: Duration(seconds: 3),
                            content: Text("Email already in use"));
                        setState(() {});
                      }
                    },
                    text: "Login",
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Don't have an account?",
                          style: Theme.of(context)
                              .textTheme
                              .titleMedium!
                              .copyWith(color: AppTheme.black)),
                      TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, RegisterView.widgetName);
                        },
                        child: Text("Create Account",
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
                  SizedBox(
                    height: 15,
                  ),
                  Row(
                    children: [
                      Expanded(
                          child: Divider(
                        color: AppTheme.primary,
                        indent: 10,
                        endIndent: 10,
                      )),
                      Text(
                        "Or",
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium!
                            .copyWith(
                                color: AppTheme.primary,
                                fontWeight: FontWeight.w500),
                      ),
                      Expanded(
                          child: Divider(
                        color: AppTheme.primary,
                        indent: 10,
                        endIndent: 10,
                      )),
                    ],
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      elevation: 0,
                      padding: EdgeInsets.all(16),
                      shape: RoundedRectangleBorder(
                          side: BorderSide(color: AppTheme.primary),
                          borderRadius: BorderRadius.circular(16)),
                      backgroundColor: Color(0xffF2FEFF),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset("assets/icons/google_logo.svg"),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          "Log in with google",
                          style: Theme.of(context)
                              .textTheme
                              .titleLarge!
                              .copyWith(color: AppTheme.primary),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
