import 'package:flutter/cupertino.dart';

bool check(ValueNotifier<TextEditingController> controller) {
  return controller.value.text.isNotEmpty;
}
