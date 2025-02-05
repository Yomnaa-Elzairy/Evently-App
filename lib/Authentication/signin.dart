import 'package:evently_app/Authentication/forgot_password.dart';
import 'package:evently_app/Authentication/register.dart';
import 'package:evently_app/navbar_view.dart';
import 'package:evently_app/theme/app_theme.dart';
import 'package:evently_app/widgets/custom_elevatedbutton.dart';
import 'package:evently_app/widgets/custom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SigninView extends StatelessWidget {
  static String widgetName = "sign in";
  const SigninView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: SingleChildScrollView(
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
                  prefix: Icons.email,
                  hintText: "Email",
                  isPassword: false,
                ),
                SizedBox(
                  height: 15,
                ),
                CustomTextfield(
                  prefix: Icons.lock,
                  hintText: "Password",
                  isPassword: true,
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, ForgotPassword.widgetName);
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
                  ontap: () {
                    Navigator.pushReplacementNamed(
                        context, NavBarView.widgetName);
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
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(
                          color: AppTheme.primary, fontWeight: FontWeight.w500),
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
    );
  }
}
