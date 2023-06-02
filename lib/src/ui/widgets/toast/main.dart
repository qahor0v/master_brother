import 'package:flutter/material.dart';
import 'package:master_brother/src/ui/widgets/toast/error.dart';
import 'package:master_brother/src/ui/widgets/toast/info.dart';
import 'package:master_brother/src/ui/widgets/toast/success.dart';

class ScaffoldMessage {
  static void info(BuildContext context, {required String message}) {
    ScaffoldMessenger.of(context).showSnackBar(
      infoSnackBar(message),
    );
  }

  static void error(BuildContext context, {required String message}) {
    ScaffoldMessenger.of(context).showSnackBar(
      errorSnackBar(message),
    );
  }

  static void success(BuildContext context, {required String message}) {
    ScaffoldMessenger.of(context).showSnackBar(
      successSnackBar(message),
    );
  }
}
