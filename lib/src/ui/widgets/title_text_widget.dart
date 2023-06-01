import 'package:flutter/material.dart';

class TitleText extends StatelessWidget {
  final String title;
  final bool isSliver;
  const TitleText({
    super.key,
    required this.title,
    this.isSliver = true,
  });

  @override
  Widget build(BuildContext context) {
    if (isSliver) {
      return SliverToBoxAdapter(
        child: Text(
          title,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
      );
    } else {
      return Text(
        title,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 24,
          fontWeight: FontWeight.w600,
        ),
      );
    }
  }
}
