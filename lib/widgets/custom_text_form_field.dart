import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  CustomTextFormField(
      {super.key,
        this.borderRadius = 6,
        this.validator,
        this.hintText = " ",
        this.controller,
        //this.image,
        this.suffixIcon,
        this.obscureText = false,
        this.hintStyle,
        this.preffixIcon});

  TextEditingController? controller;
  double? borderRadius;
  dynamic validator;
  String? hintText;
  Widget? suffixIcon, preffixIcon;
  bool? obscureText;
  TextStyle? hintStyle;

  @override
  Widget build(BuildContext context) {
    return Container(
      // ignore: sort_child_properties_last
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: TextFormField(
          controller: controller,
          validator: validator,
          obscureText: obscureText!,
          decoration: InputDecoration(
            // filled: true,
            // fillColor: const Color(0xffF7F7F7),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(borderRadius!),
              //borderSide: BorderSide.none
            ),
            hintText: hintText,
            suffixIcon: suffixIcon,
            prefixIcon: preffixIcon,
            hintStyle: hintStyle,
          ),
        ),
      ),
    );
  }
}