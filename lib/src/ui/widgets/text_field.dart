import 'package:flutter/material.dart';
import 'package:master_brother/src/utils/constants/app_colors.dart';

class MyTextField extends StatelessWidget {
  final TextEditingController controller;
  final bool forPassword;
  final String title;
  const MyTextField({
    super.key,
    required this.controller,
    required this.title,
    this.forPassword = true,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
        left: 12,
        right: 12,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6.0),
        border: Border.all(color: secondaryColor),
      ),
      child: TextField(
        cursorColor: mainColor,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: title,
          hintStyle: TextStyle(
            color: Colors.grey.shade600,
            fontWeight: FontWeight.w400,
          ),
        ),
        style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w600,
        ),
        controller: controller,
      ),
    );
  }
}
