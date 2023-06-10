import 'package:flutter/material.dart';
import 'package:master_brother/src/utils/constants/app_colors.dart';

class AppButton extends StatelessWidget {
  final String title;
  final Color color;
  final void Function() onTap;

  const AppButton({
    super.key,
    this.color = mainColor,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: MaterialButton(
        onPressed: onTap,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
            side: const BorderSide(
              width: 1.0,
              color: mainColor,
            )),
        color: color,
        minWidth: 250,
        child: Text(
          title.toUpperCase(),
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
