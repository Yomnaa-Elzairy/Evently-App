import 'package:flutter/material.dart';

class CustomTextfield extends StatefulWidget {
  final Icon? prefix;
  final String hintText;
  final bool isPassword;
  final TextEditingController controller;
  final int maxLines;

  const CustomTextfield(
      {super.key,
       this.prefix,
      required this.hintText,
      required this.isPassword,
      required this.controller,
      this.maxLines=1
      });

  @override
  State<CustomTextfield> createState() => _CustomTextfieldState();
}

class _CustomTextfieldState extends State<CustomTextfield> {
  bool visible = false;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "Cant be empty";
        }
        return null;
      },
      maxLines: widget.maxLines,
      controller: widget.controller,
      decoration: InputDecoration(
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(color: Colors.red),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(color: Colors.red),
        ),
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
        prefixIcon: widget.prefix,
        // Icon(
        //   widget.prefix,
        //   color: Color(0xff7B7B7B),
        // ),
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
