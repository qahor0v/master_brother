import 'package:flutter/material.dart';
import 'package:master_brother/src/utils/constants/app_colors.dart';

class AppTextField extends StatelessWidget {
  final TextEditingController controller;
  final String title;
  final TextInputType? type;

  const AppTextField({
    super.key,
    required this.controller,
    required this.title,
    this.type,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8.0),
      padding: const EdgeInsets.only(left: 12.0, right: 12.0),
      decoration: BoxDecoration(
        border: Border.all(
          color: mainColor,
        ),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: TextField(
        controller: controller,
        cursorColor: mainColor,
        decoration: InputDecoration(
          hintText: title,
          hintStyle: const TextStyle(
            color: Colors.white54,
            fontWeight: FontWeight.w400,
          ),
          border: InputBorder.none,
        ),
        style: const TextStyle(
          color: Colors.white,
          fontSize: 15,
          fontWeight: FontWeight.w400,
        ),
        keyboardType: type,
      ),
    );
  }
}
