// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:master_brother/src/utils/constants/assets_paths.dart';

class WhenError extends StatelessWidget {
  String value;
  WhenError({super.key, this.value = ''});

  @override
  Widget build(BuildContext context) {
    return Lottie.asset(MyAssets.error);
  }
}
