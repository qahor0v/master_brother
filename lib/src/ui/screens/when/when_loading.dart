// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:master_brother/src/utils/constants/assets_paths.dart';

class WhenLoading extends StatelessWidget {
  String value;

  WhenLoading({
    Key? key,
    this.value = '',
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Lottie.asset(MyAssets.loading),
    );
  }
}
