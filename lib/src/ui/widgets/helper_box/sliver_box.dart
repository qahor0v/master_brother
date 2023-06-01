// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
class SBox extends StatelessWidget {
  double height;
  SBox(this.height, {super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: SizedBox(
        height: height,
      ),
    );
  }
}
