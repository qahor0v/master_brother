import 'package:flutter/material.dart';
import 'package:master_brother/src/utils/constants/app_colors.dart';

class AppButton extends StatelessWidget {
  final String title;
  final void Function() onTap;
  const AppButton({
    super.key,
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
        ),
        color: mainColor,
        minWidth: 250,
        child: Text(title),
      ),
    );
  }
}
