 import 'package:flutter/material.dart';

void pop(BuildContext context) {
  Navigator.pop(context);
}

void goTo(BuildContext context, Widget widget) {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (_) {
        return widget;
      },
    ),
  );
}


