import 'package:flutter/material.dart';
import 'package:online_course/theme/color.dart';

class CustomTextBox extends StatelessWidget {
  CustomTextBox({
    Key? key,
    this.hint = "",
    this.prefix,
    this.suffix,
    this.controller,
    this.readOnly = false,
  }) : super(key: key);

  final String hint;
  final Widget? prefix;
  final Widget? suffix;
  final bool readOnly;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.only(bottom: 3),
      height: 40,
      decoration: BoxDecoration(
        color: AppColor.textBoxColor,
        border: Border.all(color: AppColor.textBoxColor),
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: AppColor.shadowColor.withOpacity(0.05),
            spreadRadius: .5,
            blurRadius: .5,
            offset: Offset(0, 1),
          ),
        ],
      ),
      child: TextField(
        readOnly: readOnly,
        controller: controller,
        decoration: InputDecoration(
          prefixIcon: prefix,
          suffixIcon: suffix,
          border: InputBorder.none,
          hintText: hint,
          hintStyle: TextStyle(
            color: Colors.grey,
            fontSize: 15,
          ),
        ),
      ),
    );
  }
}
