import 'package:flutter/material.dart';
import 'package:master_brother/src/ui/screens/when/when_loading.dart';

void loadingDialog(BuildContext context) {
  showDialog(
      context: context,
      builder: (context) {
        return WhenLoading();
      });
}
