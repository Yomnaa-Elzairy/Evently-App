import 'package:flutter/material.dart';

class CustomTextfield extends StatefulWidget {
  final IconData prefix;
  final String hintText;
  final bool isPassword;
  const CustomTextfield({
    super.key,
    required this.prefix,
    required this.hintText,
    required this.isPassword,
  });

  @override
  State<CustomTextfield> createState() => _CustomTextfieldState();
}

class _CustomTextfieldState extends State<CustomTextfield> {
  bool visible = false;
  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(
            color: Color(0xff7B7B7B),
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(
            color: Color(0xff7B7B7B),
          ),
        ),
        prefixIcon: Icon(
          widget.prefix,
          color: Color(0xff7B7B7B),
        ),
        hintText: widget.hintText,
        hintStyle: TextStyle(
          color: Color(0xff7B7B7B),
        ),
        suffixIcon: widget.isPassword
            ? IconButton(
                onPressed: () {
                  setState(() {
                    visible = !visible;
                  });
                },
                icon: visible
                    ? Icon(Icons.visibility)
                    : Icon(Icons.visibility_off),
                color: Color(0xff7B7B7B))
            : null,
      ),
      obscureText: widget.isPassword ? !visible : false,
    );
  }
}
