// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class HBox extends StatelessWidget {
  double height;
  HBox(this.height, {super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
    );
  }
}

class WBox extends StatelessWidget {
  double width;
  WBox(this.width, {super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
    );
  }
}
